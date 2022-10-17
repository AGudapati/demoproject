resource "azurerm_virtual_network" "js_virtual_network" {
  name                = var.virtual_network
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
  depends_on          = [var.resource_group_name]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    #security_group = azurerm_network_security_group.example.id
  }

    tags     = merge(local.tags, {
    purpose  = "Virtual Network"
  })
}