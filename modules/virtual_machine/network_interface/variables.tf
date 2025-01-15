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
#                   Network Interface                 #
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

#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#* Use Output to make Input in  Variables            *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
variable "public_ip_id" {
    description = "Use Output data of Public IP to make Input "
    type = string
}

variable "subnet_id" {
    description = "Use Ouput data of Subnet to make Input"
    type = string
  
}