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

module "vpc" {
  source                   = "./vpc"
  region                   = var.region
  vpc_name                 = var.vpc.name
  total_ipv4_address_count = var.vpc.total_ipv4_address_count
}

module "roks" {
  source           = "./roks"
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.vpc_subnet1_id
  region           = var.region
  roks             = var.roks
  logdna_name      = module.logdna.logdna_name
  logdna_key       = module.logdna.logdna_key
  ibmcloud_api_key = var.ibmcloud_api_key
}
