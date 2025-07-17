resource "azurerm_network_interface_security_group_association" "agent_vm_nic_nsg" {
  network_interface_id      = var.agent_nic_id
  network_security_group_id = var.agent_nsg_id
}