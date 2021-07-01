# module "access_group" {
#   source = "./access_group"
# }

module "sysdig" {
  source = "./sysdig"

  sysdig = var.sysdig

  region = var.region
}