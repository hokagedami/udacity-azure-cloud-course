


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name        = "${var.prefix}-resources"
  location    = var.location
}

resource "azurerm_virtual_network" "main" {
  address_space       = ["10.0.0.0/22"]
  location            = azurerm_resource_group.main.location
  name                = "${var.prefix}-network"
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "internal" {
  address_prefixes     = ["10.0.2.0/24"]
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
}

resource "azurerm_network_interface" "main" {
  location            = azurerm_resource_group.main.location
  name                = "${var.prefix}-nic"
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  admin_username        = var.username
  admin_password        = var.password
  location              = azurerm_resource_group.main.location
  name                  = "${var.prefix}-vm"
  network_interface_ids = [
    azurerm_network_interface.main.id
  ]
  disable_password_authentication = false
  resource_group_name   = azurerm_resource_group.main.name
  size                  = "Standard_B1s"

  source_image_reference {
    offer     = "0001-com-ubuntu-server-jammy"
    publisher = "Canonical"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type  = "Standard_LRS"
    caching               = "ReadWrite"
  }
}
