variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
variable "private_key_oci" {}
variable "public_key_oci" {}

variable "VCN-CIDRs" {
  type = list(string)
  default = ["10.0.0.0/16","192.168.0.0/16"]
#  default = ["10.0.0.0/16","192.168.0.0/24"] 
  }

variable "BackendSubnet-CIDR" {
#  default = "192.168.0.0/24"
  default = "192.168.0.0/30"
}

variable "WebSubnet-CIDR" {
  default = "10.0.0.0/24"
}

variable "VCNname" {
  default = "CCCVCN"
}

variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.9"
}

variable "service_ports" {
  default = [80,443,22]
}

