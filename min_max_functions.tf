/*
The min() function will return the lowest integer value from the argument passed into the parameter.
The max() function will return the highest integer value from the argument passed into the parameter. 
*/

// If the numbers are in a list or set value, use ... to expand the collection to individual arguments. max([12, 54, 3]...)

variable "name" {
    type = list(number)
    default = max([12, 54, 3]...)
}

variable "name" {
    type = number
    default = max(12, 54, 3)
}

variable "name" {
    type = number
    default = min(12, 54, 3)
}

// If the numbers are in a list or set value, use ... to expand the collection to individual arguments:

variable "name" {
    type = list(number)
    default = min([12, 54, 3]...)
}


