---
title: Tips to use the Azure CLI successfully in PowerShell | Microsoft Docs
description: Learn how to format Azure CLI parameters for a PowerShell scripting language.
ms.date: 06/21/2024
ms.custom: devx-track-azurecli
#customer intent: As an Azure CLI developer, I need a single place of information for troubleshooting errors that are unique to executing the Azure CLI in a PowerShell scripting language. When a Bash script won't copy without execution error to PowerShell, I don't want to look through multiple troubleshooting docs. Just give me one-stop troubleshooting for PowerShell. 
---

# Considerations for running the Azure CLI in a PowerShell scripting language

Azure CLI is a tool to manage Azure resources through Azure CLI reference commands that run in both
a Bash and PowerShell scripting language. However, there are slight syntax differences in parameter
formatting between scripting languages that can result in unexpected results. The purpose of this article
is to help you resolve Azure CLI syntax errors when working in a PowerShell scripting language.

This article compares syntax differences of Azure CLI commands executed in the following
scripting languages:

* Bash running in a Linux operating system using [Azure Cloud Shell](/azure/cloud-shell/overview).
* [PowerShell](/powershell/scripting/overview) running in a Linux operating system using Azure Cloud Shell.
* [Windows PowerShell](/powershell/scripting/windows-powershell/overview) running in Windows 11
  using the PowerShell 5 terminal.
* PowerShell running in a Windows 11 using the PowerShell 7 terminal.

If you're new to CLI, differentiating between a _tool_ and a _scripting language_ might be confusing. [How-to choose the right command-line tool](./choose-the-right-azure-command-line-tool.md)
provides a good comparison.

## Prerequisites

# [Read and learn](#tab/read)

This article is intended for you to read and learn. However, if you want to run the examples, select
the `Prepare your environments` tab to install the scripting languages used in this article.

# [Prepare your environments](#tab/install)

