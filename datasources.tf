data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "main" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.existing.name
}

data "azurerm_subnet" "internal" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.main.name
  resource_group_name  = data.azurerm_resource_group.existing.name
}

data "azurerm_network_interface" "main" {
  name                = var.network_interface_name
  resource_group_name = data.azurerm_resource_group.existing.name
}

data "azurerm_virtual_machine" "main" {
  name                = var.virtual_machine_name
  resource_group_name = data.azurerm_resource_group.existing.name
}

data "azurerm_public_ip" "main" {
  name                = var.public_ip_name
  resource_group_name = data.azurerm_resource_group.existing.name
}
