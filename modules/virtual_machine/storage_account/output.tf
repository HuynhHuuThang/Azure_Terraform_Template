output "agent_vm_sa_id" {
  value = azurerm_storage_account.agent_vm_sa.id
}
output "agent_sa_priamry_blob_endpoint" {
  value = azurerm_storage_account.agent_vm_sa.primary_blob_endpoint
}