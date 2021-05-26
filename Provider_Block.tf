
/*

If you do not specify the version it will use the latest. You have the conditional operator gretaer than or equal to >= 
or The ~> operator is a convenient shorthand for allowing only patch releases within a specific minor release. 

NOTE!
The version argument in provider configurations is deprecated. In Terraform 0.13 and later, version constraints should always 
be declared in the required_providers block. The version argument will be removed in a future version of Terraform.

Further info:
https://www.terraform.io/docs/language/providers/configuration.html

*/

provider "aws" {
    version = "~> 2.0"
    region = "eu-west-2"
}
