---
title: Upcoming Breaking Changes – Azure CLI | Microsoft Docs
description: Learn about breaking changes coming to Azure CLI in the next breaking change release
manager: mkluck
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/22/2022
ms.topic: article
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli updates, azure cli notes, azure cli versions, azure cli breaking changes
---

> [!CHANGES]
> 1. Every breaking change message contains the following:
>    - Timeline
>    - Impact
>    - Concise message
>    - Next steps
>    - Pointer for additional information
> 1. Breaking changes are now grouped by command group, just like release notes
> 1. Links to release notes have been added
> 1. IMPORTANT!  We need to standardize on repeatable phrases like `for remediation...` and `Any script continuing to use this [something] will receive error ...`.

# Upcoming breaking changes in the Azure CLI - POC2

- In POC4 we are trying a table format idea as POC3 ended up with 4 levels of headers.
- The H3 for reference group name has been removed
- The link the release notes, previously at the bottom of each H4, has been removed

## April 30, 2023

|Reference command | Breaking change
|-|-|
|[az logicapp create](/cli/azure/logicapp#az-logicapp-create) | The following two parameters will be removed:  `--consumption-plan-location` and `--os-type`.  Scripts continuing to use these parameters will receive error _Parameter not found.  For a list of available parameters, run az logicapp create -h._  For remediation use `--something-else` instead.

## May 15, 2023

|Reference command | Breaking change
|-|-|
|[az appconfig kv export](/cli/azure/appconfig/kv#az-appconfig-kv-export) | Validations will be added to JSON file exports.  This change will  ensure that only valid JSON objects are exported. Other JSON primitives will result in error message _Improper JSON format_.  To test for proper JSON format, use [JSON Lint](https://jsonlint.com/) or similar tool. 
|[az appconfig kv import](/cli/azure/appconfig/kv#az-appconfig-kv-import) | Validations will be added to JSON file imports.  This change will  ensure that only valid JSON objects are imported. Other JSON primitives will result in error message _Improper JSON format_.  To test for proper JSON format, use [JSON Lint](https://jsonlint.com/) or similar tool. 

## November, 2023 - Ignite

|Reference command | Breaking change
|-|-|
|[az account create](/cli/azure/account#az-account-create) | The parameter `--resolve-error` will be removed.  Any script continuing to use this parameter will receive error message _Parameter not found.  For a list of available parameters, run az account -h_.  For remediation, change you scripts to use parameter `--resolve-azError`.
|acs command group | The `acs` command group, which was deprecated in November 2022, will be permanently removed.  Any script continuing to use this command will receive an _Command not recognized_ error message.  For remediation, migrate to [az aks](https://learn.microsoft.com/en-us/cli/azure/aks).  For more information, see [Azure Container Service Will Retire]](https://azure.microsoft.com/updates/azure-container-service-will-retire-on-january-31-2020/).

## See also
- [Azure CLI Release Notes]()
- [Azure CLI Reference List]()
