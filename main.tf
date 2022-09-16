
resource "azurerm_app_service_plan" "app_service_plan" {
  count               = var.app_service_plan_count
  name                = element(var.app_service_plan_name, count.index)
  location            = var.app_service_plan_location
  resource_group_name = var.resource_group_name
  kind                = var.os_type
  reserved            = var.reserved_os
  dynamic "sku" {
    for_each = var.app_service_plan_sku
    content {
      tier = sku.value["tier"]
      size = sku.value["size"]
    }
  }
  tags = var.tags_env
}

resource "azurerm_app_service" "app_service" {
  count               = var.app_service_count
  name                = element(var.app_service_name, count.index)
  location            = var.app_service_plan_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = element(azurerm_app_service_plan.app_service_plan.*.id, count.index)
  tags                = var.tags_env

}
