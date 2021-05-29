/*
variables just like in any programing language hold a value. You define your variable by giving the variable a name in the first line. 
You then define what data type the variable is going to contain with the type argument. String, number or boolean.
You have optional arguments you can pass into your variable for default and description. A description is self identifiable and 
requires no explanation. The default argument provides a value like a parameter with a default value in a function. 
If you have a sensitive value you can also pass in the sensitive argument and it will omit the value in the output of the plan.
You can access the variable using dot notation issuing the keyword var.<your variable name>.
There is a number of ways to pass in a value to the input variable. Use the terrafrom.tfvars or 
*.auto.tfvars file name and assign the value to the variable inside the file. This file is automatically loaded on run. If you
name the terraform.tfvars another name like something.tfvars it will not load the file on run and you will have to 
tell terraform to load it on apply. 

Inside the tfvars file you would assign your variable with a value using an assignment statement.
*/

my_instance_type1 = "t2.large"

/*
If you do not assign a value to your variables, Terraform will prompt you each time you run a state-changing operation. 
To avoid being prompted for each variable, use the -var flag to assign values to your variables. You would do this for 
sensitive values like usernames and passwords. 

terraform apply -var 'admin_username=plankton' -var 'admin_password=Password1234!'

You can also assign a value to a variable via ENV variables. 
It is also best practise to place all your variables in a variable.tf file. The file can be any name it does not have to be variable.tf.

Terraform have type constructors allowing you to specify complex types such as collections.

list(<TYPE>)
set(<TYPE>)
map(<TYPE>)
object({<ATTR NAME> = <TYPE>, ... })
tuple([<TYPE>, ...])

If the variable type has been specified and another data type is assigned you will get an error on run. You can use the any keyword
to allow for any data type. 

You can use string interpolation where you inject a variable into a string.
*/

myvar = "${var}some string" 

// You also have a validation optional feature you can use as a conditional. The validaton block checks to see if it is of type sting 
// and that the string value is greater than the index of 4. if it is less it will error.

variable "name" {
    type = string
    default = "hello"
    validation {
      condition = length(var.name) > 4
      error_message = "the string must be more than 4 charachters "
    }
  
}

/*
Further info:
https://www.terraform.io/docs/language/values/variables.html

Language info:
https://www.terraform.io/docs/language/expressions/types.html
*/

// variable
variable "my_instance_type" {
    type = string //<-- optional
    description = "instance type variable"  //<-- optional
    default = "t2.micro" //<-- optional
}

// assign a value to the variable in the tfvars file. 

my_instance_type = "t2.large"

// access the above variable in resource variable using dot notation. If a value had not been assigned it would of used its default value 

resource "aws_instance" "main" {
    instance_type = var.my_instance_type 
}

// When it is necessary to group different kinds of values, for example strings, bool values, and/or numbers, 
// you will need to use an object type. Anything with {} is considered an object. Lets take tags as an example.

  variable "instance_tags" {
    type = object({
      name = string
      num = number
    })
  }

// assigning a value in tfvars to variable instance_tags

instance_tags = {

    name = "string value"
    num = "integer value"
}

// access the variable in a resource You could just specify one argument in the variable. var.instance_tags.name or .num

resource "aws_instance" "main" {
    instance_type = var.my_instance_type
    tags = var.instance_tags
}

// Creating a list variable. You can specify any for any data type or number for integers and string for strings. 

variable "my_variable" {
    type = list(string)
}

// assigning a value in tfvars to variable my_variable.

my_variable = ["192.168.1.0/24", "192.168.1.0/24", "192.168.3.0/24"]

// You would use a loop for this via count or for_each. Just a demo
resource "aws_subnet" "name" {
    cidr_block = var.my_variable  
}

// Another example of a object type using a list of objects

variable "docker_ports" {
    type = list(object({
        internal = number
        external = number
        protocol = string
    }))
    default = [
        {
        internal = 8300
        external = 8300
        protocol = "tcp"
    }
  ]
}

// assign values in a tfvars file 

docker_ports = [
    {
        internal = 53
        external = 53
        protocol =  "udp"

        }]

    