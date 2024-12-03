resource "azurerm_subnet" "sn_dev" {
    name = var.subnet_dev_name
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
    address_prefixes = [var.subnet_dev_ip_range]
    service_endpoints = ["Microsoft.Storage"]
    timeouts {
      create = "1h30m"
    }
}