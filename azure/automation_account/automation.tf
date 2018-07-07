resource "azurerm_automation_account" "autoaccount" {
  name                = "${var.automation_account_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.automation.name}"
  sku {
    name = "Basic"
  }
}
