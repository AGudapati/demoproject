# Create Resource Group
resource "azurerm_resource_group" "js_resource_group" {
  name     = var.resource_group_name
  location = var.location
  tags     = merge(local.tags, {
  purpose  = "Resoursegroup"
  })
}