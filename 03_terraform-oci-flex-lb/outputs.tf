output "CCCWebservers_PrivateIP" {
   value = data.oci_core_vnic.CCCWebserver_VNIC1.*.private_ip_address
}

output "CCCBastionServer_PublicIP" {
   value = [data.oci_core_vnic.CCCBastionServer_VNIC1.public_ip_address]
}

output "generated_ssh_private_key" {
  value = tls_private_key.public_private_key_pair.private_key_pem
}
