---
title: Upcoming Breaking Changes – Azure CLI | Microsoft Docs
description: Learn about breaking changes coming to Azure CLI in the next breaking change release
author: dbradish-microsoft
ms.author: dbradish
manager: mkluck
ms.date: 08/22/2022
ms.topic: article
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli updates, azure cli notes, azure cli versions, azure cli breaking changes
---

# Upcoming breaking changes in Azure CLI

## Az.AKS

### `az acs`

- The `acs` command group has been deprecated and as of 2.41.0, `acs` will be removed. For more information, please refer to [this doc](https://azure.microsoft.com/updates/azure-container-service-will-retire-on-january-31-2020/)
  
## Az.AppConfiguration

### `az appconfig kv import`

- Validations will be added to JSON file imports to ensure that only valid JSON objects are imported. Other JSON primitives will be rejected. 

### `az appconfig kv export`

- Validations will be added to JSON file imports to ensure that only valid JSON objects are imported. Other JSON primitives will be rejected. 

## Az.AppService

### `az logicapp create`

- Parameter breaking-change will happen to the parameter sets
  - `--consumption-plan-location` and `--os-type` parameter will be deprecated. 

#TODO: Need to make sure this is all the information about this? Are the suggested replacements? Will these be completely removed? 

## Az.KeyVault

### `az keyvault create`

- Parameter breaking-change will happen to the parameter sets
  - `--enable-soft-delete` will be deprecated and all keyvault will be created with soft delete enabled.

## Az.Network

### `az network vnet create`

- Parameter breaking-change will apply to all parameter sets
  - `--defer` will be deprecated, please use short hand syntax instead

### `az network vnet update`

- Parameter breaking-change will apply to all parameter sets
  - `--defer` will be deprecated, please use short hand syntax instead

### `az network vnet subnet create`

- Parameter breaking-change will apply to all parameter sets
  - `--defer` will be deprecated, please use short hand syntax instead

### `az network watcher connection-monitor create`

- Parameter breaking-change will apply to all parameter sets
   - Deprecate classic connection monitor creation, please use the new connection monitor

## Az.Monitor

### `az monitor diagnostic-settings list`

- `value` property will be dropped from output.
-  New output will return a list instead of a dict

## Az.ServiceBus

### `az servicebus namespace create`

- Parameter breaking-change will apply to all parameter sets
  - `--default-action` will be deprecated. Please use `az servicebus namespace network-rule update`

### `az servicebus namespace update`

- Parameter breaking-change will apply to all parameter sets
  - `--default-action` will be deprecated. Please use `az servicebus namespace network-rule update`

### `az servicebus migration`

- Parameter breaking-change will apply to all parameter sets
  - `--config-name` will be deprecated. There is no replacement for this parameter.

## Az.EventHub

### `az eventhubs namespace update`

The following parameters will be deprecated in 2.41.0. Please use `az eventhubs namespace encryption` to manage keys.

-  `--key-source`
-  `--key-name`
-  `--key-vault-uri`
-  `--key-version`

### `az eventhubs namespace create`

- Parameter breaking-change will apply to all parameter sets
  - `--identity` will be deprecated, please use `--mi-user-identity` and `--mi-system-assigned` together with `az eventhubs namespace identity` command group instead
  - `-default-action` and `--enable-trusted-service-access` will be deprecated, please use `az eventhubs namespace network-rule update` instead

### `az eventhubs namespace update`

- Parameter breaking-change will apply to all parameter sets
  - `--identity` will be deprecated. Please use `--mi-user-identity` and `--mi-system-assigned` together with `az eventhubs namespace identity` command group instead.
  - `-default-action` and `--enable-trusted-service-access` will be deprecated. Please use `az eventhubs namespace network-rule update` instead

## Az.Compute

### `az vm create`

- Parameter breaking-change will apply to all parameter sets
  - Make the default value of  `--enable-secure-boot` to `True` for Trusted Launch VM. 
    - This will lower the barrier to entry even further and provide customers the full set of Trusted Launch features by default.

### `az vmss create`

- Parameter breaking-change will apply to all parameter sets
  - Make the default value of  `--enable-secure-boot` to `True` for Trusted Launch VMSS.
    - This will lower the barrier to entry even further and provide customers the full set of Trusted Launch features by default.
