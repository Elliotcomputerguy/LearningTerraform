
/*
Dynamic blocks allow you to create dynamic configurations without having to repeat the code multiple times. 
*/

//local block
locals {
  ingress_rules = [{ // the curly braces are present because there is different data types in the list.  
      port = 443
      description = "port 443"
  },
  {
      port = 80
      description = "port 80"
  }]
}

data "aws_vpc" "aws_vpc_name" {
    default = true
}

resource "aws_security_group" "aws_sec_main" {
    name = "cust_ecg_${aws_sec_group}tf_rfc_${rfc_num}"
    vpc_id = data.aws_vpc.aws_vpc_name.id
    Dynamic "ingress" {
        for_each = local.ingress_rules

        content {
            description = ingress.value.description
            from_port = ingress.value.port
            to_port = ingress.value.port
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
  
}
