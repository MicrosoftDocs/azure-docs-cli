---
title: Configure your new resource group with global parameters using Azure CLI  | Microsoft Docs
description: Learn how to use various global parameters with Azure CLI to configure a resource group.
manager: jasongroce
author: daphnemamsft
ms.author: daphnenma
ms.date: 08/2/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli 
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli, how to use azure cli, azure command line interface, how to open azure cli, azure cli commands
---

When working with the Azure CLI (Command-Line Interface), global parameters allow you to define values that can be reused across multiple commands. The benefits of using global parameters are reusability and consistency, as they allow you to reuse values across different commands or scripts, and maintain consistent values throughout your CLI interactions.

## Prerequisites

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

## Create a new resource group with global parameters

Create a new resource group by running: 

> [!IMPORTANT]
> Please note that the `--location` and the `--name` are required parameters and will therefore be included in every step of this tutorial.

# [Bash](#tab/bash)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="eastus"
resourceGroup="msdocs-rg$randomIdentifier"

az group create --name $resourceGroup --location $location 
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="eastus"
$resourceGroup="msdocs-rg$randomIdentifier"

az group create --name $resourceGroup --location $location 
```

***

Output console:

```output
{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>",
  "location": "<location>",
  "managedBy": null,
  "name": "<resourceGroup>",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```

## Create a resource group in a specific Azure subscription 

You can also create a new resource group in a specific Azure subscription by specifying the `--subscriptions` global parameter:

# [Bash](#tab/bash)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="eastus"
resourceGroup="msdocs-rg$randomIdentifier"
subscriptionId="00000000-0000-0000-0000-000000000000"

az group create --name $resourceGroup --location $location --subscriptionId $subscriptionId
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="eastus"
resourceGroup="msdocs-rg$randomIdentifier"
$subscriptionId="00000000-0000-0000-0000-000000000000"

az group create --name $resourceGroup --location $location 
```

***

Output console:

```output
{
  "id": "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>",
  "location": "<location>",
  "managedBy": null,
  "name": "<resourceGroup>",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```

## Configure the output of your resource group 

Suppose you want to show the output of the resource group you created in a specific format, you can do so by specifying the `--output` global parameters. In this example, the output is shown as a table:

> [!NOTE]
> The accepted values for output are: json, jsonc, none, table, tsv, yaml, and yamlc. The default output value is set to json. 

# [Bash](#tab/bash)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="eastus"
resourceGroup="msdocs-rg$randomIdentifier"

az group create --name $resourceGroup --location $location --output table
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="eastus"
$resourceGroup="msdocs-rg$randomIdentifier"

az group create --name $resourceGroup --location $location --output table
```

Output console:

```output
Location    Name
----------  --------
eastus      globalrg
```

## Show additional details of your command with verbose

You can learn more in-depth details about the logging verbosity when running your `az group create` command. This could be helpful when trying to understand if certain commands take longer than others to execute. For this step in the tutorial, we will reuse the very first example and add the `--verbose` global parameters:

# [Bash](#tab/bash)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="eastus"
resourceGroup="msdocs-rg$randomIdentifier"

az group create --name $resourceGroup --location $location --verbose 
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="eastus"
$resourceGroup="msdocs-rg$randomIdentifier"

az group create --name $resourceGroup --location $location --verbose
```

***

Output console:

> [!NOTE]
> The output content has been shortened since the content is repeated from the first step. This is to highlight the specific output the `--verbose` parameter provides.

```output
{...}
Command ran in 1.413 seconds (init: 0.487, invoke: 0.926)
```

## Debug your command

If the additional details from the `--verbose` parameter aren't enough and you wish to view the *whole* debug log, you can use the `--debug` global parameter. For this step in the tutorial, we will reuse the very first example and add the `--debug` global parameters:

# [Bash](#tab/bash)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="eastus"
resourceGroup="msdocs-rg$randomIdentifier"

az group create --name $resourceGroup --location $location --debug
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="eastus"
$resourceGroup="msdocs-rg$randomIdentifier"

az group create --name $resourceGroup --location $location --debug
```

***

Output console:

> [!NOTE]
> The output content has been shortened due to readability and repeated content from the first step.

```output

cli.knack.cli: Command arguments: ['group', 'create', '--name', 'globalrg', '--location', 'eastus', '--debug']
cli.knack.cli: __init__ debug log:
[...]
cli.knack.cli: Event: CommandInvoker.OnTransformResult [<function _resource_group_transform at 0x000001D9B72123B0>, <function _x509_from_base64_to_hex_transform at 0x000001D9B7212440>]
cli.knack.cli: Event: CommandInvoker.OnFilterResult []
{...}
[...]
telemetry.process: Return from creating process
telemetry.main: Finish creating telemetry upload process.

```