Azure App Service (Web App) Terraform Module
=============================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates App service and App service plan on Azure .

Information:
This module creates App Service and App Service Plan on Azure for both Linux and Windows OS.
This modules can create multiple App Service plan and also create App Service respective of those App Service plans.

App Service Plan:
An App Service plan defines a set of compute resources for a web app to run. These compute resources are analogous to the server farm in conventional web hosting. One or more apps can be configured to run on the same computing resources (or in the same App Service plan).

Each App Service plan defines:

-Operating System (Windows, Linux)
-Region (West US, East US, etc.)
-Number of VM instances
-Size of VM instances (Small, Medium, Large)
-Pricing tier (Free, Shared, Basic, Standard, Premium, PremiumV2, PremiumV3, Isolated, IsolatedV2)

Azure App Service:
Azure App Service is an HTTP-based service for hosting web applications, REST APIs, and mobile back ends. You can develop in your favorite language, be it .NET, .NET Core, Java, Ruby, Node.js, PHP, or Python. Applications run and scale with ease on both Windows and Linux-based environments.

List of SKU sizes:
-Free Tier → F1
-Shared Tier → D1
-Basic Tier → B1, B2, B3 (Basic Small, Medium, Large)
-Standard Tier → S1, S2, S3 (Small, Medium, Large)
-PremiumV2 Tier → P1v2, P2v2, P3v2 (Small, Medium, Large)


Case-1:

If we want to create each App Service for each App Service plan.
For this count number of App Service plan and App Service shold be same then each app service will create under the respective App Service Plan.

  app_service_plan_count    = "2"
  app_service_plan_name     = ["azappserviceplan1","azappserviceplan2"]
  app_service_count         = "2"
  app_service_name          = ["webapp1","webapp2"]

Case-2:

When we want to create multiple App Service for a single App Service plan.
For this App Service Plan count should be one and we then all the multiple App Service will create under the same App Service Plan.

#1
 app_service_plan_count   = "2"
  app_service_plan_name     = ["azappserviceplan"]
  app_service_count         = "2"
  app_service_name          = ["webapp1","webapp2"]

#2
  app_service_plan_count    = "2"
  app_service_plan_name     = ["azappserviceplan1", "azappserviceplan2"]
  app_service_count         = "3"
  app_service_name          = ["webapp1", "webapp2", "webapp3"]


Terraform versions
------------------
Terraform v0.15.4


Usage
------

```hcl
module "res_group" {
  source                  = "git::https://github.com/OT-terraform-azure-modules/azure_resource_group.git"
  resource_group_name     = "_"
  resource_group_location = "_"
  lock_level_value        = ""
  tag_map   = {
    "tag1"  = "value1"
  }
}

module "app_service" {
  source                    = "git::git@gitlab.com:ot-azure/terraform/App_service.git?ref=A-1.0"
  app_service_plan_count    = "_"
  app_service_plan_name     = ["_", "_"]
  app_service_count         = "_"
  app_service_name          = ["_", "_", "_"]
  app_service_plan_location = module.res_group.resource_group_location
  resource_group_name       = module.res_group.resource_group_name
  os_type                   = "_"
  reserved_os               = "_"
  app_service_plan_sku      = [
  {
    tier = "Standard"
    size = "S1"
  }
  ]
  tags_env  = {
    "tag1"  = "value1"
    "tag2"  = "value2"
  }

}

```



Resources
------
| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_app_service_plan.app_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_app_service.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service) | resource |


Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Name of Resource Group | `string` |  | yes |
| resource_group_location | Location where we want to implement code | `string` |  | yes |
| app_service_plan_name | Name of app service plan | `list(string)` | | yes |
| app_service_plan_count| Mention the count to create the app service plan | `string` | | yes |
| app_service_plan_location | Location of app service plan | `string` | | yes |
| os_type | Operating system of app service | `string` | | yes |
| reserved_os | Value is set to `false` for windows and set to `true` for Linux | `string` | `false` | no |
| app_service_plan_sku | app service plan sku an d tier | `list(object)` |  | yes |
| app_service_name | Name of app service | `list(string)` | | yes |
| app_service_count | Mention the count to create the app service | `string` | | yes |
| tags_env | Map tags to resources | `map(string)` | | no |








Output
------
| Name | Description |
|------|-------------|  
| app_service_plan_name | Name of the app service plan |
| app_service_name | Name of the app service |
| app_service_location | Location of web app |


### Contributors

|  [![Anant Chauhan][Anant_avatar]][Anant_homepage]<br/>[Anant Chauhan][Anant_homepage] |
|---|

  [anant_homepage]: https://gitlab.com/anant.chauhan1
  [anant_avatar]: https://gitlab.com/uploads/-/system/user/avatar/9372704/avatar.png?width=400
