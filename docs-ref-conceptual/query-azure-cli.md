---
title: Query command results with Azure CLI 
description: Learn how to perform JMESPath queries on the output of Azure CLI  commands.
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 09/09/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---
# Use JMESPath queries with Azure CLI 

The Azure CLI uses the `--query` argument to execute a [JMESPath query](http://jmespath.org) on the results of commands. JMESPath is a query language for JSON, giving you the ability to select and present data from CLI output. These queries are executed on the JSON output before any display formatting.

The `--query` argument is supported by all commands in the Azure CLI. This article's examples cover common use cases and demonstrate how to use the features of JMESPath.

## Work with dictionary output

Commands that return a JSON dictionary can be explored by their key names alone. Key paths use the `.` character as a separator. The following example pulls a list of the public SSH keys allowed to connect to a Linux VM:

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query osProfile.linuxConfiguration.ssh.publicKeys
```

Multiple values can be put into an ordered array. The following example shows how to retrieve the Azure image offering name and the size of the OS disk:

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query 'storageProfile.[imageReference.offer, osDisk.diskSizeGb]'
```

```json
[
  "UbuntuServer",
  30
]
```

If you want keys in your output, you can use an alternate dictionary syntax.  Element selection into a dictionary uses the format `{displayKey:keyPath, ...}` to filter on the `keyPath` JMESPath expression. In the output values, the key/value pairs are changed to `{displayKey: value}`. The next example takes the last example's query, and makes it clearer by assigning keys to the output:

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query 'storageProfile.{image:imageReference.offer, diskSize:osDisk.diskSizeGb}'
```

```json
{
  "diskSize": 30,
  "image": "UbuntuServer"
}
```

When displaying information in the `table` output format, dictionary display allows setting your own column headers. For more information on output formats, see [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli).

> [!NOTE]
> Certain keys are filtered out and not printed in the table view. These keys are `id`, `type`, and `etag`. If you need to see this information, you can change the key name and avoid filtering.
>
> ```azurecli-interactive
> az vm show -g QueryDemo -n TestVM --query "{objectID:id}" -o table
> ```

## Work with list output

CLI commands that may return  more than one value return an array. Array elements are accessed by index and may not be returned in the same order every time. You can query all array elements at once by flattening them with the `[]` operator. The operator is put after the array or as the first element in an expression. Flattening an array runs the query after it against each element of the array.

The following example prints out the name and OS running on each VM in a resource group.

```azurecli-interactive
az vm list -g QueryDemo --query '[].{name:name, image:storageProfile.imageReference.offer}'
```

```json
[
  {
    "image": "CentOS",
    "name": "CentBox"
  },
  {
    "image": "openSUSE-Leap",
    "name": "SUSEBox"
  },
  {
    "image": "UbuntuServer",
    "name": "TestVM"
  },
  {
    "image": "UbuntuServer",
    "name": "Test2"
  },
  {
    "image": "WindowsServer",
    "name": "WinServ"
  }
]
```

Arrays that are part of a key path can be flattened as well. The following query gets the Azure object IDs for the NICs a VM is connected to.

```azurecli-interactive
az vm show -g QueryDemo -n TestVM --query 'networkProfile.networkInterfaces[].id'
```

## Filter array output with predicates

JMESPath offers [filtering expressions](http://jmespath.org/specification.html#filterexpressions) to filter out the data displayed. These expressions are powerful, especially when combined with [JMESPath built-in functions](http://jmespath.org/specification.html#built-in-functions) to do partial matches or manipulate data into a standard format. Filtering expressions only work on array data, and when used in any other situation, return the `null` value. For example, you can take the output of commands like `vm list` and filter on it to look for specific types of VMs. The following example expands on the previous by filtering out the VM type to capture only Windows VMs and print their name.

```azurecli-interactive
az vm list --query '[?osProfile.windowsConfiguration!=null].name'
```

```json
[
  "WinServ"
]
```

## Experiment with queries interactively

To start learning JMESPath, the [JMESPath-terminal](https://github.com/jmespath/jmespath.terminal) Python package offers an interactive environment to experiment
with queries. Data is piped as input, and then in-program queries are written and edited to extract the data.

```bash
pip install jmespath-terminal
az vm list --output json | jpterm
```
