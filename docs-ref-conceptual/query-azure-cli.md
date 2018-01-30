---
title: Query command results with Azure CLI 2.0
description: Use --query to perform JMESPath queries on the output of Azure CLI 2.0 commands.
keywords: Azure CLI 2.0, JMESPath, query, Linux, Mac, Windows, OS X
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
ms.assetid: 5979acc5-21a5-41e2-a4b6-3183bfe6aa22
---

# Using JMESPath queries with Azure CLI 2.0

The Azure CLI 2.0 uses the `--query` parameter to execute a [JMESPath query](http://jmespath.org) on the results of your `az` command. JMESPath is a powerful query language for JSON outputs.  If you are unfamiliar with JMESPath queries you can find a tutorial at [JMESPath.org/tutorial](http://JMESPath.org/tutorial.html).

`Query` parameter is supported by every resource type (Container Services, Web Apps, VM, etc.) within Azure CLI 2.0 and can be used for various different purposes.  We have listed several examples below.

## Selecting simple properties

The simple `list` command with `table` output format returns a curated set of most common, simple properties for each resource type in an easy-to-read tabular format.

```azurecli-interactive
az vm list --out table
```

```
Name         ResourceGroup    Location
-----------  ---------------  ----------
DemoVM010    DEMORG1          westus
demovm212    DEMORG1          westus
demovm213    DEMORG1          westus
KBDemo001VM  RGDEMO001        westus
KBDemo020    RGDEMO001        westus
```

You can use the `--query` parameter to show just the Resource Group name and VM name for all virtual machines in your subscription.

```azurecli-interactive
az vm list \
  --query "[].[name, resourceGroup]" --out table
```

```
Column1     Column2
---------   -----------
DemoVM010   DEMORG1
demovm111   DEMORG1
demovm211   DEMORG1
demovm212   DEMORG1
demovm213   DEMORG1
demovm214   DEMORG1
demovm222   DEMORG1
KBDemo001VM RGDEMO001
KBDemo020   RGDEMO001
```

In the previous example, you notice that the column headings are "Column1" and "Column2".  You can add friendly labels or names to the properties you select, as well.  In the following example, we added the labels "VMName" and "RGName" to the selected properties "name" and "resourceGroup".


```azurecli-interactive
az vm list \
  --query "[].{RGName:resourceGroup, VMName:name}" --out table
```

```
RGName     VMName
---------  -----------
DEMORG1    DemoVM010
DEMORG1    demovm111
DEMORG1    demovm211
DEMORG1    demovm212
DEMORG1    demovm213
DEMORG1    demovm214
DEMORG1    demovm222
RGDEMO001  KBDemo001VM
RGDEMO001  KBDemo020
```

## Selecting complex nested properties

If the property you want to select is nested deep in the JSON output you need to supply the full path to that nested property. The following example shows how to select the VMName and the OS type from the vm list command.

```azurecli-interactive
az vm list \
  --query "[].{VMName:name, OSType:storageProfile.osDisk.osType}" --out table
```

```
VMName       OSType
-----------  --------
DemoVM010    Linux
demovm111    Linux
demovm211    Linux
demovm212    Linux
demovm213    Linux
demovm214    Linux
demovm222    Linux
KBDemo001VM  Linux
KBDemo020    Linux
```

## Filter with the contains function

You can use the JMESPath `contains` function to refine your results returned in the query.
In the following example, the command selects only VMs that have the text "RGD" in their name.

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

## Filter with grep

The `tsv` output format is a tab-separated text with no headers. It can be piped to commands like `grep` and `cut` to further parse specific values out of the `list` output. In the following example, the `grep` command selects only VMs that have text "RGD" in their name.  The `cut` command selects only the 8th field (separated by tabs) value to show in the output.

```azurecli-interactive
az vm list --out tsv | grep RGD | cut -f8
```

```
KBDemo001VM
KBDemo020
```

## Explore with jpterm

You can also pipe the command output to [JMESPath-terminal](https://github.com/jmespath/jmespath.terminal)
and experiment with your JMESPath query there.

```bash
pip install jmespath-terminal
az vm list | jpterm
```

