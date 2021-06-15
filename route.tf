resource "oci_core_route_table" "route" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "route"
  route_rules {
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}