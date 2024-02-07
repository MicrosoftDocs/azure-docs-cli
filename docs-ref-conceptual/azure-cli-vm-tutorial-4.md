---
title: Get virtual machines information with queries (VM) – Azure CLI | Microsoft Docs
description: Learn how to get virtual machines (VM) information with Azure CLI queries.
ms.date: 01/08/2024
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: tutorial
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli show vm information, queries in azure cli
---

# Get VM information with queries

Now that a VM has been created, detailed information about it can be retrieved. The common command for getting information from a resource is
`show`.

```azurecli-interactive
az vm show --name $vmName --resource-group $resourceGroup
```

A Virtual Machine has many properties that can be difficult to parse visually. The returned JSON contains information on authentication, network interface storage,
and more. Most importantly, it contains the Azure object IDs for resources that the VM is connected to. Object IDs allow accessing these resources directly
to get more information about the VM's configuration and capabilities.

In order to extract the object ID, the `--query` argument is used. Queries are written in the [JMESPath query language](http://jmespath.org)Start
with getting the network interface controller (NIC) object ID.

# [Bash](#tab/bash)

```azurecli-interactive
az vm show --name $vmName \
  --resource-group $resourceGroup \
  --query 'networkProfile.networkInterfaces[].id' \
  --output tsv
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
az vm show --name $vmName `
    --resource-group $resourceGroup `
    --query 'networkProfile.networkInterfaces[].id' `
    --output tsv
```

---

There's a lot going on here, just by adding the query. Each part of it references a key in the output JSON, or is a JMESPath operator.

* `networkProfile` is a key of the top-level JSON, which has `networkInterfaces` as a subkey. If a JSON value is a dictionary,
  its keys are referenced from the parent key with the `.` operator.
* The `networkInterfaces` value is an array, so it's flattened with the `[]` operator. This operator runs the remainder
  of the query on each array element. In this case, it gets the `id` value of every array element.

The output format `tsv` (tab-separated values) is guaranteed to only include the result data and whitespace consisting of tabs and newlines.
Since the returned value is a single bare string, it's safe to assign directly to a shell variable.

For more information about querying Azure CLI output, see [How to query Azure CLI command output using a JMESPath query](query-azure-cli.md)

Go ahead and assign the NIC object ID to a shell variable now.

# [Bash](#tab/bash)

```azurecli-interactive
nicId=$(az vm show \
  -n $vmName \
  -g $resourceGroup \
  --query 'networkProfile.networkInterfaces[].id' \
  -o tsv)
```

# [PowerShell](#tab/powershell)

```azurecli-interactive
$nicId = $(az vm show `
   -n $vmName `
   -g $resourceGroup `
   --query 'networkProfile.networkInterfaces[].id' `
   -o tsv)
```

---

This example also demonstrates the use of short arguments. You may use `-g` instead of `--resource-group`, `-n` instead of `--name`, and `-o` instead of `--output`.
