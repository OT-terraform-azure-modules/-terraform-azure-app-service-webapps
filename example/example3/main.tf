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
  resource_group_name     = "demo-rg"
  resource_group_location = "East US"
  lock_level_value        = ""
  tag_map = {
    Name = "AzureResourceGroup"
  }
}

#In this example we are creating three app service in under two app serivce plan.
#In such example first app service wil create under first plan and second app service will create under second plan and third app serivce will create under first plan again.
#In this example we are using widows os to create our app service.
module "app_service_win" {
  source                    = "../"
  app_service_plan_count    = "2"
  app_service_plan_name     = ["azappserviceplan2", "shubhamappserviceplan"]
  app_service_count         = "3"
  app_service_name          = ["hellosrvwebapp23", "hellosrvwebapp24", "hellosrvwebapp25"]
  app_service_plan_location = "East US"
  resource_group_name       = module.res_group.resource_group_name
  os_type                   = "Windows"
  reserved_os               = false
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