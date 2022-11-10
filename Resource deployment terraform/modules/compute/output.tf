output "interface_name" {
  value = azurerm_network_interface.web-net-interface.name
  description = "Name of the network interface"
}

output "interface_ip" {
  value = azurerm_network_interface.web-net-interface.private_ip_address
  description = "IP of the network interface"
}

output "interface2_name" {
  value = azurerm_network_interface.web-net-interface2.name
  description = "Name of the network interface"
}

output "interface2_ip" {
  value = azurerm_network_interface.web-net-interface2.private_ip_address
  description = "IP of the network interface"
}