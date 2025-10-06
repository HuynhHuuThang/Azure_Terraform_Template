resource "azurerm_linux_virtual_machine" "agent_vm" {
  name                = var.agent_vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [var.agent_nic_id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = {
    environment = "dev"
    Resource    = "Virtual Machine"
  }
  boot_diagnostics {
    storage_account_uri = var.agent_sa_primary_blob_endpoint
  }
  provision_vm_agent = true
}