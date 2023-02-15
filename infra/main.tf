provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "my-resource-group"
  location = var.location
}

resource "azurerm_sql_server" "sql" {
  name                         = "my-sql-server"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_sql_database" "database" {
  name                = "my-database"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_sql_server.sql.name
  edition             = "Basic"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_bytes      = 1073741824
  sku_name            = var.sql_sku
  capacity            = var.sql_capacity
}

resource "azurerm_app_service_plan" "asp" {
  name                = "my-app-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "webapp" {
  name                = "my-web-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
}


