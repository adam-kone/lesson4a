resource "oci_load_balancer" "lb" {
  shape          = var.load_balancer_shape
  compartment_id = var.compartment_id
  subnet_ids     = [oci_core_subnet.subnet1.id]
  display_name   = "lb"
  network_security_group_ids = [oci_core_network_security_group.websg.id]
}

resource "oci_load_balancer_listener" "lbs_listener" {
  #Required
  default_backend_set_name = oci_load_balancer_backend_set.backend_set.name
  load_balancer_id         = oci_load_balancer.lb.id
  name                     = "lbs_listener"
  port                     = 80
  protocol                 = "HTTP"

}

resource "oci_load_balancer_backend_set" "backend_set" {
  #Required
  health_checker {
    #Required
    protocol            = var.listener_protocol
    port                = var.listener_port
    url_path            = "/"
    response_body_regex = ".*"
  }
  load_balancer_id = oci_load_balancer.lb.id
  name             = "backend_set"
  policy           = var.backend_set_policy
}

resource "oci_load_balancer_backend" "server_backend1" {
  #Required
  backendset_name  = oci_load_balancer_backend_set.backend_set.name
  ip_address       = oci_core_instance.webserver.private_ip
  load_balancer_id = oci_load_balancer.lb.id
  port             = var.listener_port

  #Optional
  backup  = false
  drain   = false
  offline = false
  weight  = 1
}

resource "oci_load_balancer_backend" "server_backend2" {
  #Required
  backendset_name  = oci_load_balancer_backend_set.backend_set.name
  ip_address       = oci_core_instance.webserver2.private_ip
  load_balancer_id = oci_load_balancer.lb.id
  port             = var.listener_port

  #Optional
  backup  = false
  drain   = false
  offline = false
  weight  = 1
}


output "lb_public_ip" {
  value = [oci_load_balancer.lb.ip_addresses]
}