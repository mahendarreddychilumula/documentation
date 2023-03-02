provider "azurerm" {
  features {}
  }

  module rg1 {
         source    = "./modules/rg1"

resource_group_name = var.resource_group_name
location            = var.resource_group_location
  }

