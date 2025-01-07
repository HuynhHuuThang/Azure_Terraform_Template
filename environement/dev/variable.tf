##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Commons Variables                 #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "ARM_SUBSCRIPTION_ID" {
#   description = "Specifies the subcription id for all resources"
#   type = string
#   default = "508d78f4-b324-4fd2-8c65-97a16b34c52b"
#   sensitive = true  
}

variable "ARM_TENANT_ID" {
#   description = "Specifies the tenant id for all resources"
#   type = string
#   default = "93f33571-550f-43cf-b09f-cd331338d086"
#   sensitive = true
}

variable "ARM_CLIENT_ID" {
#   description = "Specifies the client id for all resources"
#   type = string
#   default = "fd6c4af3-1185-4f4f-a08a-a87efa820f69"
#   sensitive = true
}

variable "ARM_CLIENT_SECRET" {
#   description = "Specifies the client secret for all resources"
#   type = string
#   default = "2uM8Q~.KQ4H0V~KY2.juaUWYaz4EbNVZHqIRDb7L"
#   sensitive = true
}

variable "project_name" {
  description = "the name of project"
  type = string
  default = "IAC"
}
variable "location" {
  description = "Specifies the location for the resource group and all the resources"
  type        = string
  default     = "australiaeast"
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
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Public IP Variables               #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "public_ip_name" {
  description = "name of public ip"
  type = string
  default = "public-ip"
}
##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   NSG Varibales                     #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "nsg_name" {
  description = "name of network security group"
  type = string
  default = "agent-vm-nsg"
}