resource "azurerm_virtual_machine_extension" "devops_agent"{
    name                = var.ext_vm_name
    virtual_machine_id = var.agent_vm_id
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"

    settings = <<SETTINGS
    {
        "fileUris": ["https://vstsagentpackage.azureedge.net/agent/2.185.1/vsts-agent-linux-x64-2.185.1.tar.gz"],
        "commandToExecute": "sh devops_agent_extension.sh"
    }
SETTINGS
}