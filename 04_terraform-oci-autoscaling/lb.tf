resource "oci_load_balancer_load_balancer" "CCCPublicLoadBalancer" {
  compartment_id = oci_identity_compartment.CCCCompartment.id 
  
  display_name   = "CCCFlexPublicLB"
  subnet_ids     = [
    oci_core_subnet.CCCLBSubnet.id
  ]

  shape          = "flexible"
  shape_details {
    minimum_bandwidth_in_mbps = 10
    maximum_bandwidth_in_mbps = 100
  }

}

resource "oci_load_balancer_backendset" "CCCPublicLoadBalancerBackendset" {
  name             = "CCCPublicLBBackendset"
  load_balancer_id = oci_load_balancer_load_balancer.CCCPublicLoadBalancer.id
  policy           = "ROUND_ROBIN"

  health_checker {
    port     = "80"
    protocol = "HTTP"
    response_body_regex = ".*"
    url_path = "/"
    interval_ms = "3000"
  }
}


resource "oci_load_balancer_listener" "CCCPublicLoadBalancerListener" {
  load_balancer_id         = oci_load_balancer_load_balancer.CCCPublicLoadBalancer.id
  name                     = "CCCPublicLoadBalancerListener"
  default_backend_set_name = oci_load_balancer_backendset.CCCPublicLoadBalancerBackendset.name
  port                     = 80
  protocol                 = "HTTP"
}


resource "oci_load_balancer_backend" "CCCPublicLoadBalancerBackend" {
  load_balancer_id = oci_load_balancer_load_balancer.CCCPublicLoadBalancer.id
  backendset_name  = oci_load_balancer_backendset.CCCPublicLoadBalancerBackendset.name
  ip_address       = oci_core_instance.CCCWebserver.private_ip
  port             = 80 
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}



