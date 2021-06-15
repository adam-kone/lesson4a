resource "oci_core_instance" "webserver2" {
  availability_domain = var.ads[1]
  compartment_id = var.compartment_id
  shape = var.shapes
  fault_domain = "FAULT-DOMAIN-2"
  display_name = "webserver2"
  source_details {
    source_id = var.images
    source_type = "image"
  }
  create_vnic_details {
    subnet_id = oci_core_subnet.subnet1.id
    assign_public_ip = false
    nsg_ids = [oci_core_network_security_group.websg.id]
  }
  metadata = {
    ssh_authorized_keys= "${file("${var.ssh_authorized_keys}")}"
  }

}

data "oci_core_vnic_attachments" "vnic-attachment2" {
  compartment_id = var.compartment_id
  availability_domain = var.ads[1]
  instance_id = oci_core_instance.webserver2.id
}

data "oci_core_vnic" "webserver2-vnic" {
  vnic_id = data.oci_core_vnic_attachments.vnic-attachment2.0.vnic_id
}

output "webserver_publicip" {
  value = [data.oci_core_vnic.webserver2-vnic.public_ip_address]
}