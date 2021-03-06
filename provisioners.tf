resource "null_resource" "mk" {
    provisioner "local-exec" {
        command = "echo 0 > status.txt"
    }
    provisioner "local-exec" {
        when = destroy
        command = "del /f status.txt"
    }
}

# Another example using {self.id} ogibject. aws_instance.ec2-azurerm_virtual_machine.id is the same as using the self.id object 

resource "aws_instance" "ec2-virtual-machine" {
    ami = ami-12345
    instance_type = t2.micro
    key_name = aws_key_pair.master-key.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
    subnet_id = aws_subnet.subnet_id
    provisioner "local-exec" {
        command = "aws ec2 wait instance-status-ok --region us-east-1 --instance-ids ${self.id}"
    }
}
