##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Commons Variables                 #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "resource_group_name" {
  description = "resource group name"
  type = string
}

variable "location" {
  description = "location of resource group"
  type = string
}

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                Virtual Network Variables            #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

variable "virtual_network_name" {
  description = "name of virtual network"
  type = string
}
variable "vnet_address_range" {
  description = "IP range of virtual network"
  type = string
}
