locals {
  tags = {
    environment = "dev"
    department = "finance"
    source = "terraform"
  }
}


data "azurerm_client_config" "current" {}


# data "azuread_group" "ad-group-lookup" {
#   for_each     = var.folder-ad-group
#   display_name = lookup(var.folder-ad-group, each.key)
# }

# data "azurerm_resource_group" "js_resource_group" {
#   name   = "bsc_rg"
# }

# data "azurerm_virtual_network" "js_virtual_network" {
#   resource_group_name   = "bsc_rg"
#   name                  = "bsc-vnet001"
# }
# #terraform import terraformid azureresourceid
# #terraform import "azurerm_virtual_network.js_virtual_network.name" "azurerm_virtual_network.js_virtual_network.id"

# output "resourcegroup" {
#   value                 = data.azurerm_resource_group.js_resource_group
# }

# output "virtualnetwork" {
#   value                 = data.azurerm_virtual_network.js_virtual_network 
# }

data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}