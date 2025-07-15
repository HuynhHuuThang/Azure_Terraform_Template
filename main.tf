##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#  Deploy resource for multiple environment           #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

##*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*##
#                   Commons Datas                     #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
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
#                   Resource Group                    #
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
module "dev" {
  source = "./environment/dev"
  ARM_SUBSCRIPTION_ID = var.ARM_SUBSCRIPTION_ID
  ARM_TENANT_ID = var.ARM_TENANT_ID
  ARM_CLIENT_ID = var.ARM_CLIENT_ID
  ARM_CLIENT_SECRET = var.ARM_CLIENT_SECRET
  admin_password = var.admin_password
  subnet_id = var.dev_subnet_id
  public_ip_id = var.public_ip_id
}

