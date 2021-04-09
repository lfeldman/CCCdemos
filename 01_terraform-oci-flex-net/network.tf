resource "oci_core_virtual_network" "CCCVCN" {
  cidr_blocks    = var.VCN-CIDRs
  dns_label      = "CCCVCN"
  compartment_id = oci_identity_compartment.CCCCompartment.id
  display_name   = "CCCVCN"
}

resource "oci_core_subnet" "CCCBackendSubnet" {
  cidr_block        = var.BackendSubnet-CIDR 
  display_name      = "CCCBackendSubnet"
  dns_label         = "CCCN2"
  compartment_id    = oci_identity_compartment.CCCCompartment.id
  vcn_id            = oci_core_virtual_network.CCCVCN.id
  route_table_id    = oci_core_route_table.CCCRouteTableViaNAT.id
  dhcp_options_id   = oci_core_dhcp_options.CCCDhcpOptions1.id
  security_list_ids = [oci_core_security_list.CCCSecurityList2.id]
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_subnet" "CCCWebSubnet" {
  cidr_block        = var.WebSubnet-CIDR
  display_name      = "CCCWebSubnet"
  dns_label         = "CCCN1"
  compartment_id    = oci_identity_compartment.CCCCompartment.id
  vcn_id            = oci_core_virtual_network.CCCVCN.id
  route_table_id    = oci_core_route_table.CCCRouteTableViaIGW.id
  dhcp_options_id   = oci_core_dhcp_options.CCCDhcpOptions1.id
  security_list_ids = [oci_core_security_list.CCCSecurityList1.id]
}

