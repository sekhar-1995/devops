terraform {
required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
}
}
        required_version = ">= 1.2.0"
}

provider "aws" {
region = "ap-south-1"
}

locals {
  instances = {"subham":"ami-09ba48996007c8b50","abrar":"ami-0f8ca728008ff5af4","sajal":"ami-09ba48996007c8b50","samar":"ami-0f8ca728008ff5af4"}
}

resource "aws_instance" "my_ec2_instance" {
        for_each = local.instances
        ami = each.value
        instance_type = "t2.micro"
        tags = {
               Name = each.key
    }

}


