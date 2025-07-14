---
title: Populate variables for use in Azure CLI scripts
description: Learn how to use variables to store JSON file properties and query output.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure, 
---

# Populate variables for use in Azure CLI scripts

In this tutorial step, learn to work with variables:

- Execute an Azure CLI command and store output in a variable.
- Read a local JSON file and store property values in a variable.

Some common use-cases for variables are:

- Get information about an existing Azure resource, such as a resource ID.
- Get output from an Azure CLI command, such as a password.
- Get JSON objects for environment information, such as development, stage, and production IDs.

You can use the variable in Azure CLI to perform build and destroy operations at scale.

## Prerequisites

- You have access to a resource group and storage account with `reader` or higher permissions at a
  storage account level.

## Get command output using JMESPath query

Get information about an existing Azure resource using the `--query` parameter of the `show`
command. A [JMESPath query][17] is executed, and one or more property values of an Azure resource
are returned.

> [!TIP]
> The syntax for `--query` is case-sensitive _and environment-specific_. If you receive empty
> results, check your capitalization. Avoid quoting errors by applying the rules you learned in
> [Learn Azure CLI syntax differences in Bash, PowerShell, and Cmd][03]

Unless the `--output` parameter is specified, these examples rely on a default output configuration
of `json` set in [Prepare your environment for the Azure CLI][02]

### Get JSON dictionary properties of an Azure resource

Using the storage account created in
[Learn Azure CLI syntax differences in Bash, PowerShell, and Cmd][03], get the `primaryEndpoints` of
your new storage account.

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

### Get individual JSON objects

To return individual properties in an array (list), specify a comma-delimited list of storage
account properties.

```azurecli-interactive
az storage account show --resource-group <msdocs-tutorial-rg-00000000> \
                        --name <msdocssa000000000> \
                        --query "[id, primaryLocation, primaryEndpoints.blob, encryption.services.blob.lastEnabledTime]"
```

Console JSON array output:

```output
[
  "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/msdocs-tutorial-rg-00000000/providers/Microsoft.Storage/storageAccounts/   msdocssa000000000",
  "eastus",
  "https://msdocssa000000000.blob.core.windows.net/",
  "yyyy-mm-ddT19:11:56.399484+00:00"
]
```

### Rename properties

Rename properties using curly brackets (`{}`) and a comma-delimited list. The new property names
can't contain spaces. This example returns output in `table` format.

```azurecli-interactive
az storage account show --resource-group <msdocs-tutorial-rg-00000000> \
                        --name <msdocssa000000000> \
                        --query "{saName:name, saKind:kind, saMinTLSVersion:minimumTlsVersion}" \
                        --output table
```

Console table output. The first letter of each column is capitalized in `--output table`:

```output
SaName             SaKind     SaMinTLSversion
-----------------  ---------  -----------------
msdocssa000000000  StorageV2  TLS1_0
```

## Filter query results

Combine what you learned about quoting with what you just learned about `--query`. These examples
apply a filter.

# [Bash](#tab/bash)

In Bash, you can't have a space before or after the equal (`=`) sign. You can opt to use quotes
around the variable value, so `msdocs-tutorial-rg-00000000` and `"msdocs-tutorial-rg-00000000"` are
both correct.

```azurecli-interactive
rgName="<msdocs-tutorial-rg-00000000>"

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
                        --query "[?contains(name, 'msdocs')].{saName:name, saKind:kind, saPrimaryLocation:primaryLocation, createdTimeStamp:creationTime}" \
                        --output table
```

# [PowerShell](#tab/powershell)

PowerShell allows you to create variables with or without spaces surrounding the equal (`=`) sign,
so `rgName="msdocs-tutorial-rg-00000000"` and `rgName = "msdocs-tutorial-rg-00000000"` are both
correct. However, in PowerShell, you must use quotes around the variable value.

