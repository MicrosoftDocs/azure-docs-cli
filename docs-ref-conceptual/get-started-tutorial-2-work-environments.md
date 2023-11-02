---
title: Write scripts for Bash, PowerShell and Windows Cmd | Microsoft Docs
description: Learn about quoting differences, line continuation and debugging in Bash, PowerShell and Windows Cmd environments.
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
# Write Azure CLI commands for different environments

Azure CLI commands can be executed in both [Bash](https://opensource.com/resources/what-bash), [PowerShell](/powershell/scripting/overview), and [Windows command shell (Cmd)](/windows-server/administration/windows-commands/windows-commands) environments. However, there are subtile scripting differences. This tutorial will teach you how to create your first Azure Storage Account and format Azure CLI parameter values for all three environments.

> [!NOTE] The Azure CLI also runs in Azure Cloud Shell (Bash or PowerShell) and Docker Containers (Bash), but these are technically "tools" and not "environments". For more information, see [Choose the right Azure command-line tool](./choose-the-right-azure-command-line-tool.md)

## Prerequisites

* You have completed the prerequisites to [prepare your environment](./get-started-tutorial-1-prepare-environment.md).
* You have access to a resource group with `contributor` permissions.

## Create a storage account

Create an Azure storage account to use in this tutorial. Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="East US"
resourceGroup="msdocs-tutorial-rg-$randomIdentifier"
storageAccount="msdocssa$randomIdentifier"

# Create a resource group.
az group create --name $resourceGroup --location $location

# Create a storage account.
az storage account create --name $storageAccount \
                          --resource-group $resourceGroup \
                          --location eastus \
                          --sku Standard_RAGRS \
                          --kind StorageV2 \
                          --output json
```

The Azure CLI returns at least 100 lines of JSON as output when a new storage account is created. Here are a few properties that are used in this tutorial.

> [!TODO]: Remove extra output not used in any tutorial step.

```output
{
"accessTier": "Hot",
"allowBlobPublicAccess": false,
"allowCrossTenantReplication": null,
"allowSharedKeyAccess": null,
"allowedCopyScope": null,
"azureFilesIdentityBasedAuthentication": null,
"blobRestoreStatus": null,
"creationTime": "yyyy-mm-ddT19:14:26.962501+00:00",
"customDomain": null,
"defaultToOAuthAuthentication": null,
"dnsEndpointType": null,
"enableHttpsTrafficOnly": true,
"enableNfsV3": null,
"encryption": {
  "encryptionIdentity": null,
  "keySource": "Microsoft.Storage",
  "keyVaultProperties": null,
  "requireInfrastructureEncryption": null,
  "services": {
    "blob": {
      "enabled": true,
      "keyType": "Account",
      "lastEnabledTime": "yyyy-mm-ddT19:14:27.118755+00:00"
    },
    "file": {
      "enabled": true,
      "keyType": "Account",
      "lastEnabledTime": "yyyy-mm-ddT19:14:27.118755+00:00"
    },
    "queue": null,
    "table": null
  }
},
"extendedLocation": null,
"failoverInProgress": null,
"geoReplicationStats": null,
"id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ sdocs-tutorial-rg-00000000/providers/Microsoft.Storage/storageAccounts/ msdocssa00000000",
"identity": null,
"immutableStorageWithVersioning": null,
"isHnsEnabled": null,
"isLocalUserEnabled": null,
"isSftpEnabled": null,
"keyCreationTime": {
  "key1": "yyyy-mm-ddT19:14:27.103127+00:00",
  "key2": "yyyy-mm-ddT19:14:27.103127+00:00"
},
"keyPolicy": null,
"kind": "StorageV2",
"largeFileSharesState": null,
"lastGeoFailoverTime": null,
"location": "eastus",
"minimumTlsVersion": "TLS1_0",
"name": "msdocssa00000000",
"networkRuleSet": {
  "bypass": "AzureServices",
  "defaultAction": "Allow",
  "ipRules": [],
  "resourceAccessRules": null,
  "virtualNetworkRules": []
},
"primaryEndpoints": {
  "blob": "https://msdocssa00000000.blob.core.windows.net/",
  "dfs": "https://msdocssa00000000.dfs.core.windows.net/",
  "file": "https://msdocssa00000000.file.core.windows.net/",
  "internetEndpoints": null,
  "microsoftEndpoints": null,
  "queue": "https://msdocssa00000000.queue.core.windows.net/",
  "table": "https://msdocssa00000000.table.core.windows.net/",
  "web": "https://msdocssa00000000.z13.web.core.windows.net/"
},
"primaryLocation": "eastus",
"privateEndpointConnections": [],
"provisioningState": "Succeeded",
"publicNetworkAccess": null,
"resourceGroup": "msdocs-tutorial-rg-00000000",
"routingPreference": null,
"sasPolicy": null,
"secondaryEndpoints": {
  "blob": "https://msdocssa00000000-secondary.blob.core.windows.net/",
  "dfs": "https://msdocssa00000000-secondary.dfs.core.windows.net/",
  "file": null,
  "internetEndpoints": null,
  "microsoftEndpoints": null,
  "queue": "https://msdocssa00000000-secondary.queue.core.windows.net/",
  "table": "https://msdocssa00000000-secondary.table.core.windows.net/",
  "web": "https://msdocssa00000000-secondary.z13.web.core.windows.net/"
},
"secondaryLocation": "westus",
"sku": {
  "name": "Standard_RAGRS",
  "tier": "Standard"
},
"statusOfPrimary": "available",
"statusOfSecondary": "available",
"storageAccountSkuConversionStatus": null,
"tags": {},
"type": "Microsoft.Storage/storageAccounts"
}
```

## Be aware of line continuation characters

Line continuation characters are different between environments and are not interchangeable.

| Environment | Line continuation character |
| - | - |
| Bash | Backslash (`\`)
| PowerShell | Backtick (``\``)
| Cmd | Carrot (`^`)

 The <kbd>Copy</kbd> button of the Azure CLI code block removes the backslash (`\`) and the backtick (``\``) by design. If you want to copy a formatted code block, use your keyboard or mouse to select and copy the example.

