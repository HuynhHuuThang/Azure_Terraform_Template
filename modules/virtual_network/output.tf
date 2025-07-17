output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}


output "virtual_network_id" {
    value = azurerm_virtual_network.vnet.id
}


output "vnet_address_range" {
    value = azurerm_virtual_network.vnet.address_space
}

#all detail of vnet

output "vnet_detail" {
    value = azurerm_virtual_network.vnet
}