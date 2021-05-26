terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
    region  = "eu-west-2"
}

resource "aws_instance" "Demo" {
    ami = "ami-0ad8ecac8af5fc52b" #<-- Free tier
    instance_type = "t2.micro" #<-- Free tier
    // Adding a tag to our instance
    tags = {
        Name = "Demo"
    }
}
