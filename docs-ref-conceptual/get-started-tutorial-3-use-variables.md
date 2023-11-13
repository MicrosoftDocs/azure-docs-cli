---
title: Use variables in commands to manage Azure resources | Microsoft Docs
description: Learn about using variables to store query output and text file input.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 11/15/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure, 
---
# Store command output in variables

There are times when you want to get information about an Azure resource and return that information to your console screen, or store it in a variable for use within a script. In the Azure CLI, use the `--query` parameter to execute a [JMESPath query](https://jmespath.org/) to perform these tasks.

In this tutorial step you will learn to query command output and store the results in a variable.

## Prerequisites

* You have completed the prerequisites to [prepare your environment](./get-started-tutorial-1-prepare-environment.md).
* You have access to a resource group and storage account with `contributor` permissions.

## Get command output using JMESPath query

> [!TIP] The syntax for `--query` is case sensitive _and environment-specific_.  If you receive empty results, check your capitalization. Avoid quoting errors by applying the rules you learned in [Write Azure CLI commands for different environments](./get-started-tutorial-2-work-environments.md)

Unless the `--output` parameter is specified, these examples rely on a default output configuration of `json`.

When a separate PowerShell example is not provided, use the **Copy** button in the upper right corner of the Azure CLI code block to remove Bash line continuation characters.

### Get JSON dictionary properties

Using the storage account created in [Write Azure CLI commands for different environments](./get-started-tutorial-2-work-environments.md), get the `primaryEndpoints` of your storage account.

```azurecli-interactive
az storage account show --resource-group <msdocs-tutorial-rg-00000000> \
                        --name <msdocssa000000000> \
                        --query primaryEndpoints
```

Console JSON dictionary output:

```output
{
  "blob": "https://msdocssa00000000.blob.core.windows.net/",
  "dfs": "https://msdocssa00000000.dfs.core.windows.net/",
  "file": "https://msdocssa00000000.file.core.windows.net/",
  "internetEndpoints": null,
  "microsoftEndpoints": null,
  "queue": "https://msdocssa00000000.queue.core.windows.net/",
  "table": "https://msdocssa00000000.table.core.windows.net/",
  "web": "https://msdocssa00000000.z13.web.core.windows.net/"
}
```

### Get multiple individual properties

```azurecli-interactive
az storage account show --resource-group <msdocs-tutorial-rg-00000000> \
                        --name <msdocssa000000000> \
                        --query "[id, primaryLocation, primaryEndpoints.blob, encryption.services.blob.lastEnabledTime]"
```

Console JSON array (list) output:

```output
[
  "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/msdocs-tutorial-rg-00000000/providers/Microsoft.Storage/storageAccounts/   msdocssa000000000",
  "eastus",
  "https://msdocssa000000000.blob.core.windows.net/",
  "yyyy-mm-ddT19:11:56.399484+00:00"
]
```

### Rename properties

Rename properties using curly brackets (`{}`) and a comma-delimited list. The new property names cannot contain spaces. This example returns output in `table` format.

```azurecli-interactive
az storage account show --resource-group <msdocs-tutorial-rg-00000000> \
                        --name <msdocssa000000000> \
                        --query "{saName:name, saKind:kind, saMinTLSVersion:minimumTlsVersion}" \
                        --output table
```

Console table output.  The first letter of each column is capitalized by design in `--output table`:

```output
SaName             SaKind     SaMinTLSversion
-----------------  ---------  -----------------
msdocssa000000000  StorageV2  TLS1_0
```

## Filter query results

Combine what you have learned about quoting with what you have just learned about `--query`. These examples apply a filter.

# [Bash](#tab/bash)

```azurecli-interactive
rgName=<msdocs-tutorial-rg-00000000>

# Get a list of all Azure storage accounts that allow blob public access.
# Notice the backticks and escape characters needed for boolean values.
az storage account list --resource-group $rgName \
                        --query "[?allowBlobPublicAccess == \`true\`].name"

# Get a list of Azure storage accounts that were created in the last 30 days. Return the results as a table.
saDate=$(date +%F -d "-30days")
az storage account list --resource-group $rgName \
                        --query "[?creationTime >='$saDate'].{saName:name, createdTimeStamp:creationTime}" \
                        --output table

# Get a list of Azure storage accounts created in this tutorial
az storage account list --resource-group $rgName \
                        --query "[?contains(name, 'msdocs')].{saName:name, saKind:kind, saPrimaryLocation:primaryLocation,    createdTimeStamp:creationTime}" \
                        --output table
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
rgName="<msdocs-tutorial-rg-00000000>"

# Get a list of all Azure storage accounts that allow blob public access.
# Notice the backticks and escape characters needed for boolean values.
az storage account list --resource-group $rgName `
                        --query "[?allowBlobPublicAccess == ``true``].name"

# Get a list of Azure storage accounts that were created in the last 30 days. Return the results as a table.
$saDate=Get-Date
$saDate=$saDate.AddDays(-30).tostring("yyyy-mm-dd")
az storage account list --resource-group $rgName `
                        --query "[?creationTime >='$saDate'].{saName:name, createdTimeStamp:creationTime}" `
                        --output table

# Get a list of Azure storage accounts created in this tutorial
az storage account list --resource-group $rgName `
                        --query "[?contains(name, 'msdocs')].{saName:name, saKind:kind, saPrimaryLocation:primaryLocation,    createdTimeStamp:creationTime}" `
                        --output table
```

---

## Create a new Azure resource storing output in a variable

This next section is a "stretch task", but learning this concept is beneficial when creating Azure resources that output secrets that should be protected. For example, when you create a service principal, reset a credential, or get an Azure key vault secret, store the results of the Azure CLI command in a variable.

Are you ready to stretch your Azure CLI skills? Create a new Azure Key Vault and secret returning command output to a variable. Your Azure Key Vault name must be globally unique, so the `$RANDOM` identifier is used in this example. For more Azure Key Vault naming rules, see [Common error codes for Azure Key Vault](/azure/key-vault/general/common-error-codes).

# [Bash](#tab/bash)

```azurecli-interactive
# Set your variables.
let "randomIdentifier=$RANDOM*$RANDOM"
rgName=<msdocs-tutorial-rg-00000000>
kvName=msdocs-kv-$randomIdentifier
location=eastus

# Set your default output to none
az config set core.output=none

# Create a new Azure Key Vault returning the Key Vault ID
myNewKeyVaultID=$(az keyvault create --name $kvName --resource-group $rgName --location $location --query id --output tsv)
echo "My new Azure Kev Vault ID is $myNewKeyVaultID"

# Create a new secret returning the secret ID
kvSecretName=<myKVSecretName>
kvSecretValue=<myKVSecretValue>
myNewSecretID=$(az keyvault secret set --vault-name $kvName --name $kvSecretName --value $kvSecretValue --query id --output tsv)
echo "My new secret ID is $myNewSecretID"

# Reset your default output to json
az config set core.output=json
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Set your variables.
$randomIdentifier=(New-Guid).ToString().Substring(0,8)
$rgName="<msdocs-tutorial-rg-00000000>"
$kvName="msdocs-kv-$randomIdentifier"
$location="eastus"

# Set your default output to none
az config set core.output=none

# Create a new Azure Key Vault returning the Key Vault ID
$myNewKeyVaultID=$(az keyvault create --name $kvName --resource-group $rgName --location $location --query id --output tsv)
echo "My new Azure Kev Vault ID is $myNewKeyVaultID"

# Create a new secret returning the secret ID
$kvSecretName="<myKVSecretName>"
$kvSecretValue="<myKVSecretValue>"
$myNewSecretID=$(az keyvault secret set --vault-name $kvName --name $kvSecretName --value $kvSecretValue --query id --output tsv)
echo "My new secret ID is $myNewSecretID"

# Reset your default output to json
az config set core.output=json
```

---


## Get a value from a text file and store it in a variable


TODO

## Pass variable values between commands


TODO

## Troubleshooting

TODO

## Get more detail

Do you want more detail on one of the topics covered in this tutorial step? Use the links in this table to learn more.

|Topic| Learn more|
|-|-|
|Variables| See advanced examples in [Use the Azure CLI successfully - Pass values to another command](./use-cli-effectively.md#pass-values-to-another-command)
|| Read a good overview of variables in [How to use variables in Azure CLI commands](./azure-cli-variables.md)|
|Querying| Find a wide range of examples in [How to query Azure CLI command output using a JMESPath query](./query-azure-cli.md)
| | Take a deeper dive in Bash using `--query` in [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
|Azure key vault| [About Azure Key Vault](/azure/key-vault/general/overview)
| | [Provide access to Key Vault keys, certificates, and secrets with an Azure role-based access control](/azure/key-vault/general/rbac-guide?tabs=azure)
| | [Common error codes for Azure Key Vault](/azure/key-vault/general/common-error-codes)


## Next Step

Now that you've learned how to modify parameter values for Bash, PowerShell and Windows Command, proceed to the next step to learn how to ...

> [!div class="nextstepaction"]
> [next step name](./azure-cli-sp-tutorial-3.md)
