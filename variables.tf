variable "region" {
  type        = string
  description = "The IBM Cloud region where the cluster will be/has been installed."
  default     = "eu-gb"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api token"
}

variable "sysdig" {
  type = object({
    name = string
    plan = string
  })
  default = {
    name = "sysdig"
    plan = "lite"
  }
}