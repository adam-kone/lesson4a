resource "oci_core_nat_gateway" "Nat" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "Nat"
}