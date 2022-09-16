output "app_service_plan_name" {
  description = "Name of the app service plan"
  value       = azurerm_app_service_plan.app_service_plan.*.name
}

output "app_service_name" {
  description = "Name of the App service"
  value       = azurerm_app_service.app_service.*.name
}

output "app_service_location" {
  description = "location of web app"
  value       = azurerm_app_service.app_service.*.location
}

