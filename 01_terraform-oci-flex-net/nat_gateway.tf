resource "oci_core_nat_gateway" "CCCNATGateway" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    display_name = "CCCNATGateway"
    vcn_id = oci_core_virtual_network.CCCVCN.id
}
