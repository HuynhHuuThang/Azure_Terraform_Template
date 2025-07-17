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
#                   VM Variables                      #
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
variable "agent_nic_id" {
  description = "network interface id of virtual machine"
  type = string
}
variable "agent_sa_primary_blob_endpoint" {
  description = "primary blob endpoint"
  type = string
}