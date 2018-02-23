---
title: Query command results with Azure CLI 2.0
description: Learn how to perform JMESPath queries on the output of Azure CLI 2.0 commands.
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Use JMESPath queries with Azure CLI 2.0

The Azure CLI 2.0 uses the `--query` argument to execute a [JMESPath query](http://jmespath.org) on the results of commands. JMESPath is a query language for JSON, allowing for traversing paths, flattening objects, re-keying dictionaries, and more. These queries are executed on the JSON output, before any other display formatting.

The `--query` argument is supported by all commands in the Azure CLI. The examples below cover common use cases and demonstrate how to use the features of JMESPath to extract the information you need from CLI output.

## Work with dictionary output

Commands which are guaranteed to return information on only a single JSON dictionary rather than array, most often `create` or `show` commands, can be explored by their key names alone. Key paths use the `.` character as a separator. The following example pulls all of the authorized public keys for connecting to a Linux VM:

```azurecli
az vm show -g QueryDemo -n TestVM --query osProfile.linuxConfiguration.ssh.publicKeys
```

When retrieving multiple keys in a query, there are two ways to do so. The first is to provide an array of key values, which are then presented in an array without any identifying key values. The following example shows how to retrieve the Azure image offering name, and the size of the OS disk it is allocated to:

```azurecli
az vm show -g QueryDemo -n TestVM --query 'storageProfile.[imageReference.offer, osDisk.diskSizeGb]'
```

```json
[
  "UbuntuServer",
  30
]
```

To query multiple elements at once while placing them into a JSON dictionary with keys, you can re-key them using a JMESPath feature called multiselect. This uses the format `{displayKey:keyPath, ...}` to filter on the `keyPath` JMESPath expression, and display it in the output as `displayKey`. The next example improves on the previous by making it clear what the values refer to.

```azurecli
az vm show -g QueryDemo -n TestVM --query 'storageProfile.{image:imageReference.offer, diskSize:osDisk.diskSizeGb}'
```

```json
{
  "diskSize": 30,
  "image": "UbuntuServer"
}
```

In particular, re-keying output is useful when working with the `table` output format. This allows you to customize the header names for columns and make the data even easier to inspect visually. For more information on output formats, see [Output formats for Azure CLI 2.0 commands](/cli/azure/format-output-azure-cli).

> [!NOTE]
> Certain keys are filtered out and not printed in the table view. These are `id`, `type`, and `etag`. If you need to see these, you can use JMESPath multiselect to change the key name and avoid filtering.
>
> ```azurecli
> az vm show -g QueryDemo -n TestVM --query "{objectID:id}" -o table
> ```

## Work with list output

CLI commands which could return more than one value, such as `list` operations, will return a JSON array instead of dictionary. Since arrays do not have keys, they can't be
immediately processed in the same way that single-result outputs can be. JMESPath allows for flattening arrays with the `[]` operator, written after the part of the key path to flaten. Flattening runs the query after it against every element of the array. The following example prints out the name and OS running on each VM in a resource group. 

```azurecli
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

Arrays which are part of a key path can be flattened as well. This example demonstrates a query which will get the Azure object IDs for the NICs a VM is connected to.

```azurecli
az vm show -g QueryDemo -n TestVM --query 'networkProfile.networkInterfaces[].id'
```

## Filter array output with predicates

JMESPath offers [filtering expressions](http://jmespath.org/specification.html#filterexpressions) to filter out the data displayed. These expressions are powerful, especially when combined with [JMESPath built-in functions](http://jmespath.org/specification.html#built-in-functions) to perform partial matches or manipulate data into a standard format. Filtering expressions only work on array data, and when used in any other situation, return the `null` value. This means that you can take the output of commands like `vm list` and filter on it to look for specific types of VMs. The following example expands on the previous by filtering out the VM type to capture only Windows VMs and print their name. This is a much easier way to find a _class_ of VMs rather than manually searching
their image names.

```azurecli
az vm list --query '[?osProfile.windowsConfiguration!=null].name'
```

```json
[
  "WinServ"
]
```

## Explore with jpterm

To experiment with JMESPath, you might want to work in an interactive environment where you can quickly edit queries and inspect the output. This is offered by the [JMESPath-terminal](https://github.com/jmespath/jmespath.terminal) Python package, which allows for piping data as input and then writing in-program queries to extract the data.

```bash
pip install jmespath-terminal
az vm list | jpterm
```
