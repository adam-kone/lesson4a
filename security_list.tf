
/*
resource "oci_core_security_list" "security-list" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_vcn.vnc.id
  display_name = "security-list"
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol = "6"
  }
  dynamic "ingress_security_rules" {
    for_each = var.service-ports
    content {
      protocol = "6"
      source = "0.0.0.0/0"
      tcp_options {
        max = ingress_security_rules.value
        min = ingress_security_rules.value
      }
    }
  }
  ingress_security_rules {
    protocol = 6
    source = var.vcn-cidr
  }
}
*/