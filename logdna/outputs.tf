output "logdna_name" {
  value = ibm_resource_instance.logdna_instance.name
}

output "logdna_key" {
  value     = ibm_resource_key.logdna_instance_key.credentials["ingestion_key"]
  sensitive = true

}
