terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = var.version
    }
  }
}