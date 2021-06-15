resource "oci_core_instance" "webserver" {
  availability_domain = var.ads[0]
  compartment_id = var.compartment_id
  fault_domain = "FAULT-DOMAIN-1"
  shape = var.shapes
  display_name = "webserver"
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
data "oci_core_vnic_attachments" "web-vnic-attachment1" {
  compartment_id = var.compartment_id
  availability_domain = var.ads[0]
  instance_id = oci_core_instance.webserver.id
}

data "oci_core_vnic" "webserver-vnic" {
  vnic_id = data.oci_core_vnic_attachments.web-vnic-attachment1.vnic_attachments.0.vnic_id

}

output "webserver_publicip" {
  value = [data.oci_core_vnic.webserver-vnic.public_ip_address]
}