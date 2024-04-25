---
title: Create multiple resources from a script using Azure CLI
description: Learn how to create multiple Azure resources from a script and log progress to a file. The Azure CLI script is provided for both Bash and PowerShell..
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 01/12/2024
ms.topic: concept-article
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As an Azure resource manager, I want to create Azure resources at scale using a script. I want to log progress to a local TXT file so I don't have to sort through my Windows log for results.
---

# How to create resources at scale using the Azure CLI

As an Azure resource manager, you frequently have to create multiple Azure resources when configuring new environments. Some companies also have an approval process that works best when the Azure resources is created automatically from a script.

In this Azure CLI sample you will learn the following:

> [!div class="checklist"]
>
> * Create multiple Azure resources from a delimited CSV file
> * Use IF..THEN statements to create dependent objects
> * Log script progress to a local TXT file

This sample script has been tested in [Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/cloud-shell/overview) in both Bash and PowerShell environments. This script has also been tested successfully in [PowerShell 7](/powershell/scripting/overview) and [Windows Subsystem for Linux](/windows/wsl/about) (WSL) with an Ubunto2204 image using [Windows Terminal](/windows/terminal/).

## Prepare your environment
* Download and save to a local directory the following CSV file:
  
  ```
  resourceNo, createRG, createVnet, createVM, location, user, subnet, vmImage, publicIpSku 
  1, true, true, true, southcentralus, john-smith, 10.0.1.0, Ubuntu2204, standard
  2, true, false, , westus2, alex-smith, 10.0.2.0, Ubunto2004, standard
  3, false, true, false, eastus, jan-smith, 10.0.3.0, Ubuntu2104, standard
  0
  ```

* [Install the Azure CLI](/cli/azure/install-azure-cli).
* If you are going to run this sample in a local Bash environment, [install JQ](https://jqlang.github.io/jq/manual/)

## Run the script

Select your preferred environment to run the script. _Both scripts use Azure CLI commands._ It is the environment, or terminal, that is different.  For example, Bash uses `do...done` and `if...then...fi`.  In a PowerShell environment, you use the equivalent `foreach` and `if (something is true)...{do this}`.

If you prefer, get the script files for this article at [Azure-samples/azure-cli-samples]().

# [Bash](#tab/bash)

:::code language="azurecli" source="~/azure_cli_scripts/_azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="FullScript":::

Did you just receive a "jq command not found" error? This is because this script depends on the Bash [jq](https://jqlang.github.io/jq/manual/) command. [Install jq](https://jqlang.github.io/jq/download/) in your environment, or run this script in Azure Cloud Shell.

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/_azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="FullScript":::

---

## See also

* [Delete Azure resources at scale]()
* [Modify Azure resources at scale]()
