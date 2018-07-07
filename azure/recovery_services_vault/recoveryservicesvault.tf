resource "azurerm_recovery_services_vault" "recoveryvault" {
    name                = "${var.recovery_services_vault_name}"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.recoveryvault.name}"
    sku                 = "standard"
}
