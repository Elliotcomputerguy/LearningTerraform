
/*
A local value assigns a name to an expression, so you can use it multiple times within a module without repeating it.

If you're familiar with traditional programming languages, it can be useful to compare Terraform modules to function definitions.

Input variables are like function arguments.
Output values are like function return values.
Local values are like a function's temporary local variables.

A set of related local values can be declared together in a single locals block.
*/

locals {
    common_tags = {
    Service_name = "forum"
    Owner   = "Community Team"
    }
}

resource "aws_instance" "example" {
  # ...
  tags = local.common_tags
}