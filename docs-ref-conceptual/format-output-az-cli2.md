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

Azure CLI 2.0 uses .json as its default output option, but offers a variety of ways for you to format the output of any command.  Use the `--output` (or `--out` or `-o`) parameter to format the output of the command into one of the output types noted in the below table. 

--output | Description
---------|-------------------------------
`json`   | json string. `json` is the default.
`jsonc`  | colorized json string.
`table`  | table with column headings.
`tsv`    | tab-separated values.
`list`   | an easy to read list.

## Using the .json option

The following example displays the list of Azure clouds in the default. json format.

```azurecli
az cloud list --output json
```

The results are in this form.

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
  }
]
```
## Using the table or tsv option

The table or tsv option provides an easy to ready set of output, but note that nested objects are not included in the output with the simple `--output table` or `--output tsv` option, unlike the .json example above.  Using the same example as above the example will provide only the name-value pair at the top level, which is the Azure cloud name.

```azurecli
az cloud list --out table
```

```
Name
-----------------
AzureCloud
AzureChinaCloud
AzureUSGovernment
AzureGermanCloud
```

To get the details retrieved using the `--output json` option but provide a more readable set of output you can use a JMESPath operation to flatten the object.  

Leveraging the above example, if we want the cloud name and the sql endpoint in our ouput we would add the `--query` parameter to the command.

```azurecli
az cloud list --query [*].[name,endpoints.sqlManagement] -o table
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
az cloud list --query "[*].{Name:name,SQL:endpoints.sqlManagement}" --output table
```

The results now have the column headings.

```
Name               SQL
-----------------  -----------------------------------------------
AzureCloud         https://management.core.windows.net:8443/
AzureChinaCloud    https://management.core.chinacloudapi.cn:8443/
AzureUSGovernment  https://management.core.usgovcloudapi.net:8443/
AzureGermanCloud   https://management.core.cloudapi.de:8443/
```
