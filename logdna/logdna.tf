terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.26.2"
    }
  }
}

variable "logdna" {}
variable "region" {}

resource "ibm_resource_instance" "logdna_instance" {
  name              = var.logdna.name
  service           = "logdna"
  plan              = var.logdna.plan
  location          = var.region

    parameters = {
      default_receiver: true
    }
}

