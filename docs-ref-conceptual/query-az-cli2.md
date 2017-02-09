---
title: Query command results for Azure CLI 2.0
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

## Query

Use the `--query` parameter to execute a [JMESPath query](http://jmespath.org) on the results of your `az` command.
For example, the following lists the sql endpoints for each Azure cloud.

```azurecli
az cloud list --query [*].[name,endpoints.sqlManagement]
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

By default, the results are [JSON](http://json.org).
You can [specify a different format](format-output-az-cli2.md).

There is a good tutorial for JMESPath at [JMESPath.org/tutorial](http:/JMESPath.org/tutoriual.html).