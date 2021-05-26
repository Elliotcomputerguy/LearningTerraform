/*
When we are building infrastructure how do we understand 1 how to build it in Terraform and 2 what does it need.
Using the Terraform providers documentation is what allows us to get all this information allowing us to build the resource.
Lets build an instance and a vpc and subnet and attach the vpc and subnet and use output from one resource into another.
*/

// first lets get docs on a vpc: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { //if you want too. Not required. But is good practise. 
    Name = "main_vpc_Demo"
  }
}

/*
 Lets now add a subnet : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
 The documentation specifies that we need a vpc_id ? This is the resource aws_vpc. 
 When a resource is created they output attributes. If you navigate to attributes reference your see the attributes 
 that are created upon creation or instantiated from a resource. These attributes are exported allowing other resources 
 to access their attributes using dot notation.

*/

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id //aws_vpc is the resource.main is the name of the resource and .id is the required attribute.
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "Main_subnet_Demo"
  }
}

// Docs on building a instance https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
// add the subnet_id argument to attach the subnet to the instance. As the subnet resource has the vpc argument; the instance will be
// built in the attached vpc.

resource "aws_instance" "web" {
    ami = "ami-0ad8ecac8af5fc52b" #<-- Free tier
    instance_type = "t2.micro" #<-- Free tier
    subnet_id = aws_subnet.main.id //aws_subnet is the resource .main is the name of the resource and .id is the attribute we need.
    tags = {
        name = web_Demo
    }
}