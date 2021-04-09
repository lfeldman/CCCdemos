resource "oci_load_balancer" "CCCFlexPublicLoadBalancer" {
  compartment_id = oci_identity_compartment.CCCCompartment.id 
  
  display_name   = "CCCFlexPublicLB"
  network_security_group_ids = [oci_core_network_security_group.CCCWebSecurityGroup.id]
  
  subnet_ids     = [
    oci_core_subnet.CCCLBSubnet.id
  ]

  #shape           = "10Mbps"
  shape          = "flexible"
  shape_details {
    minimum_bandwidth_in_mbps = 10
  #  maximum_bandwidth_in_mbps = 100
    maximum_bandwidth_in_mbps = 1000
  }
}

resource "oci_load_balancer_backendset" "CCCFlexPublicLoadBalancerBackendset" {
  name             = "CCCFlexLBBackendset"
  load_balancer_id = oci_load_balancer.CCCFlexPublicLoadBalancer.id
  policy           = "ROUND_ROBIN"

  health_checker {
    port     = "80"
    protocol = "HTTP"
    response_body_regex = ".*"
    url_path = "/"
  }
}


resource "oci_load_balancer_listener" "CCCFlexPublicLoadBalancerListener" {
  load_balancer_id         = oci_load_balancer.CCCFlexPublicLoadBalancer.id
  name                     = "CCCFlexLBListener"
  default_backend_set_name = oci_load_balancer_backendset.CCCFlexPublicLoadBalancerBackendset.name
  port                     = 80
  protocol                 = "HTTP"
}


resource "oci_load_balancer_backend" "CCCFlexPublicLoadBalancerBackend1" {
  count            = var.NumberOfNodes
  load_balancer_id = oci_load_balancer.CCCFlexPublicLoadBalancer.id
  backendset_name  = oci_load_balancer_backendset.CCCFlexPublicLoadBalancerBackendset.name
  ip_address       = oci_core_instance.CCCWebserver[count.index].private_ip
  port             = 80 
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}

output "CCCFlexPublicLoadBalancer_Public_IP" {
  value = [oci_load_balancer.CCCFlexPublicLoadBalancer.ip_addresses]
}

