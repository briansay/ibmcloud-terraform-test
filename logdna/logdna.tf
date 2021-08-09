resource "ibm_resource_instance" "logdna_instance" {
  name     = var.logdna.name
  service  = "logdna"
  plan     = var.logdna.plan
  location = var.region

  parameters = {
    default_receiver : true
  }
}

resource "ibm_resource_key" "logdna_instance_key" {
  name                 = "manager-key-1"
  resource_instance_id = ibm_resource_instance.logdna_instance.id
  role                 = "Manager"
}
