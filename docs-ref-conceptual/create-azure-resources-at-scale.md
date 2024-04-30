---
title: Create multiple resources from a script using Azure CLI
description: Learn how to create multiple Azure resources from a script and log progress to a file. The Azure CLI script is provided for both Bash and PowerShell..
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 04/30/2024
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

This sample script has been tested in [Azure Cloud Shell](/azure/cloud-shell/overview) in both Bash and PowerShell environments. This script has also been tested successfully in [PowerShell 7](/powershell/scripting/overview) and [Windows Subsystem for Linux](/windows/wsl/about) (WSL) with Ubuntu 22.04.3 LTS using [Windows Terminal](/windows/terminal/).

## Prepare your environment

* Download and save to a local directory the following CSV file. Replace `myResourceGroup` in line 3 with an actual resource group name, and any other values you wish for testing purposes.

  ```
  resourceNo,location,createRG,exstingRgName,createVnet,vmImage,publicIpSku,adminUser,vnetAddressPrefix,subnetAddressPrefix
  1,eastus,TRUE,,TRUE,Ubuntu2204,standard,john-smith,10.0.0.0/16,10.0.0.0/24
  2,westus,TRUE,,FALSE,Ubunto2004,standard,alex-smith,10.0.0.0/16,10.0.0.0/24
  3,southcentralus,FALSE,myResourceGroup,FALSE,Ubuntu2104,standard,jan-smith,10.0.0.0/16,10.0.0.0/24
  ```

* [Install the Azure CLI](/cli/azure/install-azure-cli).
* If you are going to run this sample in a local Bash environment, [install JQ](https://jqlang.github.io/jq/manual/)

## Run the scripts

Select your preferred environment to run the script. _Both scripts use Azure CLI commands._ It is the environment, or terminal, that is different.  For example, Bash uses `do...done` and `if...then...fi`.  In a PowerShell environment, you use the equivalent `foreach` and `if (something is true)...{do this}`.

If you prefer, go directly to the CSV and script files used by this article at [Azure-samples/azure-cli-samples](https://github.com/Azure-Samples/azure-cli-samples/tree/master/azure-cli/create-azure-resources-at-scale).

### Setup variables

Get started by instantiating the variables needed for the script. The following three variables need actual values for your environment:
* subscriptionID
* setupFileLocation
* logFileLocation

Variables with a `msdocs-` prefix can be replaced with the prefix of your choice. All empty (`""`) variable values use input from the CSV setup file.

# [Bash](#tab/bash)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="VariableBlock":::

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="VariableBlock":::

---

### Validate CSV file values

Before you start to test the create script, make sure your CSV file is formatted correctly and variables will be assigned correct values. This script uses an IF..THEN statement so you can look at one scenario/CSV line at a time.

# [Bash](#tab/bash)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="ValidateFileValues":::

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="ValidateFileValues":::

---

Using the CSV provided in this article, the validation output is as follows:

```output
resourceNo = 1
location = eastus

RESOURCE GROUP INFORMATION:
createRG = TRUE
newRGName = msdocs-rg-00000000

VNET INFORMATION:
createVnet = TRUE
vnetName = msdocs-vnet-0000000
subnetName = msdocs-subnet-0000000
vnetAddressPrefix = 10.0.0.0/16
subnetAddressPrefix = 10.0.0.0/24

VM INFORMATION:
vmName = msdocs-vm-0000000
vmImage = Ubuntu2204
vmSku = standard
vmAdminUser = john-smith
vmAdminPassword =  msdocs-pw-0000000
```

### Validate script logic

If you are confident in your scripting abilities, you can skip this step. However, because this script is designed to create Azure resources at scale, looping through the script with `echo` statements can save you time and unexpected billable Azure resources.

# [Bash](#tab/bash)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="ValidateScriptLogic":::

Did you just receive a "jq command not found" error? This is because this script depends on the Bash [jq](https://jqlang.github.io/jq/manual/) command. [Install jq](https://jqlang.github.io/jq/download/) in your environment, or run this script in Azure Cloud Shell.

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="ValidateScriptLogic":::

---

Using the CSV provided in this article, the validation output is as follows:

```output
resourceNo = 1
create RG = TRUE
create Vnet = TRUE
creating RG msdocs-rg-249834648
creating VNet msdocs-vnet-249834648 in RG msdocs-rg-249834648
creating VM msdocs-vm-249834648 within Vnet msdocs-vnet-249834648 in RG msdocs-rg-249834648

resourceNo = 2
create RG = TRUE
create Vnet = FALSE
creating RG msdocs-rg-236479852
creating VM msdocs-vm-236479852 without Vnet in RG msdocs-rg-236479852

resourceNo = 3
create RG = FALSE
create Vnet = FALSE
creating VM msdocs-vm-316251055 without Vnet in RG myResourceGroup
```

### Create Azure resources

You have instantiated your variable block, validated CSV values, and completed a test run. Execute this script to create Azure resources as indicated in your CSV setup file.

# [Bash](#tab/bash)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="FullScript":::

Did you just receive a "jq command not found" error? This is because this script depends on the Bash [jq](https://jqlang.github.io/jq/manual/) command. [Install jq](https://jqlang.github.io/jq/download/) in your environment, or run this script in Azure Cloud Shell.

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="FullScript":::

---

## Troubleshooting

### Bash script ignores IF statement

Bash is case sensitive. The word `true` does not equal `TRUE`. Also `greater than` is `-gt`, not `>`, and `equals` is `==`, not `=`. Make sure you do not have a typographical error.

### Variable values are not changing with each loop

This is often caused by extra spaces in the CSV file. A line in a CSV file will look something like this: `column1,column2,column3` or `column1,,column3`, but by habit it is easy to create a test file that contains a space after each comma like `column1, column2, column3`. When you have a leading or trailing space in your CSV, the column value is actually `<space>columnValue`. The script logic `if [ "$columnName" = "columnValue" ]` returns "false". Remove all leading and trailing spaces in your CSV to fix the issue.

## See also

* [Delete Azure resources at scale](./delete-azure-resources-at-scale.md)
