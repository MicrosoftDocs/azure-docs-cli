---
title: Output formats - Azure CLI | Microsoft Docs
description: The Azure CLI offers various output formats such as JSON and YAML. Learn how to format the output of Azure CLI commands to tables, lists or json.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 01/29/2024
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli commands 
---
# Output formats for Azure CLI commands

The Azure CLI uses JSON as its default output format, but offers other formats. Use the `--output` (`--out` or `-o`) parameter
to format CLI output. The argument values and types of output are:

--output | Description
---------|-------------------------------
`json`   | JSON string. This setting is the default
`jsonc`  | Colorized JSON
`table`  | ASCII table with keys as column headings
`tsv`    | Tab-separated values, with no keys
`yaml`   | YAML, a human-readable alternative to JSON
`yamlc`  | Colorized YAML
`none`   | No output other than errors and warnings

> [!WARNING]
> Use an output format of `none` or store command output in a variable to avoid exposing secrets such as API keys and credentials. **Note:** Certain CI/CD environments may store the output of the executed commands in logs. It is a good practice to confirm what is written in those log files and who has access to the logs.
> For more information, see [None output format](#none-output-format).

## JSON output format (default)

The following example displays the list of virtual machines in your subscriptions in the default JSON format.

```azurecli-interactive
az vm list --output json
```

The following output has some fields omitted for brevity, and identifying information replaced.

```json
[
  {
    "availabilitySet": null,
    "diagnosticsProfile": null,
    "hardwareProfile": {
      "vmSize": "Standard_DS1"
    },
    "id": "/subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010",
    "instanceView": null,
    "licenseType": null,
    "location": "westus",
    "name": "DemoVM010",
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/.../resourceGroups/demorg1/providers/Microsoft.Network/networkInterfaces/DemoVM010VMNic",
          "primary": null,
          "resourceGroup": "demorg1"
        }
      ]
    },
          ...
          ...
          ...
]
```

## YAML output format

The `yaml` format prints output as [YAML](http://yaml.org/), a plain-text data serialization format. YAML tends to be easier to read than JSON, and easily maps to
that format. Some applications and CLI commands take YAML as configuration input, instead of JSON.

```azurecli-interactive
az vm list --output yaml
```

The following output has some fields omitted for brevity, and identifying information replaced.

```yaml
- availabilitySet: null
  diagnosticsProfile: null
  hardwareProfile:
    vmSize: Standard_DS1_v2
  id: /subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010
  identity: null
  instanceView: null
  licenseType: null
  location: westus
  name: ExampleVM1
  networkProfile:
    networkInterfaces:
    - id: /subscriptions/.../resourceGroups/DemoRG1/providers/Microsoft.Network/networkInterfaces/DemoVM010Nic
      primary: null
      resourceGroup: DemoRG1
  ...
...
```

## Table output format

The `table` format prints output as an ASCII table, making it easy to read and scan. Nested objects aren't included in table output, but can still be filtered as part of a query. Some fields aren't included in the table, so this format is best when you want a quick, human-searchable overview of data.

```azurecli-interactive
az vm list --output table
```

```output
Name         ResourceGroup    Location
-----------  ---------------  ----------
DemoVM010    DEMORG1          westus
demovm212    DEMORG1          westus
demovm213    DEMORG1          westus
KBDemo001VM  RGDEMO001        westus
KBDemo020    RGDEMO001        westus
```

You can use the `--query` parameter to customize the properties and columns you want to show in the list output. The following example shows how to select just the VM Name and the Resource Group Name in the `list` command.

```azurecli-interactive
az vm list --query "[].{resource:resourceGroup, name:name}" --output table
```

```output
Resource    Name
----------  -----------
DEMORG1     DemoVM010
DEMORG1     demovm212
DEMORG1     demovm213
RGDEMO001   KBDemo001VM
RGDEMO001   KBDemo020
```

> [!NOTE]
> Some keys are not printed in the table view by default. These are `id`, `type`, and `etag`. If you need to see these
> in your output, you can use the JMESPath re-keying feature to change the key name and avoid filtering.
>
> ```azurecli-interactive
> az vm list --query "[].{objectID:id}" --output table
> ```

For more about using queries to filter data, see [Use JMESPath queries with Azure CLI](./use-azure-cli-successfully-query.md).

## TSV output format

The `tsv` output format returns tab- and newline-separated values without extra formatting, keys, or other symbols. This format makes it easy to consume the output into other commands and tools that need to process the text in some form. Like the `table` format, `tsv` doesn't print nested objects.

Using the preceding example with the `tsv` option outputs the tab-separated result.

```azurecli-interactive
az vm list --output tsv
```

```output
None    None        /subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010    None    None    westus    DemoVM010            None    Succeeded    DEMORG1    None            Microsoft.Compute/virtualMachines    cbd56d9b-9340-44bc-a722-25f15b578444
None    None        /subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm212    None    None    westus    demovm212            None    Succeeded    DEMORG1    None            Microsoft.Compute/virtualMachines    4bdac85d-c2f7-410f-9907-ca7921d930b4
None    None        /subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm213    None    None    westus    demovm213            None    Succeeded    DEMORG1    None            Microsoft.Compute/virtualMachines    2131c664-221a-4b7f-9653-f6d542fbfa34
None    None        /subscriptions/.../resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo001VM    None    None    westus    KBDemo001VM            None    Succeeded    RGDEMO001    None            Microsoft.Compute/virtualMachines    14e74761-c17e-4530-a7be-9e4ff06ea74b
None    None        /subscriptions/.../resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo020   None    None    westus    KBDemo020            None    Succeeded    RGDEMO001    None            Microsoft.Compute/virtualMachines    36baa9-9b80-48a8-b4a9-854c7a858ece
```

One restriction of the TSV output format is that there isn't a guarantee on output ordering. The CLI makes a best effort to preserve ordering by sorting keys in the response JSON alphabetically,
and then printing their values in order for TSV output. There is no guarantee that the order is always identical, since the Azure service response format can change.

In order to enforce consistent ordering, you'll need to use the `--query` parameter and the [multiselect list](use-azure-cli-successfully-query.md#get-multiple-values) format. When a CLI command returns a single
JSON dictionary, use the general format `[key1, key2, ..., keyN]` to force a key order.  For CLI commands that return an array, use the general format `[].[key1, key2, ..., keyN]` to order column values.

For example, to order the information displayed above by ID, location, resource group, and VM name:

```azurecli-interactive
az vm list --output tsv --query '[].[id, location, resourceGroup, name]'
```

```output
/subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010    westus    DEMORG1    DemoVM010
/subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm212    westus    DEMORG1    demovm212
/subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm213    westus    DEMORG1    demovm213
/subscriptions/.../resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo001VM     westus  RGDEMO001       KBDemo001VM
/subscriptions/.../resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo020       westus  RGDEMO001       KBDemo020
```

The next example shows how `tsv` output can be piped to other commands in bash. The query is used to filter output and force ordering, `grep` selects items that have text "RGD" in them, then the `cut`
command selects the fourth field to show the name of the VM in output.

```azurecli-interactive
az vm list --output tsv --query '[].[id, location, resourceGroup, name]' | grep RGD | cut -f4
```

```output
KBDemo001VM
KBDemo020
```

The `tsv` output format is often used when assigning values to variables. This example gets the active subscription ID and stores it into a variable for use in a script.

# [Bash](#tab/bash)

```azurecli
# Bash Script
subscriptionID=$(az account show --query id --output tsv)
echo "Using subscription ID $subscriptionID"
```

# [PowerShell](#tab/powershell)

```azurecli
# PowerShell script
$subscriptionID = az account show --query id --output tsv
echo "Using subscription ID $subscriptionID"
```

---

For more `--query` parameter examples, see [How to query Azure CLI command output](./use-azure-cli-successfully-query.md).

## None output format

Some Azure CLI commands output information you must protect. Here are four examples:

- passwords
- connection strings
- secrets
- keys

To protect secrets and keys when using Azure CLI commands, choose one of these options:

|Option|Benefit|Use case|
|-|-|-|
|`--output none` output format| Keeps sensitive information from being displayed in your console. If your command fails, you'll still receive error messages.| 1. Use when command output _can be_ retrieved at a later time.|
| | | 2. Use when you have no need for output.
| | | 3. A common choice when a managed identity or a service principal is being used to manage Azure resources.
|`--query` parameter | Stores output in a variable. |1. Use when command output _can't be_ retrieved at a later time.|
| | | 2. Use when you need to use a command output value in a script.

### Use `none` and retrieve security information at a later time

_Some_ Azure secrets can be retrieved at a later time. A good example is secrets stored in Azure Key Vault. In this example, create an Azure Key Vault secret using [az keyvault secret set](/cli/azure/keyvault/secret#az-keyvault-secret-set) with the `--output none` option. You can retrieve the secret later using the [az keyvault secret show](/cli/azure/keyvault/secret#az-keyvault-secret-show) command.

```azurecli-interactive
az keyvault secret set --name MySecretName \
                       --vault-name MyKeyVaultName \
                       --value MySecretValue\
                       --output none
```

### Use `--query` and return security information to a variable

The use of `--query` to store output in a variable is technically not an output format. It is a solution to protect secrets, and is an alternative to using `--output none`. For example, when you reset a service principal credential, the password can't be retrieved again.

Reset a service principal credential returning output in the default json format:

```azurecli-interactive
# reset service principal credentials using default output format (json).
az ad sp credential reset --id myServicePrincipalID --output json
```

Console output showing the new password in the console.

```output
{
  "appId": "myServicePrincipalID",
  "password": "myServicePrincipalNewPassword",
  "tenant": "myTenantID"
}
```

A better solution is to return sensitive information to a variable.

# [Bash](#tab/bash)

```azurecli
# Bash Script
# reset service principal credentials returning results to a variable
myNewPassword=$(az ad sp credential reset --id myServicePrincipalID --query password --output tsv)

# Display the new password (remove this line in production for security)
echo "New password: $myNewPassword"
```

# [PowerShell](#tab/powershell)

```azurecli
# PowerShell script
# Reset service principal credentials and capture the new password
$myNewPassword = (az ad sp credential reset --id myServicePrincipalID --query password --output tsv)

# Display the new password (remove this line in production for security)
echo "New password: $myNewPassword"
```

---
For more examples on storing output to a variable, see [Use the Azure CLI successfully - pass values to another command](./use-azure-cli-successfully-tips.md#pass-values-to-another-command). To learn more about `--query` parameter syntax, see [How to query Azure CLI command output](./use-azure-cli-successfully-query.md).

## Set the default output format

Azure CLI commands provide output that can be controlled in two ways:

|Output control | Benefit | How-to
|-|-|-|
|Global setting| Select a default output value that you use the most so you don't have to continually provide an `--output` parameter for each reference command.| Specify a default output format using [az config set](./azure-cli-configuration.md#cli-configuration-values-and-environment-variables).
|Command parameter| Specify output at the command level and give your scripts maximum flexibility. You control console output and variable input for each reference command. | Override the default setting using a reference command's `--output` parameter.

The default output for the Azure CLI is `json`. Set the default output to `none` when console output isn't needed.

```azurecli-interactive
az config set core.output=none
```

You can overwrite the default output of any Azure CLI reference command by using the `--output` parameter. Here's a script of commands that alter and test command output:

```azurecli-interactive
# set your default output to table
az config set core.output=table

# show your active subscription in table format
# notice how only a subset of properties are returned in the table
az account show

# override your table default and show your active subscription in jsonc format
az account show --output jsonc

# reset your default output to json
az config set core.output=json
```

## See also

- [Azure CLI configuration](./azure-cli-configuration.md)
- [How to query Azure CLI command output](./use-azure-cli-successfully-query.md)
- [Tips to use the Azure CLI successfully](./use-azure-cli-successfully-tips.md)
