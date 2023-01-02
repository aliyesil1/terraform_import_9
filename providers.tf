terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.37.0"
    }
  }
   backend "remote" {
   organization  = "terraform_import_9"

   workspaces {
     name = "terraform_import_9"
     }
   }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
  }
}

