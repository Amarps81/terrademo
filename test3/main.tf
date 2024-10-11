provider "aws" {
  region = "us-east-1"
}

module "subnets" {
  source = "./modules/subnets"  # Or a remote source like a GitHub URL

  vpc_id      = "******"
  name_prefix = "prod-app"

  subnets = [
    {
      cidr_block             = "10.0.1.0/24"
      availability_zone      = "us-east-1a"
      map_public_ip_on_launch = true
      tags                   = { "Environment" = "Production" }
    },
    {
      cidr_block             = "10.0.2.0/24"
      availability_zone      = "us-east-1b"
      map_public_ip_on_launch = false
      tags                   = { "Environment" = "Production" }
    }
  ]
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-053b0d53c279acc90" # replace this
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-019ea91ed9b5252e7" # replace this
}