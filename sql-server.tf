resource "azurerm_sql_server" "sqlserver" {
  name                         = var.sqlserver
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  tags = merge(local.tags, {
    purpose = "sql server"
  })
  depends_on = [var.resource_group_name]

}
