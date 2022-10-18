resource "azurerm_sql_database" "sqldatabase" {
  name                = var.sqldatabase
  location            = var.location
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sqlserver.name

  # extended_auditing_policy {
  #   storage_endpoint                        = azurerm_storage_account.stgaccount.primary_blob_endpoint
  #   storage_account_access_key              = azurerm_storage_account.stgaccount.primary_access_key
  #   storage_account_access_key_is_secondary = true
  #   retention_in_days                       = 6
  # }

  tags = merge(local.tags, {
    purpose = "sql database"
  })
  depends_on = [var.resource_group_name, var.storageaccount, var.sqlserver]
}
