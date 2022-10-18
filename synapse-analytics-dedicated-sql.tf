resource "azurerm_synapse_sql_pool" "synapse-sql-pool" {
  name                 = var.synapse_dedicated_sql
  synapse_workspace_id = azurerm_synapse_workspace.syn-ws.id
  sku_name             = var.synapse_dedicated_sql_skuname
  create_mode          = "Default"
    tags = merge(local.tags, {
    purpose = "synapse dedicated sql"
  })
   depends_on          = [var.resource_group_name,azurerm_storage_data_lake_gen2_filesystem.addlfs,azurerm_synapse_workspace.syn-ws]
}