# Terraform Module: Azure Key Vault with RBAC

This Terraform module provisions an **Azure Key Vault** with Role-Based Access Control (RBAC) enabled. Use this module to create a secure Key Vault resource in your Azure subscription.

---

## Table of Contents

- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Providers](#providers)
- [Requirements](#requirements)
- [Notes](#notes)

---

## Usage

You can use the module to provision an Azure Key Vault by specifying the input variables. Below is an example:

```hcl
module "key_vault" {
  source              = "./path-to-module" # Replace with the path or GitHub link to the module
  akv_name            = "myKeyVaultName"
  resource_group_name = "myResourceGroup"
  location            = "eastus"
  tenant_id           = "00000000-0000-0000-0000-000000000000" # Replace with your Azure AD tenant ID
}

output "key_vault_id" {
  value = module.key_vault.key_vault_id
}
```

## Inputs

Once provisioned, this module outputs the Key Vault ID, which can be used in other parts of your Terraform configuration.

| Name | Description | Type | Default | Required |
| :-- | :-- | :-- | :-- | :-- |
| akv_name | The globally unique name of the Key Vault. | string | n/a | Yes |
| resource_group_name | The name of the Azure resource group to deploy into. | string | n/a | Yes |
| location | The Azure location/region for the Key Vault. | string | n/a | Yes |
| tenant_id | The Azure Active Directory Tenant ID for the Vault. | string | n/a | Yes |


## Outputs

| Name | Description |
| :-- | :-- |
| key_vault_id | The unique ID of the created Key Vault. |

## Providers

This module requires the following Terraform provider:

azurerm (Azure Resource Manager): Ensure you are using the latest version compatible with the module. Learn more about the provider `[here](https://registry.terraform.io/providers/hashicorp/azurerm/latest)`.

## Requirements

Terraform CLI version >= 1.0
Azure CLI installed (if using local authentication)
An active subscription in Microsoft Azure.

## Notes

- **Key Vault SKU**:
  - The Key Vault's SKU is predefined as `Standard` and cannot be altered in this module.
  - If you require `Premium` SKU, modify the `main.tf` file directly.

- **RBAC Authorization**:
  - Role-Based Access Control (RBAC) is enabled for this Key Vault by default.
  - This is achieved via the configuration `enable_rbac_authorization = true`.
