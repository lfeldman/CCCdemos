# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_images" "InstanceImageOCID" {
  compartment_id           = var.compartment_ocid
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}

data "oci_core_vnic_attachments" "CCCWebserver1_VNIC1_attach" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[1], "name")
  compartment_id = oci_identity_compartment.CCCCompartment.id
  instance_id = oci_core_instance.CCCWebserver1.id
}

data "oci_core_vnic" "CCCWebserver1_VNIC1" {
  vnic_id = data.oci_core_vnic_attachments.CCCWebserver1_VNIC1_attach.vnic_attachments.0.vnic_id
}
