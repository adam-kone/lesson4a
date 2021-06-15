resource "oci_core_network_security_group" "websg" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "nsg"
}

resource "oci_core_network_security_group" "sshsg" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "sshsg"
}