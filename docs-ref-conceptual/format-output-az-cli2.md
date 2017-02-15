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
`list`   | an easily read list.
`table`  | table with column headings.
`tsv`    | tab-separated values.

For example, the following displays the list of Azure clouds in an easy to read list format.

```azurecli
az cloud list --output list
```

The results are in this form.

```
Name      : AzureCloud
Endpoints :
    Active Directory                   : https://login.microsoftonline.com
    Active Directory Graph Resource Id : https://graph.windows.net/
    Active Directory Resource Id       : https://management.core.windows.net/
    Gallery                            : https://gallery.azure.com/
    Management                         : https://management.core.windows.net/
    Resource Manager                   : https://management.azure.com/
    Sql Management                     : https://management.core.windows.net:8443/
Suffixes  :
    Azure Datalake Analytics Catalog And Job Endpoint : azuredatalakeanalytics.net
    Azure Datalake Store File System Endpoint         : azuredatalakestore.net
    Keyvault Dns                                      : .vault.azure.net
    Sql Server Hostname                               : .database.windows.net
    Storage Endpoint                                  : core.windows.net
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
az cloud list --query "[*].{Name:name,SQL:endpoints.sqlManagement}" --output table
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