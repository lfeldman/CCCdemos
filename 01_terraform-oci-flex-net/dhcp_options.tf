resource "oci_core_dhcp_options" "CCCDhcpOptions1" {
  compartment_id = oci_identity_compartment.CCCCompartment.id
  vcn_id = oci_core_virtual_network.CCCVCN.id
  display_name = "CCCDHCPOptions1"

  // required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type = "SearchDomain"
    search_domain_names = [ "cccdemo.com" ]
  }
}
