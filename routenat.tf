resource "oci_core_route_table" "routenat" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "routenat"
  route_rules {
    network_entity_id = oci_core_nat_gateway.Nat.id
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
  }
}