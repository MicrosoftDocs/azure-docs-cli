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

In particular, re-keying output is useful when working with the `table` output format. This allows you to customize the header names for columns and make the data even easier to inspect visually.

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

## Filter output with predicates

JMESPath offers a [number of built-in functions](http://jmespath.org/specification.html#builtin-functions) that can be used as part of queries to manipulate data. These functions can be used in conjunction with [filtering expressions](http://jmespath.org/specification.html#filterexpressions) to filter out the data displayed or change its values. For example, rather than
piping output to `grep` to search for specific expressions, instead you can filter directly on the key path that you're interested in. The following example demonstrates how to find the VMs
in a resource group running Windows, and prints their names and Azure object IDs.

```azurecli

```

```azurecli-interactive
az vm list \
  --query "[?contains(resourceGroup, 'RGD')].{ resource: resourceGroup, name: name }" --out table
```

```
Resource    VMName
----------  -----------
RGDEMO001   KBDemo001VM
RGDEMO001   KBDemo020
```

With the next example, the results will return the VMs that have the vmSize 'Standard_DS1'.

```azurecli-interactive
az vm list \
  --query "[?contains(hardwareProfile.vmSize, 'Standard_DS1')]" --out table
```

```
ResourceGroup    VMName     VmId                                  Location    ProvisioningState
---------------  ---------  ------------------------------------  ----------  -------------------
DEMORG1          DemoVM010  cbd56d9b-9340-44bc-a722-25f15b578444  westus      Succeeded
DEMORG1          demovm111  c1c024eb-3837-4075-9117-bfbc212fa7da  westus      Succeeded
DEMORG1          demovm211  95eda642-417f-4036-9475-67246ac0f0d0  westus      Succeeded
DEMORG1          demovm212  4bdac85d-c2f7-410f-9907-ca7921d930b4  westus      Succeeded
DEMORG1          demovm213  2131c664-221a-4b7f-9653-f6d542fbfa34  westus      Succeeded
DEMORG1          demovm214  48f419af-d27a-4df0-87f3-9481007c2e5a  westus      Succeeded
DEMORG1          demovm222  e0f59516-1d69-4d54-b8a2-f6c4a5d031de  westus      Succeeded
```

## Explore with jpterm

To learn more about working with CLI output and JMESPath, you can install [JMESPath-terminal](https://github.com/jmespath/jmespath.terminal), pipe output to it, and experiment with your JMESPath query there.

```bash
pip install jmespath-terminal
az vm list | jpterm
```
