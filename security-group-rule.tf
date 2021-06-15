resource "oci_core_network_security_group_security_rule" "websg-egressrule" {
  direction = "EGRESS"
  network_security_group_id = oci_core_network_security_group.websg.id
  protocol = "6"
  destination = "0.0.0.0/0"
  destination_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "websg-ingressrule" {
  for_each = toset(var.service-ports)

  direction = "INGRESS"
  network_security_group_id = oci_core_network_security_group.websg.id
  protocol = "6"
  source = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = each.value
      min = each.value
    }
  }
}

resource "oci_core_network_security_group_security_rule" "sshsg-egress" {
  direction = "EGRESS"
  network_security_group_id = oci_core_network_security_group.sshsg.id
  protocol = "6"
  destination = "0.0.0.0/0"
  destination_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "sshsg-ingress" {
  for_each = toset(var.bastion_ports)

  direction = "INGRESS"
  network_security_group_id = oci_core_network_security_group.sshsg.id
  protocol = "6"
  source = "0.0.0.0/0"
  source_type = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = each.value
      min = each.value
    }
  }
}