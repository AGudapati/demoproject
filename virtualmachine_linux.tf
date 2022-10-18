resource "azurerm_network_interface" "network-interface" {
  name                = "example-nic"
  location                 =  var.location
  resource_group_name      =  var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/279b419c-5ad7-43b5-8421-182367bfc19b/resourceGroups/bsc-resourcegroup/providers/Microsoft.Network/virtualNetworks/bsc-vnet0001/subnet/subnet1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "tls_private_key" "example_ssh" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "azurerm_linux_virtual_machine" "linux-virtual-machine" {
  name                = var.linux-virtual-machine
  location                 =  var.location
  resource_group_name      =  var.resource_group_name
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.network-interface.id,
  ]

    admin_ssh_key {
        username = "azureuser"
        public_key = tls_private_key.example_ssh.public_key_openssh #The magic here
    }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}