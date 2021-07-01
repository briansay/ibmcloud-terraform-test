terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.26.2"
    }
  }
}

variable "activity_tracker" {}
variable "region" {}

resource "ibm_resource_instance" "at_instance" {
  name              = var.activity_tracker.name
  service           = "logdnaat"
  plan              = var.activity_tracker.plan
  location          = var.region

}