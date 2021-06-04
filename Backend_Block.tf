
# backend block
terraform {
 backend "remote" {
   organization = "<ORG_NAME>"
   workspaces {
     name = "Azure"
   }
 }
}