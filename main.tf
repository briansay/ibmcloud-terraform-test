# module "access_group" {
#   source = "./access_group"
# }

module "sysdig" {
  source = "./sysdig"

  sysdig = var.sysdig
  region = var.region
}

module "logdna" {
  source = "./logdna"
  logdna = {
    name = var.logdna.name
    plan = var.logdna.plan
  }
  region = var.region
}