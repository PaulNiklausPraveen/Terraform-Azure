resource "azurerm_resource_group" "azresourcegroup" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags = {
    EnvironmentType = "Prod"
  }
}

resource "azurerm_service_plan" "azserviceplan" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.azresourcegroup.name
  location            = azurerm_resource_group.azresourcegroup.location
  sku_name            = "B1"
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "azwebapp" {
  name                = var.app_service_name
  resource_group_name = azurerm_resource_group.azresourcegroup.name
  location            = azurerm_service_plan.azserviceplan.location
  service_plan_id     = azurerm_service_plan.azserviceplan.id

  site_config {
    
  }

  app_settings = {
    #"KEY" = "Value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLAzure"
    value = "Server=tcp:azurerm_mssql_server.sql.fully_qualified_domain_name Database=azurerm_mssql_database.db.name;User ID=azurerm_mssql_server.sql.administrator_login;Password=azurerm_mssql_server.sql.administrator_login_password;Trusted_Connection=False;Encrypt=True;"
  }
}
 
resource "azurerm_app_service_source_control" "azappservicesourcerepo" {
  app_id   = azurerm_linux_web_app.azwebapp
  repo_url           = "https://github.com/PaulNiklausPraveen/dotnet-sqldb-tutorial.git"
  branch             = "master"
  
  depends_on = [
    azurerm_linux_web_app.azwebapp
  ]
}

resource "azurerm_mssql_server" "azsql" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.azresourcegroup.name
  location                     = azurerm_resource_group.azresourcegroup.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "azsqldb" {
  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.azsql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  sku_name       = "S0"
  zone_redundant = false
}

resource "azurerm_storage_account" "azstorage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.azresourcegroup.name
  location                 = azurerm_resource_group.azresourcegroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_database_extended_auditing_policy" "azsqldbpolicy" {
  database_id                             = azurerm_mssql_database.azsqldb.id
  storage_endpoint                        = azurerm_storage_account.storage.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.storage.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 1
}
