resource "aws_vpc" "sky_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "prak-vpc"
  }
}