variable "subscription_id" {
    description = "Azure subscription id"
}

variable "client_id" {
    description = "Client id of the Azure AD app to authenticate as"
}

variable "client_secret" {
    description = "Client secret of the Azure AD app to authenticate as"
}

variable "tenant_id" {
    description = "Azure tenant id"
}

variable "location" {
    description = "Azure location"
}

variable "resource_group_name" {
    description = "Name for the Azure resource group"
}

variable "vm_name" {
    description = "Name for the new virtual machine"
}

variable "vm_size" {
    description = "Size for the new virtual machine"
    default = "Standard_DS1_v2"
}

variable "vm_publisher" {
    description = "Publisher of the OS image to use"
    default = "Canonical"
}

variable "vm_offer" {
    description = "Offer of the OS image to use"
    default = "UbuntuServer"
}

variable "vm_sku" {
    description = "SKU of the OS image to use"
    default = "18.04-LTS"
}

variable "admin_username" {
    description = "Username of the admin account for the new virtual machine"
}

variable "admin_pubkey" {
    description = "Public key for the admin account for the new virtual machine"
}
