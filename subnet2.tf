

resource "oci_core_subnet" "subnet2" {
  cidr_block = var.subnet2-cidr
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "subnet2"
  route_table_id = oci_core_route_table.routevianat.id
  security_list_ids = [
    oci_core_security_list.ssh-security-list.id]
  dhcp_options_id = oci_core_dhcp_options.DhcpOptions.id
}