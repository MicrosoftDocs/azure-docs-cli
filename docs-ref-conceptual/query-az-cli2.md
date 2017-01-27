---
title: Query command results for Azure CLI 2.0
description: Use --query to perform JMESPath queries on the output of Azure CLI 2.0 commands.
keywords: Azure CLI 2.0, JMESPath, query, Linux, Mac, Windows, OS X
author: allclark
manager: douge
ms.date: 02/15/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 5979acc5-21a5-41e2-a4b6-3183bfe6aa22
---

## Query

Use the `--query` parameter to execute a [JMESPath query](http://jmespath.org) on the results of your `az` command.
For example, the following lists the sql endpoints for each Azure cloud.

```azurecli
az cloud list --query [*].[name,endpoints.sqlManagement]
```