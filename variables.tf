variable "version" {
  default = "1.27.1"
}

variable "region" {
  type        = string
  description = "The IBM Cloud region where the cluster will be/has been installed."
  default = "eu-gb"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api token"
}

variable "logdna" {
  type = object({
  name    = string
  plan = string
  }) 
  default = {
    name = "Logging - Platform logs"
    plan = "30-day"
  }
}