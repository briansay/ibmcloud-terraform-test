resource "ibm_iam_access_group" "accgrp_admin" {
  name        = "Admin_Generated"
  description = "Terraform Generated Admin Group"
}

resource "ibm_iam_access_group_policy" "services_admin_group_policy" {
    access_group_id = ibm_iam_access_group.accgrp_admin.id
    roles = ["Viewer","Operator","Editor", "Administrator", "Reader", "Writer", "Manager"]
}

resource "ibm_iam_access_group_policy" "account_management_admin_policy" {
  access_group_id = ibm_iam_access_group.accgrp_admin.id
  roles = [ "Viewer","Operator","Editor", "Administrator" ]
  account_management = true
}