##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Commons Variables                 #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

variable "project_name" {
  description = "The name of project"
  type        = string
  default     = "IAC"
}

variable "location" {
  description = "Specifies the location for the resource group and all the resources"
  type        = string
  default     = "southeastasia"
}

variable "environment" {
  description = "Specifies the environment for the resource group and all the resources"
  type        = string
  default     = "dev"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                  Resource Group Variables           #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-npd"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                Virtual Network Variables            #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "virtual_network_name" {
  description = "Name of virtual network"
  type        = string
  default     = "vnet"
}

variable "vnet_address_range" {
  description = "IP range of virtual network"
  type        = string
  default     = "40.144.0.0/16"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                2. Subnet Variables                  #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "subnet_name" {
  description = "Name of dev subnet"
  type        = string
  default     = "subnet"
}

variable "subnet_dev_ip_range" {
  description = "IP range for dev subnet"
  type        = string
  default     = "40.144.100.0/24"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Public IP Variables               #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "public_ip_name" {
  description = "Name of public ip"
  type        = string
  default     = "public-ip"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   NSG Variables                     #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "nsg_name" {
  description = "Name of network security group"
  type        = string
  default     = "nsg"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   NIC Variables                     #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "nic_name" {
  description = "Name of network interface"
  type        = string
  default     = "vm-nic"
}

variable "ip_configuration_name" {
  description = "Name of ip configuration"
  type        = string
  default     = "ip-config"
}

variable "private_ip_address_allocation" {
  description = "Private ip address allocation"
  type        = string
  default     = "Dynamic"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Agent VM Variables                #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "agent_vm_name" {
  description = "Name of virtual machine"
  type        = string
  default     = "agent-vm"
}

variable "vm_size" {
  description = "Size of virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password"
  type        = string
  sensitive   = true
}
