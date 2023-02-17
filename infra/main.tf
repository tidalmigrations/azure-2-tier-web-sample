provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = var.location
  tags = {
    environment = var.environment
  }
}

resource "azurerm_mssql_server" "sql" {
  name                         = "my-sql-server"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  minimum_tls_version          = "1.2"
  public_network_access_enabled = false
  outbound_network_restriction_enabled = true

  tags = {
    environment = var.environment
  }
}

resource "azurerm_mssql_database" "database" {
  name            = "my-database"
  server_id      = azurerm_mssql_server.sql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.sql_max_size_gb
  sku_name       = var.sql_sku 

  tags = {
    foo = "bar"
  }
}


resource "azurerm_service_plan" "asp" {
  name                = "my-app-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"  
  sku_name            = var.app_service_size

  tags = {
    environment = var.environment
  }
}

resource "azurerm_windows_web_app" "example" {
  name                = "my-web-app-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {}

  tags = {
    environment = var.environment
  }
}


