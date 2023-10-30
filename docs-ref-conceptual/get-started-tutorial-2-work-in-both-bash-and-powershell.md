---
title: Write scripts for both Bash and Powershell environments | Microsoft Docs
description: Learn to write Azure CLI commands for both Bash and PowerShell.
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
# Write Azure CLI commands for both Bash and PowerShell

Azure CLI commands can be executed in both [Bash](https://opensource.com/resources/what-bash) and [PowerShell](/powershell/scripting/overview) environments. However, there are subtile scripting  and line continuation character differences. This tutorial will teach you how to create your first Azure Storage Account and format Azure CLI parameter values for both environments.

## Prerequisites

* You will need a resource group with `contributor` permissions to complete this tutorial step.

## Create a storage account

Create an Azure storage account for use with quoting examples. Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
storageAccount="msdocssa$randomIdentifier"
az storage account create --name $storageAccount \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --location eastus \
                          --sku Standard_RAGRS \
                          --kind StorageV2 \
                          --output json
```

The Azure CLI returns at least 100 lines of JSON as output. Here are a few properties that are used in this tutorial.

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

## Learn about quoting rules

There are different quoting rules for the Bash, PowerShell and Windows Command environments. Here is an example of a parameter value that contains double quotes:

* Bash or PowerShell: `'{"key": "value"}'`
* Widows command: `"{\"key\": \"value\"}"`

Many Azure CLI parameters accept a space-separated list of values.

* Unquoted space-separated list: `--parameterName firstValue secondValue`
* Quoted space-separated list: `--parameterName "firstValue" "secondValue"`
* Passing values that contain a space: `--parameterName "value1a value1b" "value2a value2b" "value3"`

If you aren't sure how your string will be evaluated by your environment, return the value of a string to your console.

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

# [Windows command](#tab/cmd)

```azurecli-interactive
set strExpression="{\"key\": \"value\"}"
echo %strExpression%
```

```output
"{\"key\": \"value\"}"
expected: {"key":"value"}
```

---

For more information on quoting rules, see [Use quotation marks in parameters](use-cli-effectively.md#use-quotation-marks-in-parameters). 

## Understand line continuation characters

These three scripts are identical except for the line continuation character.  The <kbd>Copy</kbd> button of the Azure CLI code block removes the backslash (`\`) and the backtick (``\``). If you want to copy a formatted code block, use your keyboard or mouse to select and copy the example.

These examples also demonstrate quoting blank spaces, double quotes, and using variables containing quotes.

Using [az storage account update](/cli/azure/storage/account#az-storage-account-update), add tags to help you identify your storage account and learn about quoting differences. The `--tags` parameter accepts a space-separated list of values.

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

# [Windows command](#tab/cmd)

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

# Create a tag from a variable.
set newTag="tag1=tag value with spaces"
az storage account update --name <msdocssa00000000> ^
                          --resource-group <msdocs-tutorial-rg-00000000> ^
                          --tags "\$newTag" 
Error: (InvalidTagNameCharacters) The tag names '\$newTag' have reserved characters '<,>,%,&,\,?,/' 
       or without escape, tag value is empty
```

---

If you don't want to overwrite previous tags, use the [az tag update](/cli/azure/tag#az-tag-update) command setting the `--operation` parameter to `merge`.

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

## Compare more Bash and PowerShell scripts

Most Microsoft articles are written and tested in a Bash environment using Azure Cloud Shell.  If you prefer to work in PowerShell, it is important to be aware of quoting differences between the two environments.

The rules for using single quotes, double quotes and escape characters have slight differences and can cause errors when copying scripts. If you have an Azure CLI command that is giving a "Bad request ...{something} is invalid" error, it may be caused by a quotation mark or lack of one.

Take a deeper look at these Bash and PowerShell script differences.

# [Bash](#tab/bash)

Example of using double quotes in Bash.

```azurecli-interactive
az rest --method patch \
        --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.HybridCompute/machines/<machineName>?api-version=2022-12-27-preview \
        --resource https://management.azure.com/ \
        --headers Content-Type=application/json \
        --body '{"properties": {"agentUpgrade": {"enableAutomaticUpgrade": false}}}'

Example of escaping single quotes in Bash.

```azurecli-interactive
az vm list --resource-group QueryDemo \
           --query "[?storageProfile.osDisk.diskSizeGb >=\`50\`].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" \
           --output table
```

# [PowerShell](#tab/powershell)

Example of escaping double quotes in PowerShell.

```azurecli-interactive
az rest --method patch `
        --url https://management.azure.com/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/Microsoft.HybridCompute/machines/<machineName>?api-version=2022-12-27-preview `
        --resource https://management.azure.com/ `
        --headers Content-Type=application/json `
        --body '{\"properties\": {\"agentUpgrade\": {\"enableAutomaticUpgrade\": false}}}'
```

Example of using single quotes in Powershell.

```azurecli-interactive
az vm list --resource-group QueryDemo `
           --query "[?storageProfile.osDisk.diskSizeGb >=``50``].{Name:name,  admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" `
           --output table

```

---




## Error handling differences between Bash and Powershell



## Get more detail

Do you want more detail on one of the topics covered in this tutorial step? Use the links in this table to learn more.

|Topic| Learn more|
|-|-|
Scripting differences | [Bash quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)|
| | [PowerShell quoting rules](/powershell/module/microsoft.powershell.core/about/about_quoting_rules)|
| | [Windows command line tips](https://ss64.com/nt/syntax-esc.html)
| | [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md)
| | [Use quotation marks in Azure CLI parameters](./use-cli-effectively.md#use-quotation-marks-in-parameters)
| | Compare syntax of CMD, PowerShell and Bash in [Query command output using JMESPath](./query-azure-cli.md)
|Error handling| [Error handling for the Azure CLI in PowerShell](./use-cli-effectively.md#error-handling-for-azure-cli-in-powershell)

## Next Step

Now that you've learned how to modify parameter values for Bash and Powersehll, proceed to the next step to learn how to ...

> [!div class="nextstepaction"]
> [next step name](./azure-cli-sp-tutorial-2.md)
