# Terragrunt configuration for dev environment
terraform {
  source = "../../"
}

# Include the root terragrunt.hcl configurations
include "root" {
  path = find_in_parent_folders()
}

# Use local backend for development (can be changed to remote later)
remote_state {
  backend = "local"
  config = {
    path = "terraform.tfstate"
  }
}

# Input variables for this environment
inputs = {
  # Environment specific variables
  environment = "dev"
  location = "southeastasia"
  project_name = "IAC"
  
  # Network configuration
  vnet_address_range = "40.144.0.0/16"
  subnet_dev_ip_range = "40.144.100.0/24"
  
  # VM configuration
  vm_size = "Standard_B1s"
  admin_username = "adminuser"
  admin_password = "Admin@123456"  # In production, use environment variables or Azure Key Vault
  
  # Resource group configuration
  resource_group_name = "rg-npd"
  virtual_network_name = "vnet"
  subnet_name = "subnet"
  public_ip_name = "public-ip"
  nsg_name = "agent-vm-nsg"
  nic_name = "vm-nic"
  ip_configuration_name = "ip-config"
  private_ip_address_allocation = "Dynamic"
  agent_vm_name = "agent-vm"
}