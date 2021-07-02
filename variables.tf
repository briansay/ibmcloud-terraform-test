variable "region" {
  type        = string
  description = "The IBM Cloud region where the cluster will be/has been installed."
  default     = "eu-gb"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api token"
}


variable "admin_users" {
  type        = list(string)
  description = "List of email addresses to add to admin group. (Case Sensitive)"
  default     = ["brian.say2@ibm.com"]


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

variable "admin_group_name" {
  type        = string
  description = "The name for the admin access group"
  default     = "Admin"
}