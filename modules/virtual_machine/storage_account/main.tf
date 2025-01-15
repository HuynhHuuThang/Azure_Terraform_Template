resource "azurerm_storage_account" "agent_vm_sa" {
  name                     = var.agent_sa_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "dev"
    Resource    = "Storage Account"
  }
}