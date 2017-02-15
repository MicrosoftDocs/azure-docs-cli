---
title: Output formats for Azure CLI 2.0 
description: Use --output to format the output of Azure CLI 2.0 commands to tables, lists or json.
keywords: Azure CLI 2.0, output, format, table, list, json, Linux, Mac, Windows, OS X
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 74bdb727-481d-45f7-a44e-15d18dc55483
---

# Output formats for Azure CLI 2.0 commands

Use the `--output` parameter to format the output of the command into one of these forms.

--output | Description
---------|-------------------------------
`json`   | json string. `json` is the default.
`jsonc`  | colorized json string.
`table`  | table with column headings.
`tsv`    | tab-separated values.

For example, the following displays the list of Azure clouds in the json format.

```azurecli
az cloud list --output json
```

```json
[
  {
    "endpoints": {
      "activeDirectory": "https://login.microsoftonline.com",
      "activeDirectoryGraphResourceId": "https://graph.windows.net/",
      "activeDirectoryResourceId": "https://management.core.windows.net/",
      "gallery": "https://gallery.azure.com/",
      "management": "https://management.core.windows.net/",
      "resourceManager": "https://management.azure.com/",
      "sqlManagement": "https://management.core.windows.net:8443/"
    },
    "name": "AzureCloud",
    "suffixes": {
      "azureDatalakeAnalyticsCatalogAndJobEndpoint": "azuredatalakeanalytics.net",
      "azureDatalakeStoreFileSystemEndpoint": "azuredatalakestore.net",
      "keyvaultDns": ".vault.azure.net",
      "sqlServerHostname": ".database.windows.net",
      "storageEndpoint": "core.windows.net"
    }
  },
  {
    "endpoints": {
      "activeDirectory": "https://login.chinacloudapi.cn",
      "activeDirectoryGraphResourceId": "https://graph.chinacloudapi.cn/",
      "activeDirectoryResourceId": "https://management.core.chinacloudapi.cn/",
      "gallery": "https://gallery.chinacloudapi.cn/",
      "management": "https://management.core.chinacloudapi.cn/",
      "resourceManager": "https://management.chinacloudapi.cn",
      "sqlManagement": "https://management.core.chinacloudapi.cn:8443/"
    },
    "name": "AzureChinaCloud",
    "suffixes": {
      "azureDatalakeAnalyticsCatalogAndJobEndpoint": null,
      "azureDatalakeStoreFileSystemEndpoint": null,
      "keyvaultDns": ".vault.azure.cn",
      "sqlServerHostname": ".database.chinacloudapi.cn",
      "storageEndpoint": "core.chinacloudapi.cn"
    }
  },
  {
    "endpoints": {
      "activeDirectory": "https://login.microsoftonline.com",
      "activeDirectoryGraphResourceId": "https://graph.windows.net/",
      "activeDirectoryResourceId": "https://management.core.usgovcloudapi.net/",
      "gallery": "https://gallery.usgovcloudapi.net/",
      "management": "https://management.core.usgovcloudapi.net/",
      "resourceManager": "https://management.usgovcloudapi.net/",
      "sqlManagement": "https://management.core.usgovcloudapi.net:8443/"
    },
    "name": "AzureUSGovernment",
    "suffixes": {
      "azureDatalakeAnalyticsCatalogAndJobEndpoint": null,
      "azureDatalakeStoreFileSystemEndpoint": null,
      "keyvaultDns": ".vault.usgovcloudapi.net",
      "sqlServerHostname": ".database.usgovcloudapi.net",
      "storageEndpoint": "core.usgovcloudapi.net"
    }
  },
  {
    "endpoints": {
      "activeDirectory": "https://login.microsoftonline.de",
      "activeDirectoryGraphResourceId": "https://graph.cloudapi.de/",
      "activeDirectoryResourceId": "https://management.core.cloudapi.de/",
      "gallery": "https://gallery.cloudapi.de/",
      "management": "https://management.core.cloudapi.de/",
      "resourceManager": "https://management.microsoftazure.de",
      "sqlManagement": "https://management.core.cloudapi.de:8443/"
    },
    "name": "AzureGermanCloud",
    "suffixes": {
      "azureDatalakeAnalyticsCatalogAndJobEndpoint": null,
      "azureDatalakeStoreFileSystemEndpoint": null,
      "keyvaultDns": ".vault.microsoftazure.de",
      "sqlServerHostname": ".database.cloudapi.de",
      "storageEndpoint": "core.cloudapi.de"
    }
  }
]
```

When you use table or tsv, nested objects aren't included in the output.
Since the only name-value pair at the top level of the cloud object is the name,
that's all you get with either `--output table` or `--output tsv`.

```azurecli
az cloud list --output table
```

Just returns the top-level name-value pairs, which are just the names in this case.

```
Name
-----------------
AzureCloud
AzureChinaCloud
AzureUSGovernment
AzureGermanCloud
```

You can use a JMESPath operation to flatten the object.
If we get the name and the sql endpoint, it looks like this query.

```azurecli
az cloud list --query [*].[name,endpoints.sqlManagement] --output table
```

```
Column1            Column2
-----------------  -----------------------------------------------
AzureCloud         https://management.core.windows.net:8443/
AzureChinaCloud    https://management.core.chinacloudapi.cn:8443/
AzureUSGovernment  https://management.core.usgovcloudapi.net:8443/
AzureGermanCloud   https://management.core.cloudapi.de:8443/
```

The column names are lost in this case because they don't exist in our JMESPath query results.
To get meaningful column names when displaying the results of a JMESPatch query in a table,
add them to the JMESPath query.

```azurecli
az cloud list --query [*].{Name:name,SQL:endpoints.sqlManagement} --output table
```

The results have the column headings.

```
Name               SQL
-----------------  -----------------------------------------------
AzureCloud         https://management.core.windows.net:8443/
AzureChinaCloud    https://management.core.chinacloudapi.cn:8443/
AzureUSGovernment  https://management.core.usgovcloudapi.net:8443/
AzureGermanCloud   https://management.core.cloudapi.de:8443/
```