resource "oci_core_instance_pool" "CCCInstancePool" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    instance_configuration_id = oci_core_instance_configuration.CCCWebserverInstanceConfiguration.id  
    placement_configurations {
        availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0], "name")
        primary_subnet_id = oci_core_subnet.CCCWebSubnet.id

    }
    size = "2"
    display_name = "CCCInstancePool"
    load_balancers {
        backend_set_name = oci_load_balancer_backendset.CCCPublicLoadBalancerBackendset.name
        load_balancer_id = oci_load_balancer_load_balancer.CCCPublicLoadBalancer.id
        port = "80"
        vnic_selection = "PrimaryVnic"
    }
}
