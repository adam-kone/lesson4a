resource "oci_core_vcn" "vnc" {
  cidr_block = var.vcn-cidr
  compartment_id = var.compartment_id
  display_name = var.vnc-name
}