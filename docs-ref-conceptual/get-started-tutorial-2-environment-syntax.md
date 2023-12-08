---
title: Run Azure CLI commands with Bash, PowerShell Cmd syntax | Microsoft Docs
description: Learn about quoting differences, line continuation and debugging in Bash, PowerShell and Windows Cmd environments.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 12/04/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure, 
---
# Learn Azure CLI syntax differences in Bash, PowerShell and Cmd

Azure CLI commands can be executed in both [Bash](https://opensource.com/resources/what-Bash), [PowerShell](/powershell/scripting/overview), and Windows command shell [(Cmd)](/windows-server/administration/windows-commands/windows-commands) environments. However, there are subtile scripting differences. In this tutorial step, learn how to create your first Azure Storage Account and format parameter values for all three environments.

## Prerequisites

* You completed the prerequisites to [prepare your environment](./get-started-tutorial-1-prepare-environment.md).
* You have access to a resource group with `contributor` or higher permissions at a resource group level.

## Be aware of line continuation characters

Most Azure CLI documentation is written and tested in Bash using Azure Cloud Shell. One of the first things to remember when copying Azure CLI syntax is to verify the line continuation characters for your chosen environment as they aren't interchangeable.

| Environment | Line continuation character |
| - | - |
| **Bash** | Backslash (`\`)
| **PowerShell** | Backtick (`` ` ``)
| **Cmd** | Carrot (`^`)

> [!TIP]
> The **Copy** button in the upper right corner of Azure CLI code blocks removes the backslash (`\`) and the backtick (`` ` ``) by design. If you want to copy a formatted code block, use your keyboard or mouse to select and copy the example.

## Understand syntax differences when using variables

The syntax for using variables varies slightly between environments. Here's a comparison:

|Use case|Bash|PowerShell|Cmd
|-|-|-|-|
|Create variable | variableName=varValue | $variableName="varValue" | set variableName=varValue
|Use variable as parameter value |variableName|$variableName|%variableName%
|Use variable in `--query` parameter|'$variableName'|'$variableName'|'$variableName'

There are several different ways to return variable information to your console screen, but `echo` works in most circumstances. Here's a comparison:

* **Bash**: echo $varResourceGroup
* **PowerShell**: echo $varResourceGroup
* **Cmd**: echo %varResourceGroup%

In step three, [Populate variables for use in scripts](./get-started-tutorial-3-use-variables.md), you work through in-depth examples of variable syntax.

## Learn about quoting differences between environments

Every Azure CLI parameter is a string. However, each environment has its own rules for handling single and double quotes, spaces and parameter values.

|String value|Azure CLI|PowerShell|Cmd
|-|-|-|-|
|Text|'text' or "text"|'text' or "text"|"text"
|Number|\\\`50\\\` | \`\`50\`\` | \`50\`
|Boolean|\\\`true\\\` | \`\`false\`\` | \'true\'
|Date|'2021-11-15'|'2021-11-15'|'2021-11-15'
|JSON|'{"key":"value"}' or "{\"key\":\"value\"}" |'{"key":"value"}'|"{\"key\":\"value\"}"

Many Azure CLI parameters accept a space-separated list of values. This impacts quoting.

* **Unquoted space-separated list**: --parameterName firstValue secondValue
* **Quoted space-separated list**: --parameterName "firstValue" "secondValue"
* **Values that contain a space**: --parameterName "value1a value1b" "value2a value2b" "value3"

If you aren't sure how your string will be evaluated by your environment, return the value of a string to your console or use `--debug` as explained in [Debug Azure CLI reference commands](#debug-azure-cli-reference-commands).

## Create a storage account to apply what you've learned

The remainder of this tutorial step demonstrates quoting rules in Azure CLI commands, and uses the resource group created in [Prepare your environment for the Azure CLI](./get-started-tutorial-1-prepare-environment.md). Substitute `<msdocs-tutorial-rg-00000000>` with the name of your resource group.

Create an Azure storage account to use in this tutorial. This example assigns a random ID to the storage account name, but if you want to use a different name, see [Storage account overview](/azure/storage/common/storage-account-overview#storage-account-name) for storage account name rules.

This next script example demonstrates environment-specific syntax for the following:

* Line continuation
* Variable usage
* Random identifiers
* `echo` command

# [Bash](#tab/Bash)

```azurecli-interactive
# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location=eastus
resourceGroup="<msdocs-tutorial-rg-00000000>"
storageAccount="msdocssa$randomIdentifier"

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

```azurecli-interactive
# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="eastus"
$resourceGroup="<msdocs-tutorial-rg-00000000>"
$storageAccount="msdocssa$randomIdentifier"

# Create a storage account.
echo "Creating storage account $storageAccount in resource group $resourceGroup"
az storage account create --name $storageAccount `
                          --resource-group $resourceGroup `
                          --location $location `
                          --sku Standard_RAGRS `
                          --kind StorageV2 `
                          --output json
```

# [Cmd](#tab/cmd)

```azurecli-interactive
:: Variable block
set randomIdentifier=%RANDOM%
set location=eastus
set resourceGroup="<msdocs-tutorial-rg-00000000>"
set storageAccount="msdocssa%randomIdentifier%"

:: Create a storage account.
echo "Creating storage account %storageAccount% in resource group %resourceGroup%"
az storage account create --name %storageAccount% ^
                          --resource-group %resourceGroup% ^
                          --location %location% ^
                          --sku Standard_RAGRS ^
                          --kind StorageV2 ^
                          --output json
```

---

The Azure CLI returns over 100 lines of JSON as output when a new storage account is created. The following JSON dictionary output has fields omitted for brevity.

```output
{
"accessTier": "Hot",
"allowBlobPublicAccess": false,
"creationTime": "yyyy-mm-ddT19:14:26.962501+00:00",
"enableHttpsTrafficOnly": true,
"id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ msdocs-tutorial-rg-00000000/providers/Microsoft.Storage/storageAccounts/msdocssa00000000",
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
"resourceGroup": "msdocs-tutorial-rg-00000000",
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

## Create tags to practice quoting differences

Using [az storage account update](/cli/azure/storage/account#az-storage-account-update), add tags to help you identify your storage account and learn about quoting differences. These script examples demonstrate environment-specific syntax for the following:

* Values containing spaces
* Quoting blank spaces
* Escaping special characters
* Using variables

The `--tags` parameter accepts a space-separated list of key:value pairs. Substitute `<msdocs-tutorial-rg-00000000>` with the name of your resource group and `<msdocssa00000000>` with the name of your Azure storage account.

# [Bash](#tab/Bash)

```azurecli-interactive
# Create new tags. This syntax works with or without quotes around each key-value pair.
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags Team=t1 Environment=e1

# Create new tags containing spaces. You must use quotes.
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags "Floor number=f1" "Cost center=cc1"

# Create a new tag with an empty value.
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags "Department="''""

# Create a new tag containing special characters resulting in "Path": "$G:\\myPath".
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags "Path=\$G:\myPath"

# Create a tag from a variable.
newTag="tag1=tag value with spaces"
az storage account update --name <msdocssa00000000> \
                          --resource-group <msdocs-tutorial-rg-00000000> \
                          --tags "$newTag"
```

If you don't want to overwrite previous tags while you work through this tutorial step, use the [az tag update](/cli/azure/tag#az-tag-update) command setting the `--operation` parameter to `merge`.

```azurecli-interactive
# Get the resource ID of your storage account.
saID=$(az resource show --resource-group <msdocs-tutorial-rg-00000000> \
                        --name <msdocssa00000000> \
                        --resource-type Microsoft.Storage/storageAccounts \
                        --query "id" \
                        --output tsv)

echo My storage account ID is $saID

# Append new tags.
az tag update --resource-id $saID \
              --operation merge \
              --tags <tagName>=<tagValue>

# Get a list of all tags.
az tag list --resource-id $saID
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
# Create new tags. This syntax works with or without quotes around each key-value pair.
az storage account update --name <msdocssa00000000> `
                          --resource-group <msdocs-tutorial-rg-00000000> `
                          --tags Team=t1 Environment=e1


# Create new tags containing spaces. You must use quotes.
az storage account update --name <msdocssa00000000> `
                          --resource-group <msdocs-tutorial-rg-00000000> `
                          --tags "Floor number=f1" "Cost center=cc1"

# Create a new tag with an empty value.
az storage account update --name <msdocssa00000000> `
                          --resource-group <msdocs-tutorial-rg-00000000> `
                          --tags "Floor number="''""

# Create a new tag containing special characters resulting in "Path": "$G:\\myPath".
# Nate the backtick as both the line continuation and the PowerShell escape character.
az storage account update --name <msdocssa00000000> `
                          --resource-group <msdocs-tutorial-rg-00000000> `
                          --tags "Path=`$G:\myPath"

# Create a tag from a variable.
# In PowerShell, prefix your variable name with a dollar sign.
$newTag="tag1=tag value with spaces"
az storage account update --name <msdocssa00000000> `
                          --resource-group <msdocs-tutorial-rg-00000000> `
                          --tags "$newTag"
```

If you don't want to overwrite previous tags while you work through this tutorial step, use the [az tag update](/cli/azure/tag#az-tag-update) command setting the `--operation` parameter to `merge`.

```azurecli-interactive
# Get the resource ID of your storage account.
$saID=$(az resource show --resource-group <msdocs-tutorial-rg-00000000> `
                         --name <msdocssa00000000> `
                         --resource-type Microsoft.Storage/storageAccounts `
                         --query "id" `
                         --output tsv)

echo My storage account ID is $saID

# Append new tags.
az tag update --resource-id $saID `
              --operation merge `
              --tags <tagName>=<tagValue>

# Get a list of all tags.
az tag list --resource-id $saID
```

# [Cmd](#tab/cmd)

```azurecli-interactive
:: Create new tags. This syntax works with or without quotes around each key-value pair.
az storage account update --name <msdocssa00000000> ^
                          --resource-group <msdocs-tutorial-rg-00000000> ^
                          --tags Team=t1 Environment=e1

:: Create new tags containing spaces. You must use quotes.
az storage account update --name <msdocssa00000000> ^
                          --resource-group <msdocs-tutorial-rg-00000000> ^
                          --tags "Floor number=f1" "Cost center=cc1"

:: Create a new tag with an empty value.
az storage account update --name <msdocssa00000000> ^
                          --resource-group <msdocs-tutorial-rg-00000000> ^
                          --tags "Floor number="''""

```

If you need to modify an Azure resource using a variable, we suggest using Bash. Cmd often doesn't interpret variable values with special characters as expected. You often receive an "InvalidCharacters" error or your tag value is empty.

---

## Compare more environment-specific scripts

Take a deeper look at these script differences. These examples demonstrate quoting differences for the following:

* Pass a JSON string as a parameter value
* Filter results with the `--query` parameter
  * Numbers
  * Boolean values
  * Dates

# [Bash](#tab/Bash)

Example of a parameter containing a JSON string. This script is given for future reference as we are not working with `az rest` in this tutorial.

```azurecli
az rest --method patch \
        --url https://management.azure.com/subscriptions/<mySubscriptionID>/resourceGroups/<myResourceGroup>/providers/Microsoft.HybridCompute/machines/<machineName>?api-version=yyyy-mm-dd-preview \
        --resource https://management.azure.com/ \
        --headers Content-Type=application/json \
        --body '{"properties": {"agentUpgrade": {"enableAutomaticUpgrade": false}}}'
```

Example of filtering for a numeric value. Unless you have a VM in your current subscription, this example is given for future reference.

```azurecli
az vm list --resource-group <myResourceGroup> \
           --query "[?storageProfile.osDisk.diskSizeGb >=\`50\`].{Name:name, admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb}" \
           --output table
```

Example of filtering a boolean value using the storage account created in this tutorial.

```azurecli-interactive
az storage account list --resource-group <msdocs-tutorial-rg-00000000> \
    --query "[?allowBlobPublicAccess == \`true\`].id"
```

Examples of filtering a date using the storage account created in this tutorial.

```azurecli-interactive
# include time
az storage account list --resource-group <msdocs-tutorial-rg-00000000> \
    --query "[?creationTime >='2021-11-15T19:14:27.103127+00:00'].{saName:name, saID: id, sku: sku.name}"

# exclude time
az storage account list --resource-group <msdocs-tutorial-rg-00000000> \
    --query "[?creationTime >='2021-11-15'].{saName:name, saID: id, sku: sku.name}"

# subtract days and use a variable
saDate=$(date +%F -d "-30days")
az storage account list --resource-group <msdocs-tutorial-rg-00000000> \
    --query "[?creationTime >='$saDate'].{saName:name, saID: id, sku: sku.name}"
```

# [PowerShell](#tab/powershell)

Example of a parameter containing a JSON string. This script is given for future reference as we are not working with `az rest` in this tutorial.

```azurecli
az rest --method patch `
        --url https://management.azure.com/subscriptions/<mySubscriptionID>/resourceGroups/<myResourceGroup>/providers/Microsoft.HybridCompute/machines/<machineName>?api-version=yyyy-mm-dd-preview `
        --resource https://management.azure.com/ `
        --headers Content-Type=application/json `
        --body '{\"properties\": {\"agentUpgrade\": {\"enableAutomaticUpgrade\": false}}}'
```

Example of filtering for a numeric value. Unless you have a VM in your current subscription, this example is given for future reference.

```azurecli
az vm list --resource-group <myResourceGroup> `
           --query "[?storageProfile.osDisk.diskSizeGb >=``50``].{Name:name, admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" `
           --output table
```

Example of filtering a boolean value using the storage account created in this tutorial.

```azurecli-interactive
az storage account list --resource-group <msdocs-tutorial-rg-00000000> `
                       --query "[?allowBlobPublicAccess == ``true``].id"
```

Examples of filtering a date using the storage account created in this tutorial.

```azurecli-interactive
# include time
az storage account list --resource-group <msdocs-tutorial-rg-00000000> `
    --query "[?creationTime >='2021-11-15T19:14:27.103127+00:00'].{saName:name, saID: id, sku: sku.name}"

# exclude time
az storage account list --resource-group <msdocs-tutorial-rg-00000000> `
    --query "[?creationTime >='2021-11-15'].{saName:name, saID: id, sku: sku.name}"

# subtract days and use a variable
$saDate=$saDate.AddDays(-30).tostring("yyyy-mm-dd")
az storage account list --resource-group <msdocs-tutorial-rg-00000000> `
    --query "[?creationTime >='$saDate'].{saName:name, saID: id, sku: sku.name}"
```

# [Cmd](#tab/cmd)

Example of filtering for a numeric value. Unless you have a VM in your current subscription, this example is given for future reference.

```azurecli
az vm list --resource-group <myResourceGroup> `
           --query "[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name, admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" `
           --output table
```

Example of filtering a boolean value using the storage account created in this tutorial.

```azurecli-interactive
az storage account list --resource-group <msdocs-tutorial-rg-00000000> ^
    --query "[?allowBlobPublicAccess == `true`].id"
```

Examples of filtering a date using the storage account created in this tutorial.

```azurecli-interactive
# include time
az vm list --resource-group DevEx-Data-Analysis2 ^
           --query "[?storageProfile.osDisk.diskSizeGb >=`50`].{Name:name, admin:osProfile.adminUsername, DiskSize:storageProfile.osDisk.diskSizeGb }" ^
           --output table

az storage account list --resource-group <msdocs-tutorial-rg-00000000> ^
    --query "[?creationTime >='2021-11-15T19:14:27.103127+00:00'].{saName:name, saID: id, sku: sku.name}"

# exclude time
az storage account list --resource-group <msdocs-tutorial-rg-00000000> ^
    --query "[?creationTime >='2021-11-15'].{saName:name, saID: id, sku: sku.name}"

# subtract days and use a variable
saDate=$(date +%F -d "-30days")
az storage account list --resource-group <msdocs-tutorial-rg-00000000> ^
    --query "[?creationTime >='$saDate'].{saName:name, saID: id, sku: sku.name}"
```

---

## Debug Azure CLI reference commands

### Use `--debug` parameter

The Azure CLI offers a `--debug` parameter that can be used with any command. Debug output is extensive, but it gives you more information on execution errors. Use the Bash `clear` command to remove console output between tests.

These examples reveal the actual arguments received by the Azure CLI in Python syntax.

# [Bash](#tab/Bash)

This example is **correct** in both Bash and PowerShell.

```azurecli-interactive
az '{"key":"value"}' --debug
```

See what the Azure CLI is interpreting in the `Command arguments` line of the output.

```output
Command arguments: ['{"key":"value"}', '--debug']
```

This second example is also **correct**. Use the Bash `clear` command to remove console output between tests.

```azurecli-interactive
clear
az "{\"key\":\"value\"}" --debug
```

```output
Command arguments: ['{"key":"value"}', '--debug']
```

These next two examples are **incorrect** as quotes and spaces are interpreted by Bash.

|Incorrect format|Problem|Console output|
|-|-|-|
|az {"key":"value"} --debug |Missing single quotes or escape characters| Command arguments: ['{key:value}', '--debug']
|az {"key": "value"} --debug |Missing single quotes or escape characters, and contains extra space | Command arguments: ['{key:', 'value}', '--debug']

# [PowerShell](#tab/powershell)

This example is **correct** in both Bash and PowerShell.

```azurecli-interactive
az '{"key":"value"}' --debug
```

See what the Azure CLI is interpreting in the `Command arguments` line of the output. The double quotes missing around the output `key:value` pair is a known issue in PowerShell.

```output
Command arguments: ['{key:value}', '--debug']
```

These examples are all **incorrect**. Use PowerShell's `cls` command to remove console output between tests.

|Incorrect format|Problem |Console output|
|-|-|-|
|az "{\\"key\\":\\"value\\"}" --debug | Contains escape characters | Command arguments: ['{\\', 'key\\:\\value\\}', '--debug']
|az {"key":"value"} --debug | Missing single quotes | Unexpected token ':"value"' in expression or statement.
|az {"key": "value"} --debug | Missing single quotes and contains an extra space | Error: Unexpected token ':' in expression or statement.

# [Cmd](#tab/cmd)

This example is **correct**.

```azurecli-interactive
az "{\"key\":\"value\"}" --debug
```

See what the Azure CLI is interpreting in the `Command arguments` line of the output.

```output
Command arguments: ['{"key":"value"}', '--debug']
```

These examples are all **incorrect**. Use the Cmd's `cls` command to remove console output between tests.

|Incorrect format|Problem |Console output|
|-|-|-|
|az "{"key":"value"}" --debug | Missing escape characters | Command arguments: ['{key:value}', '--debug']
|az '{"key":"value"}' --debug |Missing escape characters and is using single quotes where double quotes are expected.| Command arguments: ["'{key:value}'", '--debug']
|az {"key":"value"} --debug | Missing escape characters and double quotes | Command arguments: ['{key:value}', '--debug']

---

### Use `echo` command

Although `--debug` tells you exactly what the Azure CLI is interpreting, a second option is to return the value of an expression to your console. This method is helpful when verifying the results of `--query` that is covered in detail in [Populate variables for use in scripts](./get-started-tutorial-3-use-variables.md).

# [Bash](#tab/Bash)

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
| echo %strExpression% | "{\\"key\\": \\"value\\"}"

---

## Troubleshooting

Here are common errors when an Azure CLI reference command syntax isn't written properly:

* "Bad request ...{something} is invalid" might be caused by a space, single or double quotation mark, or lack of a quote.

* "Unexpected token..." is seen when there's an extra space or quote.

* "Invalid jmespath_type value" error often comes from incorrect quoting in the `--query` parameter.

* "Variable reference is not valid" is received when a string isn't formatted properly often due to concatenation or a missing escape character.

* "Unrecognized arguments" is often caused by an incorrect line continuation character.

* "Missing expression after unary operator" is seen when a line continuation character is missing.

## Get more details

Do you want more detail on one of the subjects covered in this tutorial step? Use the links in this table to learn more.

|Subject| Learn more|
|-|-|
|Scripting differences | [Bash quoting](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Quoting)|
| | [PowerShell quoting](/powershell/module/microsoft.powershell.core/about/about_quoting_rules)|
| | [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md)
| | [Windows command-line tips](https://ss64.com/nt/syntax-esc.html)
|Parameters | [Use quotation marks in Azure CLI parameters](./use-cli-effectively.md#use-quotation-marks-in-parameters)
| | Find more syntax examples of Bash, PowerShell and Cmd in [Query command output using JMESPath](./query-azure-cli.md)

## Next Step

Now that you learned how to write Azure CLI syntax for Bash, PowerShell and Cmd, proceed to the next step to learn how to extract values to a variable.

> [!div class="nextstepaction"]
> [Populate variables for use in scripts](./get-started-tutorial-3-use-variables.md)
