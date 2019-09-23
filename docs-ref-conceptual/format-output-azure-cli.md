---
title: Output formats for Azure CLI
description: Learn how to format the output of Azure CLI commands to tables, lists or json.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/23/2019
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---
# Output formats for Azure CLI commands

The Azure CLI uses JSON as its default output format, but offers other formats.  Use the `--output` (`--out` or `-o`) parameter
to format CLI output. The argument values and types of output are:

--output | Description
---------|-------------------------------
`json`   | JSON string. This setting is the default.
`jsonc`  | Colorized JSON.
`yaml`   | YAML, a machine-readable alternative to JSON.
`table`  | ASCII table with keys as column headings.
`tsv`    | Tab-separated values, with no keys

## JSON output format

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
az vm list --out yaml
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
az vm list --out table
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
az vm list --query "[].{resource:resourceGroup, name:name}" -o table
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
> az vm list --query "[].{objectID:id}" -o table
> ```

For more about using queries to filter data, see [Use JMESPath queries with Azure CLI](/cli/azure/query-azure-cli).

## TSV output format

The `tsv` output format returns tab- and newline-separated values without additional formatting, keys, or other symbols. This format makes it easy to consume the output into other commands and tools that need to process the text in some form. Like the `table` format, `tsv` doesn't print nested objects.

Using the preceding example with the `tsv` option outputs the tab-separated result.

```azurecli-interactive
az vm list --out tsv
```

```output
None    None        /subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010    None    None    westus    DemoVM010            None    Succeeded    DEMORG1    None            Microsoft.Compute/virtualMachines    cbd56d9b-9340-44bc-a722-25f15b578444
None    None        /subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm212    None    None    westus    demovm212            None    Succeeded    DEMORG1    None            Microsoft.Compute/virtualMachines    4bdac85d-c2f7-410f-9907-ca7921d930b4
None    None        /subscriptions/.../resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm213    None    None    westus    demovm213            None    Succeeded    DEMORG1    None            Microsoft.Compute/virtualMachines    2131c664-221a-4b7f-9653-f6d542fbfa34
None    None        /subscriptions/.../resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo001VM    None    None    westus    KBDemo001VM            None    Succeeded    RGDEMO001    None            Microsoft.Compute/virtualMachines    14e74761-c17e-4530-a7be-9e4ff06ea74b
None    None        /subscriptions/.../resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo020   None    None    westus    KBDemo020            None    Succeeded    RGDEMO001    None            Microsoft.Compute/virtualMachines    36baa9-9b80-48a8-b4a9-854c7a858ece
```

One restriction of the TSV output format is that there isn't a guarantee on output ordering. The CLI makes a best effort to preserve ordering by sorting keys in the response JSON alphebetically,
and then printing their values in order for TSV output. This isn't a guarantee that the order is always identical though, since the Azure service response format may change.

In order to enforce consistent ordering, you'll need to use the `--query` parameter and the [multiselect list](query-azure-cli.md#get-multiple-values) format. When a CLI command returns a single
JSON dictionary, use the general format `[key1, key2, ..., keyN]` to force a key order.  For CLI commands which return an array, use the general format `[].[key1, key2, ..., keyN]` to order column values.

For example, to order the information displayed above by ID, location, resource group, and VM name:

```azurecli-interactive
az vm list --out tsv --query '[].[id, location, resourceGroup, name]'
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

```bash
az vm list --out tsv --query '[].[id, location, resourceGroup, name]' | grep RGD | cut -f4
```

```output
KBDemo001VM
KBDemo020
```

## Set the default output format

Use the interactive `az configure` command to set up your environment and establish default settings for output formats. The default output format is `json`.

```azurecli-interactive
az configure
```

```output
Welcome to the Azure CLI! This command will guide you through logging in and setting some default values.

Your settings can be found at /home/defaultuser/.azure/config
Your current configuration is as follows:

  ...

Do you wish to change your settings? (y/N): y

What default output format would you like?
 [1] json - JSON formatted output that most closely matches API responses.
 [2] jsonc - Colored JSON formatted output that most closely matches API responses.
 [3] table - Human-readable output format.
 [4] tsv - Tab- and Newline-delimited. Great for GREP, AWK, etc.
 [5] yaml - YAML formatted output. An alternative to JSON. Great for configuration files.
 [6] none - No output, except for errors and warnings.
Please enter a choice [1]:
```

To learn more about configuring your environment, see [Azure CLI configuration](/cli/azure/azure-cli-configuration).
