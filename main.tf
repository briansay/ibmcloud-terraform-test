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
}