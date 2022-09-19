Azure App Service (Web App) Terraform Module
=============================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates App service and App service plan on Azure .

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
