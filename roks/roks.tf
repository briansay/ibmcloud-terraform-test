
//This is for testing purposes to use default resource group
//Should allow option to pass in parameter 
data "ibm_resource_group" "default-rg" {
  is_default = "true"
}

resource "ibm_resource_instance" "cos_roks" {
  name     = var.roks.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "global"
}

resource "ibm_container_vpc_cluster" "roks1" {
  name                 = var.roks.cluster_name
  vpc_id               = var.vpc_id
  kube_version         = var.roks.kube_version
  flavor               = var.roks.worker_node_flavour
  cos_instance_crn     = ibm_resource_instance.cos_roks.id
  resource_group_id    = data.ibm_resource_group.default-rg.id
  entitlement          = "cloud_pak"
  worker_count         = var.roks.worker_node_count
  force_delete_storage = true
  zones {
    subnet_id = var.subnet_id
    name      = join("-", ["${var.region}", "1"])
  }
}

resource "null_resource" "configure_logging" {
  provisioner "local-exec" {
    command     = "ibmcloud login --apikey ${var.ibmcloud_api_key} -r ${var.region} -a https://cloud.ibm.com && ibmcloud ob logging config create --cluster ${ibm_container_vpc_cluster.roks1.id} --instance \"${var.logdna_name}\" --logdna-ingestion-key ${var.logdna_key}"
    interpreter = ["/bin/bash", "-c"]
  }
}