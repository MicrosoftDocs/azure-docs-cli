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

# Upcoming breaking changes in the Azure CLI - POC1

## account

- The parameter `--resolve-error` will be removed from `az account create` in the September 2023 breaking change release.  Any script continuing to use this parameter will receive error message _Parameter not found.  For a list of available parameters, run az account -h_.  For remediation, change you scripts to use parameter `--resolve-azError`.

az account [release notes](https://review.learn.microsoft.com/en-us/cli/azure/release-notes-azure-cli-poc2?branch=pr-en-us-3606#account)
az account create [reference help](https://learn.microsoft.com/en-us/cli/azure/account#az-account-create)

## acs

- The `acs` command group will be removed in the September 2023 breaking change release.  Any script continuing to use this command will receive an _Command not recognized_ error message.  For remediation, migrate to [az aks](https://learn.microsoft.com/en-us/cli/azure/aks).  For more information, see [Azure Container Service Will Retire]](https://azure.microsoft.com/updates/azure-container-service-will-retire-on-january-31-2020/).

az acs [release notes]()
az acs [reference help]()
  
## appconfig

- Validations will be added to JSON file exports for reference command `az appconfig kv export` in the July 2023 release.  This change will  ensure that only valid JSON objects are exported. Other JSON primitives will result in error message _Improper JSON format_.  To test for proper JSON format, use [JSON Lint](https://jsonlint.com/) or similar tool. 

- Validations will be added to JSON file imports for reference command `az appconfig kv import` in the July 2023 release.  This change will  ensure that only valid JSON objects are imported. Other JSON primitives will result in error message _Improper JSON format_.  To test for proper JSON format, use [JSON Lint](https://jsonlint.com/) or similar tool. 

az appconfig [release notes]()
az appconfig kv [reference help]()

## logicapp

- The following two parameters will be removed from `az logicapp create` in the September 2023 breaking change release:  `--consumption-plan-location` and `--os-type`.  Scripts continuing to use these parameters will receive error _Parameter not found.  For a list of available parameters, run az logicapp create -h._  For remediation use `--something-else` instead.

az logicapp [release notes]()
az logicapp create [reference help]()

## See also
- [Azure CLI Release Notes]()
- [Azure CLI Reference List]()
