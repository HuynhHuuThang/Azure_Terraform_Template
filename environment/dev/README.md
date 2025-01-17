//// Naming Convention
Project Name + Root Resource Name + Child Resource Name + Environment Name + Random String (optional)
//// Create Azure Devops Agent on A Linux VM
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?tabs=azure-cli
1.Create a random value for the Azure resource group name using random_pet.
2.Create an Azure resource group using azurerm_resource_group.
3.Create a virtual network (VNET) using azurerm_virtual_network.
4.Create a subnet using azurerm_subnet.
5.Create a public IP using azurerm_public_ip.
6.Create a network security group using azurerm_network_security_group.
7.Create a network interface using azurerm_network_interface.
8.Create an association between the network security group and the network interface using azurerm_network_interface_security_group_association.
9.Generate a random value for a unique storage account name using random_id.
10.Create a storage account for boot diagnostics using azurerm_storage_account.
11.Create a Linux VM using azurerm_linux_virtual_machine
12.Create an AzAPI resource azapi_resource.
13.Create an AzAPI resource to generate an SSH key pair using azapi_resource_action.
