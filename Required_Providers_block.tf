
/*
This is the new way of defining the providers you want to deploy inrastructure to. 

NOTE!
The version argument in provider configurations is deprecated. In Terraform 0.13 and later, version constraints should always 
be declared in the required_providers block. The version argument will be removed in a future version of Terraform.

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