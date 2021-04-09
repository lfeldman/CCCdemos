resource "oci_core_security_list" "CCCWebSecurityList" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    display_name = "CCCWebSecurityList"
    vcn_id = oci_core_virtual_network.CCCVCN.id
    
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = var.webservice_ports
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
        protocol = "6"
        source = var.VCN-CIDR
    }
}

resource "oci_core_security_list" "CCCSSHSecurityList" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    display_name = "CCCSSHSecurityList"
    vcn_id = oci_core_virtual_network.CCCVCN.id
    
    egress_security_rules {
        protocol = "6"
        destination = "0.0.0.0/0"
    }
    
    dynamic "ingress_security_rules" {
    for_each = var.bastion_ports
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
        protocol = "6"
        source = var.VCN-CIDR
    }
}
