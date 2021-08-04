resource "ibm_is_vpc" "vpc1" {
  name = var.vpc_name
}

resource "ibm_is_subnet" "subnet1" {
  name                     = join("-", ["${var.vpc_name}", "subnet-1"])
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = join("-", ["${var.region}", "1"])
  total_ipv4_address_count = var.total_ipv4_address_count
  public_gateway           = ibm_is_public_gateway.pub_gate1.id
}

resource "ibm_is_public_gateway" "pub_gate1" {
  name = "pub-gateway"
  vpc  = ibm_is_vpc.vpc1.id
  zone = join("-", ["${var.region}", "1"])
}
