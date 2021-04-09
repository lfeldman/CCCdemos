resource "oci_core_instance" "CCCWebserver1" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[1], "name")
  compartment_id = oci_identity_compartment.CCCCompartment.id
  display_name = "CCCWebServer1"
#  shape = "VM.Standard2.1"
  shape = "VM.Standard.E3.Flex"
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.InstanceImageOCID.images[0].id
  }
  metadata = {
      ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
  }
  create_vnic_details {
     subnet_id = oci_core_subnet.CCCWebSubnet.id
     assign_public_ip = true 
  }
  shape_config {
#      memory_in_gbs = 1
     memory_in_gbs = 10
#      ocpus = 1
     ocpus = 2
  }
}

