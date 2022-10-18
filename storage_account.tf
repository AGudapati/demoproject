resource "azurerm_storage_account" "stgaccount" {
  name                     = var.storageaccount
  location                 =  var.location
  resource_group_name      =  var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [var.resource_group_name, var.sqlserver]
}