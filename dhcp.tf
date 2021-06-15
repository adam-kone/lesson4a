resource "oci_core_dhcp_options" "DhcpOptions" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "DhcpOptions"
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}