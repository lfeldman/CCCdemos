resource "oci_core_virtual_network" "CCCVCN" {
  cidr_block = var.VCN-CIDR
  dns_label = "CCCVCN"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  display_name = "CCCVCN"
}

resource "oci_core_subnet" "CCCWebSubnet" {
  cidr_block = "10.0.1.0/24"
  display_name = "CCCWebSubnet"
  dns_label = "CCCN2"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  vcn_id = oci_core_virtual_network.CCCVCN.id
  route_table_id = oci_core_route_table.CCCRouteTableViaNAT.id
  dhcp_options_id = oci_core_dhcp_options.CCCDhcpOptions1.id
}

resource "oci_core_subnet" "CCCLBSubnet" {
  cidr_block = "10.0.2.0/24"
  display_name = "CCCLBSubnet"
  dns_label = "CCCN1"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  vcn_id = oci_core_virtual_network.CCCVCN.id
  route_table_id = oci_core_route_table.CCCRouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.CCCDhcpOptions1.id
}

resource "oci_core_subnet" "CCCBastionSubnet" {
  cidr_block = "10.0.3.0/24"
  display_name = "CCCBastionSubnet"
  dns_label = "CCCN3"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  vcn_id = oci_core_virtual_network.CCCVCN.id
  route_table_id = oci_core_route_table.CCCRouteTableViaIGW.id
  dhcp_options_id = oci_core_dhcp_options.CCCDhcpOptions1.id
}


