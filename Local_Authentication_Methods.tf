/*
Local best practice Authtentication methods

Hashicorp have advised the enviroment variables option out of the 4 possible options to authenticate locally. 

For further info you can navigate to aws provider authentication. 

Create a new key from IAM in AWS using the below link and launch aws cli. Add aws cli to your path env and issue the cmd aws configure
and follow the prompts to enter your access key and secret key.

Create key:
https://console.aws.amazon.com/iam/home?#/security_credentials

AWS Cli:
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

----------------------------------------------------------------------------------------------------------------------------------

Azure authentication requires Az cli and to pass the credentials to terraform. If you have more than one subscription you can
set your subscription id of choice you want to build infrastructure in.

Further info:
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli

Azure Cli:
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

az login
az account list
az account set --subscription="SUBSCRIPTION_ID"

You can also specify it in the providers block and use a variable.tf file with a terraform.tfvars file where the subscription id value
is. Setting via az cli allows you not to express the value in your build configuration.
*/

provider "azurerm" {
  features {}

  subscription_id = "00000000-0000-0000-0000-000000000000"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
