output "CCCPublicLoadBalancer_Public_IP" {
  value = [oci_load_balancer_load_balancer.CCCPublicLoadBalancer.ip_addresses]
}

output "CCCBastionServer_PublicIP" {
   value = [data.oci_core_vnic.CCCBastionServer_VNIC1.public_ip_address]
}

output "CCCWebserver_PrivateIP" {
   value = [data.oci_core_vnic.CCCWebserver_VNIC1.private_ip_address]
}

output "CCCInstancePool_size" {
   value = data.oci_core_instance_pool.CCCInstancePool.size
}

output "CCCInstancePool_instances" {
   value = data.oci_core_instance_pool_instances.CCCInstancePoolInstances.instances.*.display_name
}

output "generated_ssh_private_key" {
  value = tls_private_key.public_private_key_pair.private_key_pem
}