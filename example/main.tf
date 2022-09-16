terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"
    }
  }

  required_version = ">= 0.15"
}

provider "azurerm" {
  features {}
}


module "res_group" {
  source                  = "git::https://github.com/OT-terraform-azure-modules/azure_resource_group.git"
  resource_group_name     = "anant_rg"
  resource_group_location = "West Europe"
  lock_level_value        = ""
  tag_map = {
    Name = "AzureResourceGroup"
  }
}


module "app_service" {
  source                    = "../"
  app_service_plan_count    = "2"
  app_service_plan_name     = ["azappserviceplan1", "anantappserviceplan"]
  app_service_count         = "3"
  app_service_name          = ["azdemoappservice1", "anantappservice", "hahahawebapp"]
  app_service_plan_location = module.res_group.resource_group_location
  resource_group_name       = module.res_group.resource_group_name
  os_type                   = "Linux"
  reserved_os               = true
  app_service_plan_sku = [
    {
      tier = "Standard"
      size = "S1"
    }
  ]
  tags_env = {
    "env"  = "dev"
    "name" = "demo"
  }
}