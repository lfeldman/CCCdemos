resource "oci_core_route_table" "CCCRouteTableViaIGW" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    vcn_id = oci_core_virtual_network.CCCVCN.id
    display_name = "CCCRouteTableViaIGW"
    route_rules {
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = oci_core_internet_gateway.CCCInternetGateway.id
    }
}

resource "oci_core_route_table" "CCCRouteTableViaNAT" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    vcn_id = oci_core_virtual_network.CCCVCN.id
    display_name = "CCCRouteTableViaNAT"
    route_rules {
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = oci_core_nat_gateway.CCCNATGateway.id
    }
}
