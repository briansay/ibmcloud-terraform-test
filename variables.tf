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

  validation {
    condition = alltrue([
      for o in var.admin_users : can(regex(".+@.+\\..+", o))
    ])

    error_message = "Please make sure all emails are valid."
  }
}