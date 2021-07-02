terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.27.1"
    }
  }

  required_version = ">= 0.14.0"
}