

resource "oci_core_subnet" "subnet1" {
  cidr_block = var.subnet1-cidr
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "subnet1"
  route_table_id = oci_core_route_table.routenat.id
  security_list_ids = [
    oci_core_security_list.security-list.id,oci_core_security_list.ssh-security-list.id]
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions.id
}