---
title: Use Azure CLI effectively | Microsoft Docs
description: Learn tips for using Azure CLI effectively, such as output formats, passing parameter values, and quoting rules for different shells.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 10/01/2021
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
---

# How to use Azure CLI effectively

Azure CLI is ...

## Scripts

Use these scripts to save IDs to variables:

### [Bash](#tab/bash)

```console
ECHO OFF
SETLOCAL
FOR /F "tokens=* USEBACKQ" %%F IN (
   `az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv`
) DO (
    SET "vm_ids=%%F %vm_ids%"  :: construct the id list
)
az vm stop --ids %vm_ids% :: CLI stops all VMs in parallel
```

### [PowerShell](#tab/powershell)

```powershell
$vm_ids=(az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv)
az vm stop --ids $vm_ids # CLI stops all VMs in parallel
```

---

Use these scripts to loop through a list:

### [Bash](#tab/bash)

```console
ECHO OFF
SETLOCAL
FOR /F "tokens=* USEBACKQ" %%F IN (
    `az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv`
) DO (
    ECHO Stopping %%F
    az vm stop --ids %%F
)
```

### [PowerShell](#tab/powershell)

```powershell
$vm_ids=(az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv)
foreach ($vm_id in $vm_ids) {
    Write-Output "Stopping $vm_id"
    az vm stop --ids $vm_id
}
```

---

For more script examples for Bash, PowerShell and Cmd, see [Query Azure CLI command output](./query-azure-cli.md).

## Error handling for Azure CLI in PowerShell

You can run Azure CLI commands in PowerShell, as described in [Choose the right Azure command-line tool](choose-the-right-azure-command-line-tool.md). If you do, be sure you understand Azure CLI error handling in PowerShell. In particular, Azure CLI doesn't create exceptions for PowerShell to catch.

An alternative is to use the `$?` automatic variable. This variable contains the status of the most recent command. If the previous command fails, `$?` has the value of `$False`. For more information, see [about_Automatic_Variables](/powershell/module/microsoft.powershell.core/about/about_automatic_variables).

The follow example shows how this automatic variable can work for error handling:

```powershell
az group create --name MyResourceGroup
if ($? -eq $false) {
    Write-Error "Error creating resource group."
}
```

The `az` command fails because it is missing the required `--location` parameter. The conditional statement finds that `$?` is false and writes an error.

If you want to use the `try` and `catch` keywords, you can use `throw` to create an exception for the `try` block to catch:

```powershell
$ErrorActionPreference = "Stop"
try {
    az group create --name MyResourceGroup
    if ($? -eq $false) {
        throw 'Group create failed.'
    }
}
catch {
    Write-Error "Error creating the resource group."
}
$ErrorActionPreference = "Continue"
```

By default, PowerShell catches only terminating errors. This example sets the `$ErrorActionPreference` global variable to `Stop` so PowerShell can handle the error.

The conditional statement tests the `$?` variable to see if the previous command failed. If so, the `throw` keyword creates an exception to catch. The `catch` block can be used to write an error message or handle the error.

The example restores `$ErrorActionPreference` to its default value.

For more information about PowerShell error handling, see [Everything you wanted to know about exceptions](/powershell/scripting/learn/deep-dives/everything-about-exceptions).

## See also

- [Configure the Azure CLI](./azure-cli-configuration.md)
- [Learn to use Bash with Azure CLI](./azure-cli-learn-bash.md)
- [Query Azure CLI command output](./query-azure-cli.md)
- [Use variables in Azure CLI commands](./azure-cli-variables.md)
