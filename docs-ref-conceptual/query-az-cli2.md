---
title: Query command results with Azure CLI 2.0
description: Use --query to perform JMESPath queries on the output of Azure CLI 2.0 commands.
keywords: Azure CLI 2.0, JMESPath, query, Linux, Mac, Windows, OS X
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 5979acc5-21a5-41e2-a4b6-3183bfe6aa22
---

# Using JMESPath queries with Azure CLI 2.0

The Azure CLI 2.0 uses the `--query` parameter to execute a [JMESPath query](http://jmespath.org) on the results of your `az` command.  If you unfamiliar with JMESPath queries you can find a tutorial at [JMESPath.org/tutorial](http:/JMESPath.org/tutorial.html).

Queries can be run for a variety of different purposes.  We have listed several examples below.  

## Get SQL endpoints for each Azure cloud

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

## Get a property of an object

This particular example retrieves the hostname of a specific web app.
This query also [formats the output](format-output-az-cli2.md) as tab-separated values by using the tsv option
which is useful when you want to assign the output to a variable in your script.

```azurecli
az appservice web show \
  -g myRg \
  -n myApp \
  --query hostNames --out tsv
```

## Apply a label to properties

This example retrieves and also adds labels name and managed disk ID, again formatted as tab-separated values.
The query labels the name property "name" and it labels the managed disk id "md_id".

```azurecli
az vm list \
  --query "[].{ name:name, md_id:storageProfile.osDisk.managedDisk.id }" -o tsv
```

## Filter with the contains function

You can use the JMESPath `contains` function to refine your results returned in the query.
In this example the results will limit the VMs returned to those in a specific resource group.

```azurecli
az vm list \
  --query "[?contains(resourceGroup,'myRg')].{ resource: resourceGroup, name: name }"
```

With this example the results will return the VMs that have the vmSize 'Standard_DS1'.

```azurecli
az vm list \
  --query "[?contains(hardwareProfile.vmSize, 'Standard_DS1')]"
```

## Filter with grep

Use the [`--out`](format-output-az-cli2.md) parameter to format the output as tab-separated values
and pipe that through grep.

```azurecli
az vm list \
  --query "[].{ name: name, os: storageProfile.osDisk.osType }" \
  --out tsv  \
| grep Linux
```

## Explore with jpterm

You can also pipe the command output to [JMESPath-terminal](https://github.com/jmespath/jmespath.terminal)
and experiment with your JMESPath query there.

```bash
pip install jmespath-terminal
az vm list | jpterm
```

