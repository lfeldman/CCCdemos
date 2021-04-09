resource "oci_autoscaling_auto_scaling_configuration" "CCCThresholdAutoScalingConfiguration" {
    auto_scaling_resources {

        id = oci_core_instance_pool.CCCInstancePool.id
        type = "instancePool"
    }
    compartment_id = oci_identity_compartment.CCCCompartment.id
    
    policies {
        display_name = "CCCThresholdAutoScalingConfigurationPolicies"
        capacity {
            initial = "2"
            max = "4"
            min = "2"
        }

        policy_type = "threshold"
        
        rules {
            action {
                type = "CHANGE_COUNT_BY"
                value = "1"
            }
            display_name = "CCCThresholdAutoScalingConfigurationPoliciesScaleOutRule"
            metric {
                metric_type = "CPU_UTILIZATION"
                threshold {
                    operator = "GT"
                    value = "30"
                }
            }
        }

        rules {
            action {
                type  = "CHANGE_COUNT_BY"
                value = "-1"
            }
            display_name = "CCCThresholdAutoScalingConfigurationPoliciesScaleInRule"
            metric {
                metric_type = "CPU_UTILIZATION"
                threshold {
                    operator = "LT"
                    value = "10"
                }
            }
        }
    }
    cool_down_in_seconds = "300"
    display_name = "CCCThresholdAutoScalingConfiguration"
}

/*
resource "oci_autoscaling_auto_scaling_configuration" "CCCScheduledAutoScalingConfiguration" {
    auto_scaling_resources {

        id = oci_core_instance_pool.CCCInstancePool.id
        type = "instancePool"
    }
    compartment_id = oci_identity_compartment.CCCCompartment.id
    
    policies {
        display_name = "CCCScheduledAutoScalingConfigurationScaleOutPolicy"
        capacity {
            initial = "4"
            max = "4"
            min = "2"
        }
        policy_type = "scheduled"
        execution_schedule {
            # 12:00, 28/09/2020
            expression = "0 0 12 28 9 ? 2020"
            timezone   = "UTC"
            type       = "cron"
        }

    }

    policies {
        display_name = "CCCScheduledAutoScalingConfigurationScaleInPolicy"
        capacity {
            initial = "2"
            max = "2"
            min = "2"
        }
        policy_type = "scheduled"
        execution_schedule {
            # 12:15, 28/09/2020
            expression = "0 15 12 28 9 ? 2020"
            timezone   = "UTC"
            type       = "cron"
        }

    }

    cool_down_in_seconds = "300"
    display_name = "CCCScheduledAutoScalingConfiguration"
}
*/
