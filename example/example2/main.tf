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

#In this example multiple app service will created under one App service plan.
#For this example we are using linux os.
module "app_service_2" {
  source                    = "../"
 app_service_plan_count    = "2" 
  app_service_plan_name     = ["azappserviceplan2"]
  app_service_count         = "2"
  app_service_name          = ["hellosrvwebapp","wolrdsrvwebapp"]
  app_service_plan_location = "East US"
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
