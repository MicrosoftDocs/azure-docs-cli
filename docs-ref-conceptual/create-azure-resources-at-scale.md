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

As an Azure resource manager, you frequently have to create multiple Azure resources when configuring new environments. You might also have an Azure resource approval process that works best when Azure resources are created automatically from a script.

In this article you will learn the following:

* Create multiple Azure resources from parameters received from a delimited CSV file.
* Use IF..THEN statements to create dependent Azure resources.
* Log script progress to a local TXT file.

This sample script has been tested in [Azure Cloud Shell](/azure/cloud-shell/overview) in both Bash and PowerShell environments, and [PowerShell 7](/powershell/scripting/overview). Find the CSV and full script in [Azure-samples/azure-cli-samples](https://github.com/Azure-Samples/azure-cli-samples/tree/master/azure-cli/create-azure-resources-at-scale).

## Prepare your environment

Follow these steps to prepare your environment to run the example script:

* Open either the Bash or PowerShell environment in [Azure Cloud Shell](https://shell.azure.com). For more information, see [Quickstart for Bash in Azure Cloud Shell](/azure/cloud-shell/quickstart).
* Download and save to a local directory the following CSV file. Replace `myExistingResourceGroupName` in line three with an actual resource group name.

  ```CSV
  resourceNo,location,createRG,exstingRgName,createVnet,vnetAddressPrefix,subnetAddressPrefixes,vmImage,publicIpSku,Adminuser
  1,eastus,TRUE,,TRUE,10.0.0.0/16,10.0.0.0/24,Ubuntu2204,standard,
  2,eastus2,TRUE,,FALSE,,,Debian11,standard,alex-smith
  3,southcentralus,FALSE,myExistingResourceGroupName,FALSE,,,Ubuntu2204,standard,jan-smith
  [empty line for Bash]
  ```

  > [!NOTE]
  >
  > To be a proper Unix text file and be read by Bash, the CSV file needs a newline character at the end of the last data line. This results in a blank line at the end of the file. Your blank line does not need to say `[empty line]` as this text is only provided to show you that an empty line exists. PowerShell environments do not have this newline character requirement.

* Upload your modified CSV file to your Azure Cloud Shell blog storage account. The easiest way to do this is to use the **Manage files** drop down on the Azure Cloud Shell main menu. For more information on Cloud Shell storage, see [Persist files in Azure Cloud Shell](/azure/cloud-shell/persisting-shell-storage).

## Script overview

This article breaks a single large script into four sections so each step can be explained.

* Variable setup
* Data validation
* Loop validation
* Azure resource creation
  
There are also two scripts provided: one for Bash and the second for PowerShell. _Both scripts use the same Azure CLI commands._ It is the environment, or terminal profile, that is different. For example, Bash uses `do...done` and `if...then...fi`. In a PowerShell environment, you use the equivalent `foreach` and `if (something is true)...{do this}`. In Azure Cloud Shell you can switch between environments by using the **Switch to PowerShell** or **Switch to Bash** button in the Azure Cloud Shell main menu.

If you prefer, go directly to the CSV and script files used by this article in [Azure-samples/azure-cli-samples](https://github.com/Azure-Samples/azure-cli-samples/tree/master/azure-cli/create-azure-resources-at-scale).

## Set variables

Get started by creating the variables needed for the script. The following three variables need actual values for your environment:

* **subscriptionID**: This is your Azure subscription ID.
* **csvFileLocation**: This is the location and file name of your CSV input file.
* **logFileLocation**: This is the location and file name _the script will use to create a log file_. You do not need to create or upload this file.

Variables with a `msdocs-` prefix can be replaced with the prefix of your choice. All empty (`""`) variables use values from the CSV input file. These empty variables are placeholders needed by the script.

# [Bash](#tab/bash)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="step1":::

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="step1":::

---

## Validate CSV file values

Before you start to test the create script, make sure your CSV file is formatted correctly and variables will be assigned correct values. This script uses an IF..THEN statement so you can look at one scenario/CSV line at a time.

# [Bash](#tab/bash)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="step2":::

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="step2":::

---

Using the CSV provided in this article, the validation output is as follows: (The `00000001` random ID will be different for each test.)

```output
resourceNo = 1
location = eastus

RESOURCE GROUP INFORMATION:
createRG = TRUE
newRGName = msdocs-rg-00000001

VNET INFORMATION:
createVnet = TRUE
vnetName = msdocs-vnet-00000001
subnetName = msdocs-subnet-00000001
vnetAddressPrefix = 10.0.0.0/16
subnetAddressPrefix = 10.0.0.0/24

VM INFORMATION:
vmName = msdocs-vm-00000001
vmImage = Ubuntu2204
vmSku = standard
SSH keys will be created
```

## Validate script logic

If you are confident in your scripting abilities, you can skip this step. However, because this script is designed to create Azure resources at scale, looping through the script with `echo` or `write-host` statements can save you time and unexpected billable Azure resources.

# [Bash](#tab/bash)

There are several ways to iterate through a CSV file using Bash. This example uses `IFS` with a `while loop`.

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="step3":::

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="step3":::

---

Using the CSV provided in this article, the validation output is as follows: (The `00000001, 2, 3` random IDs will be different for each test, but each resource under each `resourceNo` should share the same random ID.)

```output
resourceNo = 1
createRG = TRUE
createVnet = TRUE
Will create RG msdocs-rg-00000001
Will create VNet msdocs-vnet-00000001 in RG msdocs-rg-00000001
Will create VM msdocs-vm-00000001 within Vnet msdocs-vnet-00000001 in RG msdocs-rg-00000001

resourceNo = 2
createRG = TRUE
createVnet = FALSE
Will create RG msdocs-rg-00000002
Will create VM msdocs-vm-00000002 without Vnet in RG msdocs-rg-00000002

resourceNo = 3
createRG = FALSE
createVnet = FALSE
Will create VM msdocs-vm-00000003 without Vnet in RG <myExistingResourceGroup>
```

## Create Azure resources

You have now created your variable block, validated your CSV values, and completed a test run with `echo` or `write-host`. Execute the fourth and final portion of the script to create Azure resources as defined in your CSV input file.

# [Bash](#tab/bash)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/bash/create-azure-resources-at-scale.sh" id="step4":::

# [PowerShell](#tab/powershell)

:::code language="azurecli" source="~/azure_cli_scripts/azure-cli/create-azure-resources-at-scale/powershell/create-azure-resources-at-scale.ps1" id="step4":::

---

Console output before log file read:

```output
Starting creation of resourceNo 1 at YYYY-MM-DD HH:MM:SS.
  RG msdocs-rg-00000001 creation complete
  VNet msdocs-vnet-00000001 creation complete
  VM msdocs-vm-00000001 creation complete
Starting creation of resourceNo 2 at YYYY-MM-DD HH:MM:SS.
  RG msdocs-rg-00000002 creation complete
  VM msdocs-vm-00000002 creation complete
Starting creation of resourceNo 3 at YYYY-MM-DD HH:MM:SS.
  VM msdocs-vm-00000003 creation complete
```

## Troubleshooting

### Bash script ignores IF statement

Bash is case sensitive. The word `true` does not equal `TRUE`. Also `greater than` is `-gt`, not `>`, and `equals` is `==`, not `=`. Make sure you do not have a typographical error, or leading/trailing spaces in your CSV column values.

### Variable values are not changing with each loop

This is often caused by extra spaces in the CSV file. A line in a CSV file will look something like this: `column1,column2,column3` or `column1,,column3`, but by habit it is easy to create a test file that contains a space after each comma like `column1, column2, column3`. When you have a leading or trailing space in your CSV, the column value is actually `<space>columnValue`. The script logic `if [ "$columnName" = "columnValue" ]` returns "false". Remove all leading and trailing spaces in your CSV rows to fix the issue.

### Invalid CIDR notation

You receive an **InvalidCIDRNotation** error when you pass an incorrect address prefix to `az network vnet create`. This can be challenging when visually, the address prefix looks correct when returned in an `echo` statement. To troubleshoot the actual value being read from the CSV, try this script:

```azurecli
while IFS=, read -r resourceNo location createRG existingRgName createVnet vnetAddressPrefix subnetAddressPrefixes vmImage publicIpSku adminUser
do
    echo "resourceNo = $resourceNo"

    if [ "$createVnet" == "TRUE" ]; then
      startTest="abc"
      endTest="xyz"
      echo $startTest$vnetAddressPrefix$endTest
    fi
done < <(tail -n +2 $setupFileLocation)
```

If your results look like `xzy10.0.0.0` and not the expected `abc10.0.0.0/24xyz`, there might be a hidden character or extra comma lurking in your CSV file. Add a test column with the same prefix value, rearrange your CSV columns, and copy/paste your CSV contents in/out of a simple Notepad editor. In writing this article, the rearrangement of the CSV columns finally fixed the error.

### Arguments are expected or required

You receive this error when you have not supplied a required parameter or there is a typographical error that causes the Azure CLI to incorrectly parse the reference command. When working with a script, you also receive this error when one of more of the following is true:

* There is a missing or incorrect line continuation character.
* There are trailing spaces on the right side of a line continuation character.
* Your variable name contains a special character, such as a dash (`-`).

### InvalidTemplateDeployment

When you try to create an Azure resource in a location that does not offer that resource you receive an error similar to the following: "Following SKUs have failed for Capacity Restrictions: Standard_DS1_v2' is currently not available in location 'westus'."

Here's the full error example:

```Error
{"error":{"code":"InvalidTemplateDeployment","message":"The template deployment 'vm_deploy_fZIVcQkGU0GS6HJBVxQaUNPaCr94lgym' is not valid according to the validation procedure. The tracking id is 'f6e6ff29-986f-49b2-9a67-12084b2e0217'. See inner errors for details.","details":[{"code":"SkuNotAvailable","message":"The requested VM size for resource 'Following SKUs have failed for Capacity Restrictions: Standard_DS1_v2' is currently not available in location 'westus'. Please try another size or deploy to a different location or different zone. See https://aka.ms/azureskunotavailable for details."}]}}
(ResourceGroupNotFound) Resource group 'msdocs-rg-00000000' could not be found.
Code: ResourceGroupNotFound
Message: Resource group 'msdocs-rg-00000000' could not be found.
```

To correct the error, either change the location or select a different parameter value that is offered for your desired location.

## See also

* [Delete Azure resources at scale](./delete-azure-resources-at-scale.md)
