
/*
import
helps import already-existing external resources, not managed by Terraform, into Terraform state and allow it to manage those 
resources. Terraform is not able to auto-generate configurations for those imported modules, for now, and requires you 
to first write the resource definition in Terraform and then import this resource
terraform import <resource.name>.<name> <id>

taint
marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.
will not modify infrastructure, but does modify the state file in order to mark a resource as tainted. 
Infrastructure and state are changed in next apply. can be used to taint a resource within a module
terraform taint <resource-name>.<name>

fmt
format to lint the code into a standard format

console
command provides an interactive console for evaluating expressions.

refresh
used to reconcile the state Terraform knows about (via its state file) with the real-world infrastructure
does not modify infrastructure, but does modify the state file

validate
validates syntactically for format and correctness.
is used to validate/check the syntax of the Terraform files.
verifies whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or 
existing state. A syntax check is done on all the terraform files in the directory, and will display an error if any of the files 
doesn’t validate
*/