# module "access_group" {
#   source = "./access_group"
# }

module "activity_tracker" {
  source = "./activity_tracker"
  activity_tracker = {
    name = var.activity_tracker.name
    plan = var.activity_tracker.plan
  }
  region = var.region
}