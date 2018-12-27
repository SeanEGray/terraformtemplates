
# This resource generates a random id for the storage account
# You can skip this if you want to name it yourself
resource "random_id" "storageId" {
    keepers = {
        resource_group = "${azurerm_resource_group.resource_group.name}"
    }
    byte_length = 8
}

resource "azurerm_storage_account" "diagStor" {
    name                = "diag${random_id.storageId.hex}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    location            = "${var.location}"
    account_replication_type = "LRS"
    account_tier = "Standard"
}

