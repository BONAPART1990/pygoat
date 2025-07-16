provider "azurerm" {

    features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.21.1"
    }
  }
  cloud { 
    organization = "devsecops_pipelie_gha" 
    # export tf_workspace=prod
    # export tf_workspace=test
  } 
}

