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
