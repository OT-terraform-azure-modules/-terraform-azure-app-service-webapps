variable "app_service_plan_name" {
  description = "(Required) name of app service plan"
  type        = list(string)
}

variable "app_service_plan_count" {
  description = "(Required) count of app service"
  type        = string
}

variable "app_service_plan_location" {
  description = "(Required) app service plan location"
  type        = string
}

variable "resource_group_name" {
  description = "(Required) resource group name"
  type        = string
}

variable "os_type" {
  description = "(Required) OS type of app service"
  type        = string
}

variable "reserved_os" {
  description = "(Required) Default value is set to false for windows"
  type        = string
  default     = "false"
}

variable "app_service_plan_sku" {
  description = "(Required) The Sku Tier of the app service plan."
  type = list(object({
    tier = string
    size = string
  }))
}


variable "tags_env" {
  description = "(Optional) tags for app service"
  type        = map(string)
}

variable "app_service_name" {
  description = "(Required) name of the app service"
  type        = list(string)
}

variable "app_service_count" {
  description = "(Required) count of app service"
  type        = string
}
