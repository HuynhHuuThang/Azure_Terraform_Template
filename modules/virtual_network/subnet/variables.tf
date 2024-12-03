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
variable "subnet_dev_name" {
  description = "name of subnet for dev env"
  type = string
}
variable "subnet_dev_ip_range" {
  description = "IP range for dev subnet"
  type = string
}

#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#* Use Vnet Output to make Input in Subnet Variables *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "virtual_network_name" {
    description = "Use Vnet Output data to make Input in Subnet Variables"
    type = string
}