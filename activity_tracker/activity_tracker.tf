resource "ibm_resource_instance" "at_instance" {
  name              = var.activity_tracker.name
  service           = "logdnaat"
  plan              = var.activity_tracker.plan
  location          = var.region

}