resource "oci_core_network_security_group" "CCCWebSecurityGroup" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    display_name = "CCCWebSecurityGroup"
    vcn_id = oci_core_virtual_network.CCCVCN.id
}

resource "oci_core_network_security_group" "CCCSSHSecurityGroup" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    display_name = "CCCSSHSecurityGroup"
    vcn_id = oci_core_virtual_network.CCCVCN.id
}
