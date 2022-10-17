resource "azurerm_user_assigned_identity" "user-assigned-identity" {
  location            = var.location
  name                = "syn-workspace-identity"
  resource_group_name = var.resource_group_name
}