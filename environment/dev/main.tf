##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Commons Datas                     #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id = var.ARM_CLIENT_ID
  client_secret = var.ARM_CLIENT_SECRET
  tenant_id = var.ARM_TENANT_ID
  subscription_id = var.ARM_SUBSCRIPTION_ID
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Random Seed                       #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
resource "random_string" "random" {
  length = 8
  special = false
  upper = false
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   0.Resource Group                  #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "resource_group" {
  source              = "../../modules/resource_group"
  resource_group_name = " ${var.project_name}-${var.resource_group_name}-${var.environment}-${random_string.random.result}"
  location            = var.location
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   1.Module Virtual Network          #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

module "virtual_network" {
  source               = "../../modules/virtual_network"
  resource_group_name  = module.resource_group.rg_name
  location             = var.location
  virtual_network_name = "${var.project_name}-${var.virtual_network_name}-${var.environment}"
  vnet_address_range   = var.vnet_address_range
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   2.Module Virtual Subnet           #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "dev_subnet" {
  source = "../../modules/virtual_network/subnet"
  resource_group_name = module.resource_group.rg_name
  location = var.location
  subnet_dev_name = "${var.project_name}-${var.virtual_network_name}-${var.subnet_name}-${var.environment}"
  subnet_dev_ip_range = var.subnet_dev_ip_range
  virtual_network_name = module.virtual_network.virtual_network_name
  depends_on = [ module.virtual_network ]
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   3.Module Public IP                #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "agent_public_ip" {
  source = "../../modules/virtual_machine/public_ip"
  resource_group_name = module.resource_group.rg_name
  location = var.location
  public_ip_name ="${var.project_name}-${var.public_ip_name}-agent-${var.environment}"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#           4.Module Network Interface Agent VM       #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "agent_vm_nic" {
  source = "../../modules/virtual_machine/network_interface"
  resource_group_name = module.resource_group.rg_name
  location = var.location
  nic_name = "${var.project_name}-agent-${var.nic_name}-${var.environment}"
  ip_configuration_name = "${var.project_name}-agent-${var.ip_configuration_name}-${var.environment}"
  private_ip_address_allocation = var.private_ip_address_allocation
  public_ip_id = module.agent_public_ip.public_ip_id
  subnet_id = module.dev_subnet.dev_subnet_id
  depends_on = [ module.agent_public_ip, module.dev_subnet ]
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#           5.Module Network Security Group Agent VM  #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "agent_vm_nsg" {
  source = "../../modules/virtual_machine/network_security_group"
  resource_group_name = module.resource_group.rg_name
  location = var.location
  nsg_name = "${var.project_name}-agent-vm-${var.nsg_name}-${var.environment}"
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#           6.Module NSG NIC Association Agent VM     #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "agent_vm_nsg_nic_association" {
  source = "../../modules/virtual_machine/nsg_nic_association"
  agent_nic_id = module.agent_vm_nic.agent_nic_id
  agent_nsg_id = module.agent_vm_nsg.agent_nsg_id
  depends_on = [ module.agent_vm_nic, module.agent_vm_nsg ]
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#           7.Module Storage Account Agent VM         #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "agent_vm_sa" {
  source = "../../modules/virtual_machine/storage_account"
  resource_group_name = module.resource_group.rg_name
  location = var.location
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#           8.Module Agent VM                         #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "agent_vm" {
  source = "../../modules/virtual_machine"
  resource_group_name = module.resource_group.rg_name
  location = var.location
  agent_vm_name = "${var.project_name}-${var.agent_vm_name}-${var.environment}"
  vm_size = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  agent_nic_id = module.agent_vm_nic.agent_nic_id
  agent_sa_primary_blob_endpoint = module.agent_vm_sa.agent_sa_priamry_blob_endpoint
  depends_on = [
    module.agent_vm_nic,
    module.agent_vm_sa ]
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#           9.Module Agent API resources              #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
