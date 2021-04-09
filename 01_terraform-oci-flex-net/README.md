# 01_terraform-oci-flex-net

## Deploy Using the Terraform CLI

### Clone of the repo
Now, you'll want a local copy of this repo. You can make that with the commands:

Clone the repo from GitHub.com by executing the command as follows and then go to proper subdirectory:

```
Lukaszs-MacBook-Pro:~ lukaszfeldman$ git clone https://github.com/lfeldman/CCCdemos.git

Lukaszs-MacBook-Pro:~ lukaszfeldman$ cd CCCdemos/

Lukaszs-MacBook-Pro:CCCdemos lukaszfeldman$ cd 01_terraform-oci-flex-net/

```

### Prerequisites
Create environment file with TF_VARs:

```
Lukaszs-MacBook-Pro:01_terraform-oci-flex-net lukaszfeldman$ vi terraform.tfvars

# Authentication
tenancy_ocid         = "ocid1.tenancy.oc1..aaa(...)t4h4pwz7nwbfxoyd4q"
user_ocid            = "ocid1.user.oc1..aaa(...)p3asvynf2gpjx6q"
fingerprint          = "00:(...)82:47:e6:00"
private_key_path     = "/Users/lukaszfeldman/.oci/oci_api_key.pem"

# Region
region = "us-ashburn-1"

# Compartment
compartment_ocid = "ocid1.compartment.oc1..aaaa(...)3tbc4ua"
```

### Create the Resources
Run the following commands:

```
Lukaszs-MacBook-Pro:01_terraform-oci-flex-net lukaszfeldman$ terraform init

Lukaszs-MacBook-Pro:01_terraform-oci-flex-net lukaszfeldman$ terraform plan

Lukaszs-MacBook-Pro:01_terraform-oci-flex-net lukaszfeldman$ terraform apply
```

### Destroy the Deployment
When you no longer need the deployment, you can run this command to destroy the resources:

```
Lukaszs-MacBook-Pro:01_terraform-oci-flex-net lukaszfeldman$ terraform destroy
```
