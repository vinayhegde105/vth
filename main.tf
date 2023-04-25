variable "region" {}
variable "ami" {}
variable "instance_type" {}
variable "tags" {}

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = var.region
}

resource "aws_instance" "EC2Instance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "vth"
    availability_zone = "us-east-1d"
    tenancy = "default"
    subnet_id = "subnet-0610a377e65a0067a"
    ebs_optimized = false
    vpc_security_group_ids = [
        "sg-0732f06ad2c3baa21"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 8
        volume_type = "gp2"
        delete_on_termination = true
    }
    tags = {
        Name = var.tags
    }
}
