resource "azurerm_synapse_workspace" "syn-ws" {
  name                                 = var.synapse_workspace
  location                             = var.location
  resource_group_name                  = var.resource_group_name
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.addlfs.id
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = "H@Sh1CoR3!"
  sql_identity_control_enabled   = true


  identity {
    type = "SystemAssigned"
  }
  tags = merge(local.tags, {
    purpose = "synapse workspace"
  })
  #depends_on          = [var.resource_group_name]
}

resource "azurerm_synapse_workspace_sql_aad_admin" "syn-ws-aad" {
  synapse_workspace_id = azurerm_synapse_workspace.syn-ws.id
  login                = "AzureAD Admin"
  object_id            = data.azurerm_client_config.current.object_id
  tenant_id            = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_synapse_firewall_rule" "synapse-firewall-rule" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.syn-ws.id
  start_ip_address     = "99.48.52.163"
  end_ip_address       = "99.48.52.163"
}

resource "azurerm_synapse_role_assignment" "synapse-role-assignment" {
  synapse_workspace_id = azurerm_synapse_workspace.syn-ws.id
  role_name            = "Synapse Contributor"
  principal_id         = data.azurerm_client_config.current.object_id

  depends_on = [azurerm_synapse_firewall_rule.synapse-firewall-rule]
}

resource "azurerm_role_assignment" "example_storage_account_contrib" {
  scope                = azurerm_storage_account.addl.id
  role_definition_name = "Storage Account Contributor"
  principal_id         = azurerm_synapse_workspace.syn-ws.identity[0].principal_id
}
