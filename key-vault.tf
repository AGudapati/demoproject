resource "azurerm_key_vault" "bsc_keyvault" {
  name                        = var.bsc_key_vault
  location                 =  var.location
  resource_group_name      =  var.resource_group_name
  #location                    = data.azurerm_resource_group.js_resource_group.location
  #resource_group_name         = data.azurerm_resource_group.js_resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"  
    tags     = merge(local.tags, {
    purpose  = "Key Vault"
  })
  depends_on          = [var.resource_group_name]

  access_policy {
      tenant_id = "e4eb247f-d627-40d9-910c-ca93c1d0c406"
      object_id = "9c4365c3-7c83-4c93-93a6-40fe3f3be255"

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}