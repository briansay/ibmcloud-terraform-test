resource "ibm_iam_access_group" "accgrp_admin" {
  name        = var.admin_group_name
  description = "DO NOT DELETE: Admin access group with full account privileges"
}

resource "ibm_iam_access_group_policy" "services_admin_group_policy" {
  access_group_id = ibm_iam_access_group.accgrp_admin.id
  roles           = ["Viewer", "Operator", "Editor", "Administrator", "Reader", "Writer", "Manager"]
}

resource "ibm_iam_access_group_policy" "account_management_admin_policy" {
  access_group_id    = ibm_iam_access_group.accgrp_admin.id
  roles              = ["Viewer", "Operator", "Editor", "Administrator"]
  account_management = true
}

resource "ibm_iam_access_group_members" "accgrp_admin_members" {
  access_group_id = ibm_iam_access_group.accgrp_admin.id
  ibm_ids         = var.admin_users

  depends_on = [ibm_iam_user_invite.invite_user]
}

data "ibm_resource_group" "group" {
  name = "default"
}

resource "ibm_iam_access_group_policy" "policy" {
  access_group_id = ibm_iam_access_group.accgrp_admin.id
  roles           = ["Viewer", "Operator", "Editor", "Administrator"]

  resources {
    resource_type = "resource-group"
  }
}

resource "ibm_iam_user_invite" "invite_user" {
  users         = var.admin_users
  access_groups = [ibm_iam_access_group.accgrp_admin.id]
}
