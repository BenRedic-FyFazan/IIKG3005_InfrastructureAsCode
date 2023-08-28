variable "azTenantId" {
    description = "Microsoft Azure Tenant Id"
    type = string
}

variable "azClientId" {
    description = "Microsoft Azure client Id"
    type = string
}

variable "azClientSecret" {
    description = "Microsoft Azure client secret/password"
    type = string
    sensitive = true
}

variable "azSubscriptionId" {
    description = "Microsoft Azure subcscription Id"
    type = string
    sensitive = true
}

variable "azDisplayName" {
    description = "The Microsoft tenants display name"
    type = string
}

variable "rg" {
    description = "Attributes for Resource group"
    type = object({
      name = string
      location = string
    })
}

variable "sa" {
    description = "Attributes for Storage account"
    type = object ({
        name = string
        accTier = string
        accReplication = string
    })
}