```azurecli-interactive
rgName="<msdocs-tutorial-rg-00000000>"

# Get a list of all Azure storage accounts that allow blob public access.
az storage account list --resource-group $rgName `
                        --query "[?allowBlobPublicAccess == ``true``].name"

# Get a list of Azure storage accounts created in the last 30 days. Return the results as a table.
$saDate=Get-Date
$saDate=$saDate.AddDays(-30).tostring("yyyy-mm-dd")
az storage account list --resource-group $rgName `
                        --query "[?creationTime >='$saDate'].{saName:name, createdTimeStamp:creationTime}" `
                        --output table

# Get a list of Azure storage accounts created in this tutorial
az storage account list --resource-group $rgName `
                        --query "[?contains(name, 'msdocs')].{saName:name, saKind:kind, saPrimaryLocation:primaryLocation, createdTimeStamp:creationTime}" `
                        --output table
```

---

## Create a new Azure resource storing output in a variable

Learning to store command output in a variable is beneficial when creating Azure resources that
output secrets that should be protected. For example, when you create a service principal, reset a
credential, or get an Azure key vault secret, the command output should be protected.

Create a new Azure Key Vault and secret, returning command output to a variable. Your Azure Key
Vault name must be globally unique, so the `$RANDOM` identifier is used in this example. For more
Azure Key Vault naming rules, see [Common error codes for Azure Key Vault][09].

These examples use `echo` to verify variable values because this is a teaching tutorial. Don't use
`echo` for secret and password values in production-level environments.

# [Bash](#tab/bash)

```azurecli-interactive
# Set your variables.
let "randomIdentifier=$RANDOM*$RANDOM"
rgName="<msdocs-tutorial-rg-00000000>"
kvName="msdocs-kv-$randomIdentifier"
location="eastus"

# Set your default output to none
az config set core.output=none

# Create a new Azure Key Vault returning the Key Vault ID
myNewKeyVaultID=$(az keyvault create --name $kvName --resource-group $rgName --location $location --query id --output tsv)
echo "My new Azure Key Vault ID is $myNewKeyVaultID"

# Wait about 1 minute for your Key Vault creation to complete.

# Create a new secret returning the secret ID
kvSecretName="<myKVSecretName>"
kvSecretValue="<myKVSecretValue>"
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
Write-Output "My new Azure Key Vault ID is $myNewKeyVaultID"

# Wait about 1 minute for your Key Vault creation to complete.

# Create a new secret returning the secret ID
$kvSecretName="<myKVSecretName>"
$kvSecretValue="<myKVSecretValue>"
$myNewSecretID=$(az keyvault secret set --vault-name $kvName --name $kvSecretName --value $kvSecretValue --query id --output tsv)
Write-Output "My new secret ID is $myNewSecretID"

# Reset your default output to json
az config set core.output=json
```

---

## Get the contents of a JSON file and store it in a variable

This next section is a "stretch task" for an onboarding tutorial. However, to manage Azure resources
in development, stage, and production environments, you often need to read a configuration file.

Are you ready to stretch your Azure CLI skills? Create a JSON file containing the following JSON, or
your file contents of choice. Save the text file to your local drive. If you're working in Azure
Cloud Shell, use the `upload/download files` icon in the menu bar to store the text file in your
cloud storage drive.

```json
{
  "environments": {
    "dev": [
      {
        "id": "1",
        "kv-secretName": "dev1SecretName",
        "status": "inactive",
      },
      {
        "id": "2",
        "kv-secretName": "dev2SecretName",
        "status": "active"
      }
    ],
    "stg": {
      "id": "3",
      "kv-secretName": "dev3SecretName"
    },
    "prod": {
      "id": "4",
      "kv-secretName": "dev4SecretName"
    }
  }
}
```

Store the contents of your JSON file in a variable for further use in your Azure CLI commands. In
this example, change `msdocs-tutorial.json` to the name of your file. Don't save the `echo` command
in production-level scripts as the output is saved in your log file.

# [Bash](#tab/bash)

The following Bash script was tested in [Azure Cloud Shell][08] and **depends on the Bash [jq][19],
which must be installed in your environment.**

```bash
# Show the contents of a file in the console
fileName="msdocs-tutorial.json"
cat $fileName | jq

