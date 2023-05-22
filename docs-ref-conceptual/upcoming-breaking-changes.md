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

# Upcoming breaking changes in Azure CLI

## AKS

### `az aks create`

- Specifying `--pod-cidr` with Azure CNI will return an error instead of logging a warning when not using overlay mode.
  
## KeyVault

### `az keyvault role assignment delete`

- Output will be deprecated.

## Network

### `az network application-gateway settings update`
### `az network application-gateway settings update`
### `az network application-gateway url-path-map update`
### `az network nic update`
### `az network nic ip-config update`
### `az network nsg rule update`
### `az network vnet update`
### `az network vnet subnet update`

- Use `null` instead of `""`  to detach.

### `az network cross-region-lb rule`

- Remove parameters `--enable-tcp-reset` and `--idle-timeout`

### `az network application-gateway ssl-profile remove`
### `az network application-gateway client-cert remove`
### `az network cross-region-lb address-pool address remove`
### `az network lb address-pool tunnel-interface remove`
### `az network nic ip-config address-pool remove`
### `az network nic ip-config inbound-nat-rule remove`
### `az network private-endpoint dns-zone-group remove`
### `az network private-endpoint ip-config remove`
### `az network private-endpoint asg remove`

- Output will be deprecated.

## ServiceBus

### `az servicebus georecovery-alias fail-over`

- Parameters argument will be removed. 

### `az servicebus namespace network-rule`

- Deprecated. Redirect to `az servicebus namespace network-rule-set`

## EventHub

### `az eventhubs namespace application-group policy remove`

- Remove parameters `metric-id` and `rate-limit-threshold` from `--throttling-policy-config` object. Additionally changing `throttling-policy-config` to `policy`.

### `az eventhubs eventhub create`
### `az eventhubs eventhub update`

- The parameter `–message-retention` will be deprecated and replaced by `–retention-time-in-hours`.

## NetAppFiles

### `az netappfiles vault list command`

- Deprecated.

### `az netappfiles volume update`
### `az netappfiles volume create`

- Remove parameter `--vault-id`. 

## RDBMS

### `az mysql flexible-server create`
### `az mysql flexible-server update`
### `az postgres flexible-server create`
### `az postgres flexible-server update`

- The parameter `Enabled` for `--high-availability` will be deprecated, as it's the same as `ZoneRedundant`.