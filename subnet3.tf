

resource "oci_core_subnet" "subnet3" {
  cidr_block = var.subnet3-cidr
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "subnet3"
  route_table_id = oci_core_route_table.routevianat.id
##  security_list_ids = [
##    oci_core_security_list.security-list.id]
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions.id
}