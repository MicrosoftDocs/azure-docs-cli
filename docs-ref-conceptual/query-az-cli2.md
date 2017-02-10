---
title: Query command results with Azure CLI 2.0 (Preview)
description: Use --query to perform JMESPath queries on the output of Azure CLI 2.0 (Preview) commands.
keywords: Azure CLI 2.0, JMESPath, query, Linux, Mac, Windows, OS X
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 5979acc5-21a5-41e2-a4b6-3183bfe6aa22
---

# Query with Azure CLI 2.0 (Preview)

Use the `--query` parameter to execute a [JMESPath query](http://jmespath.org) on the results of your `az` command.
For example, the following lists the sql endpoints for each Azure cloud.

## Get the Azure clouds

```azurecli
az cloud list \
  --query [*].[name,endpoints.sqlManagement]
```

```json
[
  [
    "AzureCloud",
    "https://management.core.windows.net:8443/"
  ],
  [
    "AzureChinaCloud",
    "https://management.core.chinacloudapi.cn:8443/"
  ],
  [
    "AzureUSGovernment",
    "https://management.core.usgovcloudapi.net:8443/"
  ],
  [
    "AzureGermanCloud",
    "https://management.core.cloudapi.de:8443/"
  ]
]
```

## Get a web app's host name

```azurecli
az appservice web show \
  -g myRg \
  -n myApp \
  --query hostNames --out tsv
```

## Get the managed disk id for all VMs

```azurecli
az vm list \
  --query "[].{ name:name, os:storageProfile.osDisk.managedDisk.id }" -o tsv
```

## Filter with contains

Use the JMESPath `contains` function to select objects.
In this case, select the VMs in a specific resource group.

```azurecli
az vm list \
  --query "[?contains(resourceGroup,'myRg')].{ resource: resourceGroup, name: name }"
```

In this case, select the VMs that have the vmSize 'Standard_DS1'.

```azurecli
az vm list \
  --query "[?contains(hardwareProfile.vmSize, 'Standard_DS1')]"
```

## Filter with grep

Use the [`--out`](format-output-az-cli2.md) parameter to format the output as tsv format
and pipe that through grep.

```azurecli
az vm list \
  --query "[].{ name: name, os: storageProfile.osDisk.osType }" \
  --out tsv  \
| grep Linux
```

## Explore with jpterm

You can pipe the command output to [JMESPath-terminal](https://github.com/jmespath/jmespath.terminal)
and experiment with your JMESPath query there.

```bash
pip install jmespath-terminal
az vm list | jpterm
```

There is a good tutorial for JMESPath at [JMESPath.org/tutorial](http:/JMESPath.org/tutoriual.html).