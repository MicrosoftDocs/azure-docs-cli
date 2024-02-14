---
title: Use the Azure CLI in a PowerShell environment | Microsoft Docs
description: Learn how to format parameters for Azure CLI in a PowerShell environment
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.topic: quickstart
ms.service: azure
ms.date: 02-14-2024
ms.tool: azure-cli, azure-powershell
ms.custom: devx-track-azurecli
---

# How-to use the Azure CLI in a PowerShell environment

Azure CLI is a tool to manage Azure resources through reference commands that run in both Bash and PowerShell. There are slight syntax differences in parameter formatting between environments which can result in unexpected execution errors. The purpose of this article is to help you solve PowerShell quoting errors when an Azure CLI parameter contains a space or JSON syntax.

This article compares syntax differences of Azure CLI commands executed in the following environments:

* [Bash]() running in a Linux operating system using [Azure Cloud Shell]().
* [Windows PowerShell]() running in Windows 11.
* [PowerShell v7.4.1]() running in a Linux operating system using Azure Cloud Shell.
* PowerShell v7.4.1 running in a Windows 11 operating system using the PowerShell GUI tool.

This article is _not_ about [Azure PowerShell](), which is a set of _PowerShell modules_ that run in a PowerShell environment.

If you are new to CLI, differentiating between a _tool_ and an _environment_ might be confusing. [How-to choose the right command-line tool](./choose-the-right-azure-command-line-tool.md) provides a good comparison.

## The crux of the matter

PowerShell, through the years, has changed how it handles quotes. This has a direct impact on _some_ Azure CLI parameter values. Depending on your PowerShell version _and operating system_ an Azure CLI parameter value containing a space or JSON syntax must be modified.

## Prerequisites

To execute the test cases given in this article, you will need to install or open the following:

**Linux environments**

In your Internet application of choice, open two tabs using the links provided.

