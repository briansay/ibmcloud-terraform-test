# module "access_group" {
#   source = "./access_group"
# }

module "access_group" {
  source      = "./access_group"
  admin_users = var.admin_users
}