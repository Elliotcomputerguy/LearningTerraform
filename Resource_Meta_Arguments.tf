
/*
count will iterate over the configuration block to the set value you assign to the count meta argument.
*/

resource "aws_instance" "name" {
    count = 2
    ami = "ami-0ad8ecac8af5fc52b"
    instance_type = "t2.micro"
    tags = {
        name = "demo ${count.index}" // this will create two instances with the name demo and the index value appended. 
                                     // like python it starts from 0.
    }
}

// to access on output after you have created more than one resource you can specify 
// how you would normally and a list will be returned. If you wanted to see the first instance and a attribute you can highlight 
// it by its index. You can also get attributes of each instance created using splat which is a wildcard [*]. Or you can use a for loop.


output "aws_instance_output" {
    value = aws_instance.name[0].attribute 
}

output "aws_instance_output" { //same result as below
    value = [for instance in aws_instance.name : instance.attribute]
}

output "aws_instance_output" { //same result as above
    value = aws_instance.name[*].attribute
}

/*
count are used for identical configuration. for_each allows you to create multiple different configurations.
*/

resource "aws_instance" "name" {
    for_each = {
      "loop1" = "t2.micro"
      "loop2" = "t2.large"
    }
    ami = "ami-0ad8ecac8af5fc52b"
    instance_type = each.value        //each is a keyword that is the itterative key
    tags = {
        name = "loop_test_${each.key}" //name each iteration with the key. So loop_test_loop1 & loop_test_loop2
    }
}

output "name" {
  value = aws_instance.name["loop1"].attribute // access the key name in the for_each each key to obtain data 
}

/*
providers allow you to override a default provider block
*/

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
  region = "eu-west-2"
}

provider "aws" {
    alias = "south"
    region = "eu-south-1"
}

resource "aws_instance" "name" {
    provider = aws.south //can also be placed inside a data source block
    ami = "ami-0ad8ecac8af5fc52b"
    instance_type = "t2.micro"
    tags = {
        name = "demo"
    }
}

