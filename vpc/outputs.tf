output "vpc_id" {
  value = ibm_is_vpc.vpc1.id
}

output "vpc_subnet1_id" {
  value = ibm_is_subnet.subnet1.id
}