## Understand quoting differences

There are also different quoting rules for each environment. Here is an example of a parameter value that contains double quotes:

* Bash or PowerShell: `'{"key": "value"}'`
* Cmd: `"{\"key\": \"value\"}"`

Many Azure CLI parameters accept a space-separated list of values. This impacts quoting.

* Unquoted space-separated list: `--parameterName firstValue secondValue`
* Quoted space-separated list: `--parameterName "firstValue" "secondValue"`
* Passing values that contain a space: `--parameterName "value1a value1b" "value2a value2b" "value3"`

If you aren't sure how your string will be evaluated by your environment, return the value of a string to your console or use `--debug` as explained in [Debug and error handling](#debug-and-error-handling).

> [!TIP] Most Microsoft articles containing Azure CLI commands are written and tested in a Bash environment using Azure Cloud Shell. If you prefer to work in PowerShell or Cmd, modify the Bash example before executing it in another environment.

## Create tags to test what you've learned

Using [az storage account update](/cli/azure/storage/account#az-storage-account-update), add tags to help you identify your storage account and learn about line continuation and quoting differences. The `--tags` parameter accepts a space-separated list of values.

These examples demonstrate line continuation, double quotes, quoting blank spaces, and using variables containing quotes.

# [Bash](#tab/bash)

```azurecli-interactive
# Create new tags.
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags Team=t1 Environment=e1

# Create new tags containing spaces.
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags "Floor number=f1" "Cost center=cc1"

# Create a new tag with an empty value.
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags "Department="''""

# Create a tag from a variable.
newTag="tag1=tag value with spaces"
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags "$newTag"
```

If you don't want to overwrite previous tags while you work through this tutorial step, use the [az tag update](/cli/azure/tag#az-tag-update) command setting the `--operation` parameter to `merge`.

```azurecli-interactive
# Bash script to append to existing tags.

# Get the resource ID of your storage account.
saID=$(az resource show --resource-group <msdocs-tutorial-rg-00000000> \
                        --name <msdocssa00000000> \
                        --resource-type Microsoft.Storage/storageAccounts \
                        --query "id" \
                        --output tsv)

echo My storage account ID is $saID

# Append new tags.
az tag update --resource-id $saID \
              --operation merge
              --tags <tagName>=<tagValue>

# Get a list of all tags.
az tag list --resource-id $saID
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Create new tags.
az storage account update --name <msdocssa00000000> `
                          --resource-group <msdocs-tutorial-rg-00000000> `
                          --tags Team=t1 Environment=e1


# Create new tags containing spaces.
az storage account update --name <msdocssa00000000> `
                          --resource-group <msdocs-tutorial-rg-00000000> `
                          --tags "Floor number=f1" "Cost center=cc1"

# Create a new tag with an empty value.
az storage account update --name <msdocssa00000000> `
                          --resource-group <msdocs-tutorial-rg-00000000> `
                          --tags "Floor number="''""

# Create a tag from a variable.
# In PowerShell, prefix your variable name with a dollar sign.
$newTag="tag1=tag value with spaces"
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags "$newTag"
```

# [Cmd](#tab/cmd)

```azurecli-interactive
# Create new tags.
az storage account update --name <msdocssa00000000> ^
                          --resource-group <msdocs-tutorial-rg-00000000> ^
                          --tags Team=t1 Environment=e1

# Create new tags containing spaces.
az storage account update --name <msdocssa00000000> ^
                          --resource-group <msdocs-tutorial-rg-00000000> ^
                          --tags "Floor number=f1" "Cost center=cc1"

# Create a new tag with an empty value.
az storage account update --name <msdocssa00000000> ^
                          --resource-group sdocs-tutorial-rg-00000000> ^
                          --tags "Floor number="''""

```

If you need to modify an Azure resource using a variable, we suggest using Bash. Cmd often does not interpret variable values with special characters as expected. You often receive an "InvalidCharacters" error or your Azure property value is empty.

---

## Compare more environment-specific scripts

Take a deeper look at these script differences.

# [Bash](#tab/bash)

Example of using double quotes in Bash within the `--body` parameter.

```azurecli-interactive
az rest --method patch \
        --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.HybridCompute/machines/<machineName>?api-version=2022-12-27-preview \
        --resource https://management.azure.com/ \
        --headers Content-Type=application/json \
        --body '{"properties": {"agentUpgrade": {"enableAutomaticUpgrade": false}}}'

Example of escaping single quotes in Bash within the `--query` parameter.

```azurecli-interactive
az vm list --resource-group QueryDemo \
           --query "[?storageProfile.osDisk.diskSizeGb >=\`50\`].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" \
           --output table
```

# [PowerShell](#tab/powershell)

Example of escaping double quotes in PowerShell within the `--body` parameter.

```azurecli-interactive
az rest --method patch `
        --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.HybridCompute/machines/<machineName>?api-version=2022-12-27-preview `
        --resource https://management.azure.com/ `
        --headers Content-Type=application/json `
        --body '{\"properties\": {\"agentUpgrade\": {\"enableAutomaticUpgrade\": false}}}'
```

Example of using single quotes in Powershell within the `--query` parameter.

```azurecli-interactive
az vm list --resource-group QueryDemo `
           --query "[?storageProfile.osDisk.diskSizeGb >=``50``].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" `
           --output table
```

# [Cmd](#tab/cmd)

Example of using double quotes in Windows Command Prompt within the `--body` parameter.

[!TODO] need Cmd example

```azurecli-interactive
# Need az rest syntax for CMD here

```

Example of using single quotes in Windows Command Prompt within the `--query` parameter.

```azurecli-interactive
az vm list --resource-group QueryDemo ^
           --query "[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" ^
           --output table
```

---

## Debug a reference command

### Use `--debug` parameter

The Azure CLI offers a `--debug` parameter that can be used with any command. Debug output is extensive, but it will give you more information on execution errors.

# [Bash](#tab/bash)

These examples reveal the actual arguments received by the Azure CLI in Python's syntax.

This example is **correct**.

```azurecli-interactive
az '{"key":"value"}' --debug
```

See what the Azure CLI is interpreting in the `Command arguments` line of the output.

```output
Command arguments: ['{"key":"value"}', '--debug']
```

This second example is also **correct**. (The Bash `clear` command provides a clean screen for the next test.)

```azurecli-interactive
clear
az "{\"key\":\"value\"}" --debug
```

```output
Command arguments: ['{"key":"value"}', '--debug']
```

These next two examples are **incorrect** as quotes and spaces are interpreted by Bash.

```azurecli-interactive
clear
az {"key":"value"} --debug
```

```output
Command arguments: ['{key:value}', '--debug']
```

Note the space before `: "value"` which results in undesired output.

```azurecli-interactive
clear
az {"key": "value"} --debug
```

```output
Command arguments: ['{key:', 'value}', '--debug']
```

# [PowerShell](#tab/powershell)

This example is **partially correct** in both bash and PowerShell.

```azurecli-interactive
az '{"key":"value"}' --debug
```

See what the Azure CLI is interpreting in the `Command arguments` line of the output. In PowerShell, the double quotes missing around the `key:value` pair is a known issue.

```output
Command arguments: ['{key:value}', '--debug']
```

These examples are all **incorrect**.

```azurecli-interactive
# Example 2
cls
az "{\"key\":\"value\"}" --debug

# output
Command arguments: ['{\\', 'key\\:\\value\\}', '--debug']

# Example 3
cls
az {"key":"value"} --debug

# output
Unexpected token ':"value"' in expression or statement.

#Example 4
cls
az {"key": "value"} --debug

# output
Error: Unexpected token ':' in expression or statement.
```

# [Cmd](#tab/cmd)

This example is **correct**.

```azurecli-interactive
az "{\"key\":\"value\"}" --debug
```

See what the Azure CLI is interpreting in the `Command arguments` line of the output.

```output
Command arguments: ['{"key":"value"}', '--debug']
```

These examples are all **incorrect**.

```azurecli-interactive
# Example 2
cls
az '{"key":"value"}' --debug

# output
Command arguments: ["'{key:value}'", '--debug']

# Example 3
cls
az {"key":"value"} --debug

# output
Command arguments: ['{key:value}', '--debug']

# Example 4
cls
az "{"key":"value"}" --debug

# output
Command arguments: ['{key:value}', '--debug']
```

---

### Use `echo` command

Although `--debug` tells you exactly what the Azure CLI is interpreting, a second option is to return the value of an expression to your console. This method is very helpful when verifying the results of `--query` that is covered in detail in [Use variables in commands](./get-started-tutorial-3-use-variables.md).

# [Bash](#tab/bash)

```azurecli-interactive
strExpression='{"key":"value"}'
echo $strExpression
```

```output
{"key":"value"}
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
$strExpression='{"key":"value"}'
echo $strExpression
```

```output
{"key":"value"}
```

# [Cmd](#tab/cmd)

In Cmd, the `echo` command returns the literal string including escape characters. Compare the `--debug` and `echo` output of Cmd:

|CLI|Output|
|-|-|
|az "{\"key\":\"value\"}" --debug | Command arguments: ['{"key":"value"}', '--debug']
|set strExpression='"{\"key\": \"value\"}"' |
| echo %strExpression% | "{\"key\": \"value\"}"

---

## Troubleshooting

There are common errors when an Azure CLI reference command is not written properly.

* "Bad request ...{something} is invalid" might be caused by a quotation mark or lack of one.

* "Unexpected token..." is seen when there is an extra space or quote.

* "Invalid jmespath_type value" error often comes from incorrect quoting in the `--query` parameter.

* "Unrecognized arguments" is often caused by an incorrect line continuation character.

* "Missing expression after unary operator" is seen when a line continuation character is missing.

## Get more detail

Do you want more detail on one of the topics covered in this tutorial step? Use the links in this table to learn more.

|Topic| Learn more|
|-|-|
|Environments | [Choose the right Azure command-line tool](./choose-the-right-azure-command-line-tool.md)
|Scripting differences | [Bash quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)|
| | [PowerShell quoting](/powershell/module/microsoft.powershell.core/about/about_quoting_rules)|
| | [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md)
| | [Windows command-line tips](https://ss64.com/nt/syntax-esc.html)
| | [Use quotation marks in Azure CLI parameters](./use-cli-effectively.md#use-quotation-marks-in-parameters)
| | Compare syntax of Cmd, PowerShell and Bash in [Query command output using JMESPath](./query-azure-cli.md)

## Next Step

Now that you've learned how to modify parameter values for Bash, PowerShell and Cmd, proceed to the next step to learn how to extract values to a variable.

> [!div class="nextstepaction"]
> [Use variables in commands](./get-started-tutorial-3-use-variables.md)
