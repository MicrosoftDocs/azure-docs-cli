---
title: Upcoming Breaking Changes – Azure CLI | Microsoft Docs
description: Learn about breaking changes coming to Azure CLI in the next breaking change release
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 08/22/2022
ms.topic: article
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli updates, azure cli notes, azure cli versions, azure cli breaking changes
---

# Upcoming breaking changes in Azure PowerShell

## Az.AKS

### `az acs`

- This deprecated command group will be removed. For the recommended action, please refer to this doc [azure-container-service-will-retire](https://azure.microsoft.com/en-us/updates/azure-container-service-will-retire-on-january-31-2020/)
  
  
## Az.AppConfiguration

### `az appconfig kv import`

- Add validations to JSON file imports to ensure that only valid JSON objects are imports. Other JSON primitives will now be rejected. 

### `az appconfig kv export`

- Add validations to JSON file imports to ensure that only valid JSON objects are imports. Other JSON primitives will now be rejected. 


## Az.AppService

### `az logicapp create`

- Parameter breaking-change will happen to the parameter sets
  - `--consumption-plan-location`
  - `--os-type`
    They will be deprecated (waiting for the server team to provide more information) 
    Removing `--os-type` and `--consumption-plan-location` parameters that are unsupported on Logic Apps Standard


## Az.KeyVault

### `az keyvault create`

- Parameter breaking-change will happen to the parameter sets
  - `--enable-soft-delete` will be deprecated, all keyvault will be created with soft delete enabled


## Az.Network

### `az network vnet create`
### `az network vnet update`
### `az network vnet subnet create`

- Parameter breaking-change will happen to the parameter sets
  - `--defer` will be deprecated, please use short hand syntax instead

### `az network watcher connection-monitor create`

- Deprecate classic connection monitor creation, please use the new connection monitor


## Az.Monitor

### `az monitor diagnostic-settings list`

- Drop value property in output, return a list instead of a dict


## Az.ServiceBus

### `az servicebus namespace create`
### `az servicebus namespace update`

- Parameter breaking-change will happen to the parameter sets
  - `--default-action` will be deprecated, please use `az servicebus namespace network-rule update`

### `az servicebus migration`

- Parameter breaking-change will happen to all parameter sets
  - `--config-name` will be deprecated, no replacement any more


## Az.EventHub

### `az eventhubs namespace update`

- Parameter breaking-change will happen to all parameter sets
  -  `--key-source`
  -  `--key-name`
  -  `--key-vault-uri`
  -  `--key-version`
  They will be deprecated, please use `az eventhubs namespace encryption` to manage keys

### `az eventhubs namespace create`
### `az eventhubs namespace update`

- Parameter breaking-change will happen to all parameter sets
  - `--identity` will be deprecated, please use `--mi-user-identity` and `--mi-system-assigned` together with `az eventhubs namespace identity` command group instead
  - `-default-action` and `--enable-trusted-service-access` will be deprecated, please use `az eventhubs namespace network-rule update` instead











[comment]: # (As of right now, we should follow PowerShell's example and list the breaking changes by Service alphabetically and list each afected command. Delete this comment after reading.)