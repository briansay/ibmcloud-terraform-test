resource "ibm_resource_instance" "sysdig_instance" {
  name     = var.sysdig.name
  service  = "sysdig-monitor"
  plan     = var.sysdig.plan
  location = var.region
}