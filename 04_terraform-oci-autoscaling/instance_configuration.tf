resource "oci_core_instance_configuration" "CCCWebserverInstanceConfiguration" {
    compartment_id = oci_identity_compartment.CCCCompartment.id
    display_name = "CCCInstanceWebserverConfiguration"
    instance_id = oci_core_instance.CCCWebserver.id
    source = "INSTANCE"
}
