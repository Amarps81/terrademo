variable "vpc_id" {
  description = "The VPC ID where the subnets will be created"
  type        = string
}

variable "subnets" {
  description = "A list of subnet configurations to create"
  type = list(object({
    cidr_block             = string
    availability_zone      = string
    map_public_ip_on_launch = bool
    tags                   = map(string)
  }))
}

variable "name_prefix" {
  description = "Prefix used for subnet name tags"
  type        = string
}