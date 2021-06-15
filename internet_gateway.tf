resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "igw"
}