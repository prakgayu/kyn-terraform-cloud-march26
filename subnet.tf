resource "aws_subnet" "sky_subnet" {
  vpc_id = aws_vpc.sky_vpc.id #this subnet need to map with my vpc
  #awsvpc-refrencebloc-id
  for_each                = zipmap(var.azs, var.subnet_cidrs) #it will create 3 subnet in 3 different availability zone with the respective cidr block
  availability_zone       = each.key                          #it will pick up the az
  cidr_block              = each.value                        #it will pick up the subnet cidr block
  map_public_ip_on_launch = true
  tags = {
    Name = "prak-public-subnet-${each.key}" #it will create the name of the subnet with the respective availability zone
  }
}

##change my name to your name
#modify provider.tf file delete everything and add this 
##using terraform we will create instance in aaws
#provider will be aws
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region #here also we are calling region
}