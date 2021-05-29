/*
The join function will use the seperator - and concatante the strings terraform with the default value from variable project-name.
*/

variable "project-name" {
    type = string
    default = "prod"
}

resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = join("-",["terraform", var.project-name])
    }
}
