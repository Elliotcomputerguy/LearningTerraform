
/*
Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration. 
Use of data sources allows a Terraform configuration to make use of information defined outside of Terraform, or defined 
by another separate Terraform configuration.
*/


data "aws_vpc" "name" {
    id = "" //if you know the vpc tag you can directly pass it in or from a variable var.name
}

data "aws_vpc" "name" {
    default = true //returns the default tag
}

data "aws_vpc" "name" {
    filter {
        name = "tag:Name" //<<-- tag = key 
        values = "value" //<-- key pair value
    }
}

data "aws_ami" "example" { //identify existing last used ami and return it via local name example.
    most_recent = true
}

resource "aws_instance" "name" {
    ami = data.aws_ami.example.id // access the value returned and build a new instance.
    tags = data.aws_vpc.name
}


/*
A data block requests that Terraform read from a given data source ("aws_ami") and export the result under the given local 
name ("example"). The name is used to refer to this resource from elsewhere in the same Terraform module, 
but has no significance outside of the scope of a module.
The data source and name together serve as an identifier for a given resource and so must be unique within a module.
*/

// You can also output these values if you choose

output "name" {
  value = data.aws_ami.example.id
}