# Get a JSON dictionary object
stgKV=$(jq -r '.environments.stg."kv-secretName"' $fileName)
echo $stgKV

# Filter a JSON array
devKV=$(jq -r '.environments.dev[] | select(.status=="active") | ."kv-secretName"' $fileName)
echo $devKV
```

Did you receive a "jq command not found" error? This error occurs because the script depends on the
Bash [jq][19] command. [Install jq][18] in your environment, or run this script in Azure Cloud
Shell.

# [PowerShell](#tab/powershell)

This PowerShell script was tested in [Windows PowerShell][15] and [PowerShell 7][16].

```powershell
# Show the contents of a file in the console
$fileName="c:\myPath\msdocs-tutorial.json"
$fileContents = Get-Content -Path $fileName | ConvertFrom-Json

# Get a JSON dictionary object
$stgKV=$($fileContents.environments.stg."kv-secretName")
echo $stgKV

# Filter a JSON array
$devKV=$($fileContents.environments.dev | 
    Where-Object status -eq 'active' | 
    Select-Object -ExpandProperty 'kv-secretName')
echo $devKV
```

---

You now have an environment-specific Azure Key Vault secret name stored in a variable, and you can
use it to connect to Azure resources. This same method is good for IP addresses of Azure VMs and SQL
Server connection strings when you want to reuse Azure CLI scripts.

## Get more details

Do you want more detail on one of the subjects covered in this tutorial step? Use the links in this
table to learn more.

|     Subject     |                                                 Learn more                                                 |
| --------------- | ---------------------------------------------------------------------------------------------------------- |
| Variables       | See advanced examples in [Use the Azure CLI successfully - Pass values to another command][07]             |
|                 | Read a good overview of variables in [How to use variables in Azure CLI commands][01].                     |
| Querying        | Find a wide range of examples in [How to query Azure CLI command output using a JMESPath query][06].       |
|                 | Take a deeper dive in Bash using `--query` in [Learn to use Bash with the Azure CLI][05].                  |
| Azure key vault | [About Azure Key Vault][10]                                                                                |
|                 | [Provide access to Key Vault keys, certificates, and secrets with an Azure role-based access control][11]. |
|                 | [Common error codes for Azure Key Vault][09]                                                               |
| PowerShell      | Reference links: [Get-content][13], [Where-Object][12], [Select-Object][14]                                |

## Next Step

Now that you understand how to use variables to store Azure CLI command output and JSON property
values, proceed to the next step to learn how to use scripts to delete Azure resources.

> [!div class="nextstepaction"]
> [Delete Azure resources at scale using a script][04]

<!-- link references -->

[01]: ./azure-cli-variables.md
[02]: ./get-started-tutorial-1-prepare-environment.md
[03]: ./get-started-tutorial-2-environment-syntax.md
[04]: ./get-started-tutorial-4-delete-resources.md
[05]: ./use-azure-cli-successfully-bash.md
[06]: ./use-azure-cli-successfully-query.md
[07]: ./use-azure-cli-successfully-tips.md#pass-values-to-another-command
[08]: /azure/cloud-shell/overview
[09]: /azure/key-vault/general/common-error-codes
[10]: /azure/key-vault/general/overview
[11]: /azure/key-vault/general/rbac-guide?tabs=azure
[12]: /powershell/module/microsoft.powershell.core/where-object
[13]: /powershell/module/microsoft.powershell.management/get-content
[14]: /powershell/module/microsoft.powershell.utility/select-object
[15]: /powershell/scripting/developer/windows-powershell
[16]: /powershell/scripting/overview
[17]: https://jmespath.org/
[18]: https://jqlang.github.io/jq/download/
[19]: https://jqlang.github.io/jq/manual/
