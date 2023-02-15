variable "location" {
  description = "The region in which to create the Azure resources."
  type        = string
  default     = "eastus"
}

variable "sql_sku" {
  description = "The SKU to use for the Azure SQL Database."
  type        = string
  default     = "Basic"
}

variable "sql_capacity" {
  description = "The number of DTUs to use for the Azure SQL Database."
  type        = number
  default     = 5
}

variable "app_service_tier" {
  description = "The tier to use for the Azure App Service Plan."
  type        = string
  default     = "Basic"
}

variable "app_service_size" {
  description = "The size to use for the Azure App Service Plan."
  type        = string
  default     = "B1"
}

variable "sql_admin_username" {
  description = "The admin username for the Azure SQL Server."
  type        = string
  default     = "myadmin"
}

variable "sql_admin_password" {
  description = "The admin password for the Azure SQL Server."
  type        = string
  default     = "mypassword"
}

