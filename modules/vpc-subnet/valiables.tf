variable "vpc_id" {
    description = "set vpc id"
    type = string
}

// reference | https://github.com/davidcsi/terraform/blob/master/healthchecks/main.tf
variable "subnet-az-list" {
    description = "Subnet available zone & cidr"
    type = map(map(string))
}


variable "public_ip_on" {
  type = bool
}

