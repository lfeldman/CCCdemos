resource "oci_core_virtual_network" "CCCVCN" {
  cidr_blocks = var.VCN-CIDRs
  dns_label = "CCCVCN"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  display_name = "CCCVCN"
}

resource "oci_core_subnet" "CCCWebSubnet" {
  cidr_block = "10.0.1.0/24"
  display_name = "CCCWebSubnet"
  dns_label = "CCCN1"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  vcn_id = oci_core_virtual_network.CCCVCN.id
  route_table_id = oci_core_route_table.CCCRouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.CCCDhcpOptions1.id
  security_list_ids = [oci_core_security_list.CCCSecurityList.id]
}


