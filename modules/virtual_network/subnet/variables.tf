

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Commons Variables                 #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

variable "resource_group_name" {
  description = "name of resource group"
  type = string
}
variable "location" {
  description = "location of resource group"
  type = string
}

#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                   Subnets Variables               *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "subnet_name" {
  description = "name of subnet for server env"
  type = string
}
variable "subnet_ip_range" {
  description = "IP range for server subnet"
  type = string
}

#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#* Use Vnet Output to make Input in Subnet Variables *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "virtual_network_name" {
    description = "Use Vnet Output data to make Input in Subnet Variables"
    type = string
}