1. To execute the test cases given in this article, install or open these scripting languages:

   **Linux environments**

   In your Internet application of choice or in [Windows Terminal](/windows/terminal/), open two
   tabs using the links provided.

   * An instance of [Azure Cloud Shell](https://ms.portal.azure.com/#cloudshell/) running with Bash.
     If Azure Cloud Shell opens in a PowerShell scripting language, select the **switch to Bash** option in
     the Cloud Shell menu bar.
   * A second instance of [Azure Cloud Shell](https://ms.portal.azure.com/#cloudshell/) running with
     PowerShell. If Azure Cloud Shell opens in a Bash scripting language, select the **switch to
     PowerShell** option in the Cloud Shell menu bar.

   **Microsoft Windows environments**

   * A local installation of the [Azure CLI](./install-azure-cli-windows.md) in a Windows
     environment.
   * A local installation of Windows PowerShell 5.1 that is preinstalled in most Windows operating
     systems.
   * A local installation of [PowerShell 7](/powershell/scripting/install/installing-powershell-on-windows)
     in a Windows environment.

   This article was tested in Windows 11 Enterprise version 23H2.

1. Test to see what version of the Azure CLI and PowerShell you're using.

   ```powershell
   az version
    
   $PSVersionTable
   ```

   Here's the output from Azure Cloud Shell, which is **the most recent version of both Azure CLI
   and PowerShell**:

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

    Here's the output from a Windows PowerShell 5 terminal, which is **the version of Azure CLI and PowerShell
    installed on your machine**. In this output example, Azure CLI version 2.57.0 and Windows
    PowerShell 5.1.22621 are installed on the local machine.

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

    If you run `$PSVersionTable` in a PowerShell 7 terminal, then your PowerShell version is
    `PSVersion 7` or higher depending on what is installed on your local machine.

1. If you need an Azure storage account to run these test scripts, create one now.

   ```azurecli-interactive
   # Bash syntax example
   
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

   ```azurecli-interactive
   # PowerShell syntax example
   
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

   The Azure CLI returns over 100 lines of JSON output when a new storage account is created. The
   following JSON dictionary has fields omitted for brevity.

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

---

> [!IMPORTANT]
> When you have an Azure CLI script that is producing an error, **consider how the scripting language you
are working in is parsing the Azure CLI command syntax.**

## Pass spaces in Azure CLI parameters

In Azure CLI, when you need to pass a parameter value containing a space, there are quoting
differences between operating systems and scripting languages. In this example, use [az storage account list](/cli/azure/storage/account#az-storage-account-list)
and rename output columns with a word containing a space.

# [Bash in Linux](#tab/Bash1)

In this example, notice the single quote (`'...'`) wrapper with embedded double quotes (`"..."`).
This example also works in PowerShell in Linux.

```azurecli
az storage account list --query '[].{"SA Name":name, "Primary endpoint":primaryEndpoints.blob}' --output table
```

If you want to add a filter, the syntax changes. Notice how this example wraps the `--query`
parameter value in double quotes (`"..."`) and uses a backslash (`\`) escape character. This script
doesn't run in PowerShell.

```azurecli
 az storage account list --query "[?creationTime >='2024-02-01'].{\"SA Name\":name,\"Primary endpoint\":primaryEndpoints.blob}" --output table
```

If you just tried to run the filter syntax in a PowerShell scripting language, you received error message
`argument --query: invalid jmespath_type value: "[?creationTime >=..."`. However, in Bash within a
Linux environment, your output is similar to this:

```output
SA Name           Primary Endpoint
-----------       -----------------
msdocssa00000000  https://msdocssa000000000.blob.core.windows.net/
```

# [PowerShell in Linux](#tab/ps1)

In this example, notice the double quote (`"..."`) wrapper with embedded double quotes, and backtick
`` ` `` escape character.

```azurecli
az storage account list --query "[].{`"SA Name`":name, `"Primary endpoint`":primaryEndpoints.blob}" --output table
```

If you run this syntax in Windows PowerShell or PowerShell 7 installed on a Window's machine, you
receive error `argument --query: invalid jmespath_type value: '[].{SA'`. Notice how the error
message is breaking on the space between `SA` and `Name`. In Bash within a Linux environment, your error message is `argument --query: invalid jmespath_type value: '[].{:name,'`.

Now add a filter. Unlike the Bash script, adding a date filter doesn't require reworking the entire
`--query` string.

```azurecli
az storage account list --query "[?creationTime >='2024-02-01'].{`"SA Name`":name, `"Primary endpoint`":primaryEndpoints.blob}" --output table
```

# [PowerShell 7.4.1 in Windows](#tab/win2)

In this example, notice the single quotes (`'...'`) wrapper with embedded double quotes (`""...""`),
and escape character backslash (`\`).

```azurecli
az storage account list --query '[].{\"SA Name\":name,\"Primary endpoint\":primaryEndpoints.blob}' --output table
```

Notice the single quotes (`'...'`) wrapper with embedded double quote pairs (`""...""`). This script
also runs successfully in Windows PowerShell 5.

```azurecli
az storage account list --query '[].{""SA Name"":name,""Primary endpoint"":primaryEndpoints.blob}' --output table
```

Apply a `creationTime` filter and notice the single quote (`'...'`) wrapper remains, but an embedded
single quote pair (`''...''`) is used to surround the date value. This script also runs successfully
in Windows PowerShell 5.

```azurecli
az storage account list --query '[?creationTime >=''2024-02-01''].{""SA Name"":name,""Primary endpoint"":primaryEndpoints.blob}' --output table
```

# [PowerShell 5.1 in Windows](#tab/win1)

In this example, notice the single quote (`'...'`) wrapper with embedded double quote pairs
(`""...""`). This script also runs successfully in PowerShell 7 within a Windows environment.

```azurecli
az storage account list --query '[].{""SA Name"":name,""Primary endpoint"":primaryEndpoints.blob}' --output table
```

Apply a `creationTime` filter and notice the single quote (`'...'`) wrapper remains, but an embedded
single quote pair (`''...''`) is used to surround the date value. This script also runs successfully
in PowerShell 7 within a Windows environment.

```azurecli
az storage account list --query '[?creationTime >=''2024-02-01''].{""SA Name"":name,""Primary endpoint"":primaryEndpoints.blob}' --output table
```

Did you receive an `argument --query: invalid jmespath_type value:...` error from the scripts on this
tab? This error is returned when executing these Windows scripts in Bash or PowerShell 7 _within a
Linux environment_.

---

## Pass parameters in a URL containing a query string

Question marks in URLs indicate the end of the URL and the beginning of a query string. Here's an
example that opens step 3 in [Learn to use the Azure CLI](./get-started-tutorial-3-use-variables.md):

`/cli/azure/account?view=azure-cli-2020-09-01-hybrid`.

The `?view=azure-cli-2020-09-01-hybrid` results in the desired version of the Azure CLI reference content.

When you execute Azure CLI commands in a PowerShell scripting language, PowerShell allows question marks to
be part of a variable name. This might create confusion in Azure CLI parameter values.

Here's an example from the [Use the Azure REST API](./use-azure-cli-rest-command.md?tabs=powershell#use-get-to-retrieve-your-azure-container-registry)
article:

# [Bash](#tab/Bash2)

Notice how `$containerRegistryName?api-version` concatenates together without error in Bash.

```azurecli
# Script for a Bash scripting language

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
subscriptionId="00000000-0000-0000-0000-000000000000"
resourceGroup="msdocs-app-rg$randomIdentifier"
containerRegistryName="msdocscr$randomIdentifier"

# prior to this GET example, the resource group and container registry were created in the article.

az rest --method get --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/$containerRegistryName?api-version=2023-01-01-preview
```

# [PowerShell](#tab/ps2)

Notice the brackets `{}` needed in PowerShell for `${containerRegistryName}?api-version`. Without the brackets, PowerShell
interprets a question mark (`?`) as being part of the parameter name `$containerRegistryName`.

This behavior is the same in PowerShell 5 and PowerShell 7 running in Linux or Windows.

```azurecli
# Script for a PowerShell scripting language

# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$subscriptionId="00000000-0000-0000-0000-000000000000"
$resourceGroup="msdocs-app-rg$randomIdentifier"
$containerRegistryName="msdocscr$randomIdentifier"

# prior to this GET example, the resource group and container registry were created in the article.

az rest --method get --url https://management.azure.com/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.ContainerRegistry/registries/${containerRegistryName}?api-version=2023-01-01-preview
```

---

## Pass parameters containing the ampersand symbol

If you have a scenario where you need to pass an ampersand in a parameter value, be aware that the ampersand (`&`) symbol is interpreted by PowerShell. You can see this happen using the `--debug` parameter:

```azurecli
az "a&b" --debug

# output
'a' is misspelled or not recognized by the system.
'b' is not recognized as an internal or external command
```

However, if you use this same test to add a tag to a resource group, the ampersand in the tag value doesn't cause an error.

```azurecli
az group create --location eastus2 --name "msdocs-rg-test"
az group update --name "msdocs-rg-test" --tags "company name=Contoso & Sons"

# output
{
  "id": "/subscriptions/3618afcd-ea52-4ceb-bb46-53bb962d4e0b/resourceGroups/msdocs-rg-test",
  "location": "eastus2",
  "managedBy": null,
  "name": "msdocs-rg-test",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": {
    "company name": "Contoso & Sons"
  },
  "type": "Microsoft.Resources/resourceGroups"
}
```

If you have a scenario where the ampersand in a parameter value is causing an error, here are some solutions:

```azurecli
# When quoted by single quotes ('), double quotes (") are preserved by PowerShell and sent
# to Command Prompt, so that ampersand (&) is treated as a literal character
> az '"a&b"' --debug
Command arguments: ['a&b', '--debug']

# Escape double quotes (") with backticks (`) as required by PowerShell
> az "`"a&b`"" --debug
Command arguments: ['a&b', '--debug']

# Escape double quotes (") by repeating them
> az """a&b""" --debug
Command arguments: ['a&b', '--debug']

# With a whitespace in the argument, double quotes (") are preserved by PowerShell and
# sent to Command Prompt
> az "a&b " --debug
Command arguments: ['a&b ', '--debug']

# Use --% to stop PowerShell from parsing the argument
> az --% "a&b" --debug
Command arguments: ['a&b', '--debug']
```

## Pass parameters containing an _at_ (`@`)  symbol

There are special characters of PowerShell, such as the _at_ (`@`) symbol which is a [splatting operator](/powershell/module/microsoft.powershell.core/about/about_splatting)
in PowerShell.  Add a backtick `` ` `` before the special character to escape it. You can also enclose
the value in single (`'`) or double (`"`) quotes.

**The following three examples will work in PowerShell:**

* parameterName `@parameters.json
* parameterName '@parameters.json'
* parameterName "@parameters.json"

**This example will not work in PowerShell:**

* parameterName @parameters.json

Here's another example in the `az ad app create` command:  Notice the double quotes (`"..."`) around the JSON file name needed in a PowerShell scripting language.

```azurecli
# Script for a PowerShell scripting language

az ad app create --display-name myTestAppName `
    --is-fallback-public-client `
    --required-resource-accesses "@manifest.json"
```

## Pass parameters containing JSON

For complex arguments like a JSON string, the best practice is to use Azure CLI's `@<file>`
convention to load from a file to bypass the shell's interpretation. For JSON syntax examples for Bash, PowerShell and Cmd.exe, see [Quoting differences between scripting languages - JSON strings](./use-azure-cli-successfully-quoting.md#json-strings).

## Pass parameters containing key:value pairs

Some Azure CLI parameter values, such as Azure resource tags, require key:value pairs. If your `key`
or `value` contains a space or special character, the Bash and PowerShell syntax aren't always the
same.

For syntax examples for Bash, PowerShell and Cmd, see [Create tags to practice quoting differences](./get-started-tutorial-2-environment-syntax.md#create-tags-to-practice-quoting-differences)
in the [Learn to use the Azure CLI](./get-started-tutorial-0-before-you-begin.md) tutorial. This
tutorial step gives examples for the following key:value pair scenarios:

* spaces
* empty values
* special characters
* variables

## Stop-parsing symbol

The stop-parsing symbol (`--%`), introduced in PowerShell 3.0, directs PowerShell to refrain from interpreting input as PowerShell commands or expressions. When it encounters a stop-parsing symbol, PowerShell treats the remaining characters in the line as a literal.

```azurecli
az --% vm create --name xxx
```

## Error handling for Azure CLI in PowerShell

You can run Azure CLI commands in PowerShell, as described in [Choose the right Azure command-line tool](choose-the-right-azure-command-line-tool.md).
If you do, be sure you understand Azure CLI error handling in PowerShell. In particular, Azure CLI
doesn't create exceptions for PowerShell to catch.

An alternative is to use the `$?` automatic variable. This variable contains the status of the most
recent command. If the previous command fails, `$?` has the value of `$False`. For more information,
see [about_Automatic_Variables](/powershell/module/microsoft.powershell.core/about/about_automatic_variables).

The following example shows how this automatic variable can work for error handling:

```azurecli
# Script for a PowerShell scripting language

az group create --name MyResourceGroup
if ($? -eq $false) {
    Write-Error "Error creating resource group."
}
```

The `az` command fails because it's missing the required `--location` parameter. The conditional
statement finds that `$?` is false and writes an error.

If you want to use the `try` and `catch` keywords, you can use `throw` to create an exception for
the `try` block to catch:

```azurecli
# Script for a PowerShell scripting language

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

By default, PowerShell catches only terminating errors. This example sets the
`$ErrorActionPreference` global variable to `Stop` so PowerShell can handle the error.

The conditional statement tests the `$?` variable to see if the previous command failed. If so, the
`throw` keyword creates an exception to catch. The `catch` block can be used to write an error
message or handle the error.

The example restores `$ErrorActionPreference` to its default value.

For more information about PowerShell error handling, see [Everything you wanted to know about exceptions](/powershell/scripting/learn/deep-dives/everything-about-exceptions).

## Enable Tab Completion in PowerShell

[!INCLUDE [tab-completion](includes/tab-completion.md)]

## See also

* Azure CLI engineering notes on [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md)
* Compare syntax of Bash, PowerShell, and Cmd in these articles:
  * [Quoting differences between scripting languages](./use-azure-cli-successfully-quoting.md)
  * [Learn Azure CLI syntax differences in Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md) tutorial
  * [Query Azure CLI command output using a JMESPath query](./use-azure-cli-successfully-query.md)
