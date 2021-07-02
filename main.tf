# module "access_group" {
#   source = "./access_group"
# }

module "access_group" {
  source      = "./access_group"
  admin_users = var.admin_users
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