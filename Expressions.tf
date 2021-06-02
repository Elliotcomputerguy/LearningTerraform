
/*

*/

locals {
  value = "value1"
}

resource "aws_instance" "main_name" {
    ami = ""
    instance_instance_type = "t2.micro"
    tags = {
        Name = "Local-${local.value}"
        // if local.value == "string" set variable condition to value2 else set valriable condition to value3
        // shorthand if-else statement
        condition = local.value == "text" ? "value2" : "value3"
    } 
}
/*
Whitespace Stripping
To allow template directives to be formatted for readability without adding unwanted spaces and newlines to the result, 
all template sequences can include optional strip markers (~), immediately after the opening characters or immediately before the end. 
When a strip marker is present, the template sequence consumes all of the literal whitespace (spaces and newlines) either 
before the sequence (if the marker appears at the beginning) or after (if the marker appears at the end):
*/
var = <<EOT
%{ for ip in aws_instance.example.*.private_ip ~}
server ${ip}
%{ endfor ~}
EOT

// In the above example, the newline after each of the directives is not included in the output, but the newline after the server 
// ${ip} sequence is retained, causing only one line to be generated for each element:

#server 10.1.16.154
#server 10.1.16.1
#server 10.1.16.34

// When using template directives, we recommend always using the "heredoc" string literal form and then formatting the template over 
// multiple lines for readability. Quoted string literals should usually include only interpolation sequences.