resource "oci_core_internet_gateway" "CCCInternetGateway" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    display_name = "CCCInternetGateway"
    vcn_id = oci_core_virtual_network.CCCVCN.id
}
