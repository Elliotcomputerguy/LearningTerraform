
/*
Output values are like the return values of a Terraform module, and have several uses:

A child module can use outputs to expose a subset of its resource attributes to a parent module.
A root module can use outputs to print certain values in the CLI output after running terraform apply.
When using remote state, root module outputs can be accessed by other configurations via a terraform_remote_state data source.
Resource instances managed by Terraform each export attributes whose values can be used elsewhere in configuration. 
Output values are a way to expose some of that information to the user of your module.

best practice is to store the outputs in their own output.tf file. output.tf is auto loaded on run.
*/

resource "aws_instance" "name" {
    instance_type = "t2.micro"
    ami = "ami-0ad8ecac8af5fc52b"
}

output "foobar" {
    value = "value"
}

output "instance_ip" {
    value = aws_instance.name.public_ip
}

// Outputs are only rendered when Terraform applies your plan. Running terraform plan will not render outputs. You have to apply. 

// you can access them with following commands. terraform output / terraform output value

/*
  Optional arguments

  description = "The password for logging in to the database."
  sensitive   = true/force
*/