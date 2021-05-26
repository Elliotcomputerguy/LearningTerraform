/*
For further info use the following providers documentation to build a aws_instance. 
 https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

 The below is just a bare min configuration build. This will build an aws_instance. 
*/

provider "aws" {
    version = "~> 2.65"
    region  = "eu-west-2"
}

resource "aws_instance" "value" {
    ami = "ami-0ad8ecac8af5fc52b" #<-- Free tier
    instance_type = "t2.micro" #<-- Free tier
}
