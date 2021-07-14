module "sysdig" {
  source = "./sysdig"
  sysdig = var.sysdig
  region = var.region
}

module "access_group" {
  source           = "./access_group"
  admin_users      = var.admin_users
  admin_group_name = var.admin_group_name
}

module "logdna" {
  source = "./logdna"
  logdna = {
    name = var.logdna.name
    plan = var.logdna.plan

  }
  region = var.region
}

module "activity_tracker" {
  source = "./activity_tracker"
  activity_tracker = {
    name = var.activity_tracker.name
    plan = var.activity_tracker.plan
  }
  region = var.region
}
