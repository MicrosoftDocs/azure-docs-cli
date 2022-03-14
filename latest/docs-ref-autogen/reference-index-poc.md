---
title: Azure CLI reference list | Microsoft Docs
description: Azure CLI reference list
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 10/01/2021
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# az
Reference

## Commands
| Command | Description | Command Type | Extension name | Required minimum CLI version | Status |
|----|-----------------|-------------|---------|---------------|--------|
|az account	    |Manage Azure subscription information.                        |core, extension     |account	         |2.3.1     |GA, experimental
|az acr	        |Manage private registries with Azure Container Registries.    |extension	        |containerRegistries |2.0.67    |preview
|az acs	        |Manage Azure Container Services.                              |extension	        |containerServices	 |2.15.0	|GA
|az ad	        |Manage Azure Active Directory Graph entities needed for RBAC. |core		        |                    |2.19.1	|preview
|az advisor	    |Manage Azure Advisor.                                         |core, extension	    |advisor-ext	     |2.2.0	    |experimental
|az afd	        |Manage Azure Front Door.                                      |core		        |                    |2.15.0	|preview, experimental
|az ai-examples	|Add AI powered examples to help content.                      |extension	        |ai-examples	     |2.0.79	|experimental
|...||||||

## az configure

Manage Azure CLI configuration. This command is interactive.

For automation scenarios or to set all available options, use the new `az config`.

```azurecli
az configure [--defaults]
             [--list-defaults {false, true}]
             [--scope {global, local}]
```
### Examples

Set default resource group, webapp and VM names.

```azurecli-interactive
az configure --defaults group=myRG web=myweb vm=myvm
```

Clear default webapp and VM names.
```azurecli-interactive
az configure --defaults vm='' web=''
```

## az feedback

## az find

## az init

## az interactive

## az login

## az logout

## az next

## az rest

## az self-test

## az upgrade

## az version