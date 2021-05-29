
/*
Length function()
length determines the length of a given list, map, or string.
If given a list or map, the result is the number of elements in that collection. If given a string, the result is the number 
of characters in the string.

The Element function()
element retrieves a single element from a list. The index is zero-based. This function produces an error if used with an empty list. 
The index must be a non-negative integer.
*/

variable "my_list" {
    type = list(string) //define the data type of value in the list.
}

// inside tfvars i would assign values to the list 

my_list = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]

// main parent module

resource "aws_subnet" "name" {
    count = length(my_list)
    cidr_block = element(var.my_list,count.index)
}

// count contains the list size. 3. Count is like the range function in python. It iterates through the indexes of the 
// list. There is now a for_each function which serves a better purpose for the above demonstration 
