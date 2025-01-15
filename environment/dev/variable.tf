##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Commons Variables                 #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "ARM_SUBSCRIPTION_ID" {
#   description = "Specifies the subcription id for all resources"
#   type = string
#   default = "508d78f4-b324-4fd2-8c65-97a16b34c52b"
  sensitive = true  
}

variable "ARM_TENANT_ID" {
#   description = "Specifies the tenant id for all resources"
#   type = string
#   default = "93f33571-550f-43cf-b09f-cd331338d086"
  sensitive = true
}

variable "ARM_CLIENT_ID" {
#   description = "Specifies the client id for all resources"
#   type = string
#   default = "fd6c4af3-1185-4f4f-a08a-a87efa820f69"
  sensitive = true
}

variable "ARM_CLIENT_SECRET" {
#   description = "Specifies the client secret for all resources"
#   type = string
#   default = "2uM8Q~.KQ4H0V~KY2.juaUWYaz4EbNVZHqIRDb7L"
  sensitive = true
}

variable "project_name" {
  description = "the name of project"
  type = string
  default = "IAC"
}
variable "location" {
  description = "Specifies the location for the resource group and all the resources"
  type        = string
  default     = "southeastasia"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                  Resource Group Variables           #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "resource_group_name" {
  description   = "resource group name"
  type          = string
  default       = "rg"
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                Virtual Network Variables            #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "virtual_network_name" {
  description = "name of virtual network"
  type = string
  default = "vnet"
}
variable "vnet_address_range" {
  description = "IP range of virtual network"
  type = string
  default = "40.144.0.0/16"
  sensitive = true
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                2. Subnet Variables                  #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "subnet_dev_name" {
  description = "name of dev subnet"
  type = string
  default = "vnet-subnet"
}
variable "subnet_dev_ip_range" {
  description = "IP range for dev subnet"
  type = string
  default = "40.144.100.0/24"
}
variable "subnet_id" {
  description = "Use Ouput data of Subnet to make Input"
  type = string
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Public IP Variables               #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "public_ip_name" {
  description = "name of public ip"
  type = string
  default = "public-ip"
}
variable "public_ip_id" {
  description = "Use Output data of Public IP to make Input "
  type = string
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   NSG Varibales                     #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "nsg_name" {
  description = "name of network security group"
  type = string
  default = "agent-vm-nsg"
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   NIC Varibales                     #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "nic_name" {
  description = "name of network interface"
  type = string
  default = "agent-vm-nic"
  
}
variable "ip_configuration_name" {
  description = "name of ip configuration"
  type = string
  default = "agent-ip-config"
}
variable "private_ip_address_allocation" {
  description = "private ip address allocation"
  type = string
  default = "Dynamic"
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Agent VM  Variables               #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "agent_vm_name" {
  description = "name of virtual machine"
  type = string
  default = "agent-vm"
}
variable "vm_size" {
  description = "size of virtual machine"
  type = string
  default = "Standard_B1s"
}
variable "vm_os_disk_name" {
  description = "name of os disk"
  type = string
  default = "agent-vm-os-disk"
}

variable "agent_public_ip_name" {
  description = "Agent  Public IP"
  type = string
  default = "agent-public-ip"
}
variable "admin_username"{
    description = "admin username"
    type = string
    default = "adminuser"
}
variable "admin_password"{
    description = "admin password"
    type = string
    sensitive = true 
}
