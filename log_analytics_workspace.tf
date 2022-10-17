# Create Log Analytics serveice or OMS resource 
resource "azurerm_log_analytics_workspace" "bsc_oms" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.total_retention
      tags     = merge(local.tags, {
    purpose  = "log analytics workspace"
  })
  depends_on          = [var.resource_group_name]
}