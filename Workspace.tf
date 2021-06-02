
/*
Terraform workspaces are also known as CLI workspaces. Terraform workspaces
are alternate state files within the same working directory.
Terraform starts with a single workspace that is always called default. It 
cannot be deleted. Access to a workspace name is provided through the ${terraform.workspace} variable.


*/

# terrafrom workspace list  (list all workspaces)
# terraform workspace new <workspace-name> (creates new sorkspace)
# terraform workspace select <workspace-name> (change workspace)


// conditional logic 

# resource block
# count = terraform.workspace == "default" ? 5 : 1
# provider block
# region = terraform.workspace == "default" ? "eu-west-1" : "eu-west-2"

