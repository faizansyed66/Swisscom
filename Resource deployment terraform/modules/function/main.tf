resource "azurerm_storage_account" "function" {
  name                     = "function112122"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "functionapp" {
  name                = "functionapp"
  resource_group_name = var.resource_group
  location            = var.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "Restapii" {
  name                = "Restapi123221"
  resource_group_name = var.resource_group
  location            = var.location

  storage_account_name       = azurerm_storage_account.function.name
  storage_account_access_key = azurerm_storage_account.function.primary_access_key
  service_plan_id            = azurerm_service_plan.functionapp.id

  site_config {
    application_stack {
      dotnet_version = "6"
    }
  }
}