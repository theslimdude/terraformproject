output "vnet_name" {
  value = azurerm_virtual_network.n01720189-vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.n01720189-vnet.address_space
}

output "subnet_name" {
  value = azurerm_subnet.n01720189-subnet.name
}

output "subnet_address_prefix" {
  value = azurerm_subnet.n01720189-subnet.address_prefixes
}

output "subnet_id" {
  value = azurerm_subnet.n01720189-subnet.id
}

output "nsg_name" {
  value = azurerm_network_security_group.n01720189-nsg.name
}
