resource "azurerm_storage_account" "addl" {
  name                     = "examplestorageaccountjs"
  location                 =  var.location
  resource_group_name      =  var.resource_group_name
  #location                 = data.azurerm_resource_group.js_resource_group.location
  #resource_group_name      = data.azurerm_resource_group.js_resource_group.name  
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "addlfs" {
  name               =  var.resource_group_name 
  storage_account_id = azurerm_storage_account.addl.id
}

# resource "azurerm_storage_data_lake_gen2_filesystem" "adlsfs" {

#   for_each           = data.azuread_group.ad-group-lookup
#   name               = each.key
#   storage_account_id = azurerm_storage_account.adls.id

#   ace {
#     scope       = "access"
#     type        = "group"
#     id          = lookup(data.azuread_group.ad-group-lookup, each.key).object_id
#     permissions = "rwx"
#   }
# }