* An instance of [Azure Cloud Shell](https://ms.portal.azure.com/#cloudshell/) running with Bash. If Azure Cloud Shell opens in a PowerShell environment, click the **switch to Bash** option in the Cloud Shell menu bar.
* A second instance of [Azure Cloud Shell](https://ms.portal.azure.com/#cloudshell/) running with PowerShell. If Azure Cloud Shell opens in a Bash environment, click the **switch to PowerShell** option in the Cloud Shell menu bar.
  
**Microsoft Windows environments**

* A local installation of the [Azure CLI](./install-azure-cli-windows.md) in a Windows environment. 
* A local installation of Windows PowerShell 5.1. This is preinstalled in most Windows operating systems, but if you don't already have this PowerShell version, simply skip these examples.
* A local installation of [PowerShell v7.4.1](/powershell/scripting/install/installing-powershell-on-windows) or higher in a Windows environment.

This article was tested in Windows 11 Enterprise version 23H2.

Before continuing, test to see what version of the Azure CLI and PowerShell you are using.

```powershell
az version

$PSVersionTable
```

Here is the output from Azure Cloud Shell, which is the most recent version of both Azure CLI and PowerShell:

```output
{               
  "azure-cli": "2.57.0",
  "azure-cli-core": "2.57.0",
  "azure-cli-telemetry": "1.1.0",
  "extensions": {
    "ai-examples": "0.2.5",
    "ml": "2.22.0",
    "ssh": "2.0.2"
  }
}

Name                           Value
----                           -----
PSVersion                      7.4.1
PSEdition                      Core
GitCommitId                    7.4.1
OS                             CBL-Mariner/Linux
Platform                       Unix
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```

Here is the output from Windows PowerShell, which is the version of Azure CLI and PowerShell installed on the machine.

```output
{               
  "azure-cli": "2.57.0",
  "azure-cli-core": "2.57.0",
  "azure-cli-telemetry": "1.1.0",
  "extensions": {
    "ai-examples": "0.2.5",
    "ml": "2.22.0",
    "ssh": "2.0.2"
  }
}

Name                           Value                                                                                        
----                           -----                                                                                        
PSVersion                      5.1.22621.2506                                                                               
PSEdition                      Desktop                                                                                      
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}                                                                      
BuildVersion                   10.0.22621.2506                                                                              
CLRVersion                     4.0.30319.42000                                                                              
WSManStackVersion              3.0                                                                                          
PSRemotingProtocolVersion      2.3                                                                                          
SerializationVersion           1.1.0.1  
```

If you need an Azure storage account to run these test scripts, create one now.

# [Bash](#tab/Bash)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location=eastus
resourceGroup="msdocs-test-rg-$randomIdentifier"
storageAccount="msdocssa$randomIdentifier"

# Create a resource group.
az group create --name $resourceGroup --location $location

# Create a storage account.
echo "Creating storage account $storageAccount in resource group $resourceGroup"
az storage account create --name $storageAccount \
    --resource-group $resourceGroup \
    --location $location \
    --sku Standard_RAGRS \
    --kind StorageV2 \
    --output json
```

# [PowerShell](#tab/powershell)

```powershell
# Variable block
$randomIdentifier = $(Get-Random)
$location="eastus"
$resourceGroup="msdocs-test-rg-$randomIdentifier"
$storageAccount="msdocssa$randomIdentifier"

# Create a resource group.
az group create --name $resourceGroup --location $location

# Create a storage account.
echo "Creating storage account $storageAccount in resource group $resourceGroup"
az storage account create --name $storageAccount `
    --resource-group $resourceGroup `
    --location $location `
    --sku Standard_RAGRS `
    --kind StorageV2 `
    --output json

```

---

The Azure CLI returns over 100 lines of JSON output when a new storage account is created. The following JSON dictionary has fields omitted for brevity.

```output
{
"accessTier": "Hot",
"allowBlobPublicAccess": false,
"creationTime": "yyyy-mm-ddT19:14:26.962501+00:00",
"enableHttpsTrafficOnly": true,
"id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ msdocs-test-rg-00000000/providers/Microsoft.Storage/storageAccounts/msdocssa00000000",
"keyCreationTime": {
  "key1": "yyyy-mm-ddT19:14:27.103127+00:00",
  "key2": "yyyy-mm-ddT19:14:27.103127+00:00"
},
"kind": "StorageV2",
"location": "eastus",
"name": "msdocssa00000000",
"primaryEndpoints": {
  "blob": "https://msdocssa00000000.blob.core.windows.net/"
},
"primaryLocation": "eastus",
"provisioningState": "Succeeded",
"resourceGroup": "msdocs-test-rg-00000000",
"sku": {
  "name": "Standard_RAGRS",
  "tier": "Standard"
},
"statusOfPrimary": "available",
"statusOfSecondary": "available",
"tags": {},
"type": "Microsoft.Storage/storageAccounts"
}

```

## Passing spaces in Azure CLI parameters

In Azure CLI, when you need to pass a parameter value containing a space, there are quoting differences between operating systems and environments.  In this example, show storage account properties using a label that contains a space.

# [Bash in Linux](#tab/Bash1)

The following Azure CLI command syntax is correct:

```azurecli
az storage account list --query '[].{"SA Name":name,"SA Id":id,"Primary endpoint":primaryEndpoints.blob}' --output table
```

If you want to add a filter, use this syntax:

```azurecli
 az storage account list --query "[?creationTime >='2024-02-01'].{\"SA Name\":name,\"SA Id\":id,\"Primary endpoint\":primaryEndpoints.blob}" --output table
```

```output
SA Name             SA Id                    Primary Endpoint
-----------         ----------------         -----------------
msdocssa00000000  /subscriptions/0000...      https://msdocssa000000000.blob.core.windows.net/
```

# [PowerShell in Linux](#tab/ps1)

The following Azure CLI command syntax is correct:

```azurecli
az storage account list --query "[].{`"SA Name`":name, `"SA id`":id, `"Primary endpoint`":primaryEndpoints.blob}" --output table
```

If you run this syntax in Windows PowerShell or PowerShell 7.x installed on a Window's machine, you will receive error `argument --query: invalid jmespath_type value: '[].{SA'`.  Notice how the error message is breaking on the space between `SA` and `Name`.

Now add a filter. Unlike the Bash script, adding a date filter does not require reworking the entire `--query` string, but notice that the string is wrapped in double quotes and the PowerShell backtick escape character is already in place.

```azurecli
az storage account list --query "[?creationTime >='2024-02-01'].{`"SA Name`":name, `"SA id`":id, `"Primary endpoint`":primaryEndpoints.blob}" --output table
```

# [PowerShell 7.4.1 in Windows](#tab/win2)

In PowerShell 7.4.1 running in Windows, all three of these syntax examples execute without error:

```azurecli
az storage account list --query '[].{\"SA Name\":name,\"SA Id\":id,\"Primary endpoint\":primaryEndpoints.blob}' --output table

az storage account list --query '[].{""SA Name"":name,""SA Id"":id,""Primary endpoint"":primaryEndpoints.blob}' --output table

az storage account list --query '[?creationTime >=''2024-02-01''].{""SA Name"":name,""SA Id"":id,""Primary endpoint"":primaryEndpoints.blob}' --output table
```

# [PowerShell 5.1 in Windows](#tab/win1)

```azurecli
az storage account list --query '[].{""SA Name"":name,""SA Id"":id,""Primary endpoint"":primaryEndpoints.blob}' --output table

az storage account list --query '[?creationTime >=''2024-02-01''].{""SA Name"":name,""SA Id"":id,""Primary endpoint"":primaryEndpoints.blob}' --output table
```

---

## Passing JSON in Azure CLI parameters

```azurecli

```

## See also
