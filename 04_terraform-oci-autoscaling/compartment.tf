resource "oci_identity_compartment" "CCCCompartment" {
  name = "CCCCompartment"
  description = "CCC Compartment"
  compartment_id = var.compartment_ocid
}
