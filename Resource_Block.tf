/*
resource blocks are pretty much what it says it is. It is the resource you want to build in your providers environment.
The resource code block below defines that you want to build a aws_vpc with a cidr block 10.0.0.0/16. the value next
to "aws_vps" must be unique. You can call it anything you like but if you create more than one resource that is of the same resource
this name must be different
*/

resource "aws_vps" "anything-you-like" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vps" "must_be_different" {
    cidr_block = "172.16.0.0/16"
}

