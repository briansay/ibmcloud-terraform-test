resource "ibm_resource_instance" "logdna_instance" {
  name              = var.logdna.name
  service           = "logdna"
  plan              = var.logdna.plan
  location          = var.region

    parameters = {
      default_receiver: true
    }
}

