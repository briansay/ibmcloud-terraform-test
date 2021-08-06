variable "region" {
  type        = string
  description = "The IBM Cloud region where everything will be installed."
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
    parameters = object({
      default_receiver : bool
    })
  })
  default = {
    name = "Sysdig - Platform Metrics"
    plan = "graduated-tier"
    parameters = {
      default_receiver : true,
    }
  }
}

variable "admin_users" {
  type        = list(string)
  description = "List of email addresses to add to admin group. (Case Sensitive)"
  default     = ["brian.say2@ibm.com", "tom.madelin@ibm.com"]


  validation {
    condition = alltrue([
      for o in var.admin_users : can(regex(".+@.+\\..+", o))
    ])

    error_message = "Please make sure all emails are valid. Use Terraform list format, e.g. [\"brian.say2@ibm.com\"]."
  }
}

variable "logdna" {
  type = object({
    name = string
    plan = string
  })
  default = {
    name = "Logging - Platform logs"
    plan = "30-day"
  }
}

variable "activity_tracker" {
  type = object({
    name = string
    plan = string
  })
  default = {
    name = "Activity Tracker - Audit"
    plan = "30-day"
  }
}
variable "admin_group_name" {
  type        = string
  description = "The name for the admin access group"
  default     = "Admin"
}

variable "vpc" {
  type = object({
    name                     = string
    total_ipv4_address_count = number
  })

  default = {
    name                     = "dev-vpc"
    total_ipv4_address_count = 1024
  }

}
