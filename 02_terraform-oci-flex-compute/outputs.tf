output "CCCWebserver1PublicIP" {
   value = [data.oci_core_vnic.CCCWebserver1_VNIC1.public_ip_address]
}
