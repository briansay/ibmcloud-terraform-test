module "logdna" {
  source = "./logdna"
  logdna = {
    name = var.logdna.name
    plan = var.logdna.plan
  }
  region = var.region
}