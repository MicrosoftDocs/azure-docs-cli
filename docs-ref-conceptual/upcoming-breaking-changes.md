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
- Change the default value of `--enable-msi-auth-for-monitoring` to true and add check for airgap clouds.

## APP Config

### `az appconfig feature`

- Update feature name validation to disallow the colon character.

### `az appconfig kv import`

- Update feature name validation. Invalid feature flags will be skipped during import.

### `az appconfig`

- Update default connection string resolution logic.

## Compute

### `az vm create`

- Make the default value of `--enable-secure-boot` to `True` for Trusted Launch VM. 
  - This will lower the barrier to entry even further and provide customers the full set of Trusted Launch features by default.
- Make the default value of `--public-ip-sku` from `Basic` to `Standard`.

### `az vmss create`

- Make the default value of `--enable-secure-boot` to `True` for Trusted Launch VMSS.
  - This will lower the barrier to entry even further and provide customers the full set of Trusted Launch features by default.

## Cosmos DB

### `az cosmosdb create/update`

- Rename `--enable-public-network true/false` to `--public-network-access ENABLED/DISABLED/SECUREDBYPERIMETER`.

## EventHub

### `az eventhubs namespace network-rule`

- This command group is removed and replaced by `az eventhubs namespace network-rule-set`.

### `az eventhubs namespace network-rule add`

- This command is removed and replaced by `az eventhubs namespace network-rule-set ip-rule/virtual-network-rule add`.

### `az eventhubs namespace network-rule remove`

- This command is removed and replaced by `az eventhubs namespace network-rule-set ip-rule/virtual-network-rule remove`.

### `az eventhubs eventhub create/update`

- Remove `--message-retention` parameter, it is replaced by `--retention-time-in-hours`.
- The parameter `–message-retention` will be deprecated and replaced by `–retention-time-in-hours`.

### `az eventhubs namespace application-group policy remove`

- Rename `--throttling-policy-config` to `--policy` and remove `metric-id` and `rate-limit-threshold` properties in it.

## KeyVault

### `az keyvault create`

- `--retention-days` becomes required for MHSM creation.

### `az keyvault backup start`

- The output will only contain `folderUrl`.

### `az keyvault restore start`

- Nothing will return for successful run. Because according to the CLI command design specification, start commands do not need output.

### `az keyvault role assignment delete`

- Nothing will return for successful run. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az keyvault certificate show/set-attributes/import`

- No longer return `x509CertificateProperties.basicConstraints`, `pending`.

### `az keyvault certificate contact delete`

- Return an empty list instead of the deleted contact for consistency if the operation would remove the last contact.

### `az keyvault certificate issuer create`

- `organizationDetails.zip` is no longer returned by serivce, use 0 as the default.

## NetAppFiles

### `az netappfiles vault list command`

- Remove command `vault list` as this is not longer needed.

### `az netappfiles volume create/update`

- Remove optional parameter `--vault-id` as this is not longer needed. 

## Network

### `az network application-gateway settings update`

- Use `null` instead of `""`  to detach.

### `az network application-gateway url-path-map update`

- Use `null` instead of `""`  to detach.

### `az network nic update`

- Use `null` instead of `""`  to detach.

### `az network nic ip-config update`

- Use `null` instead of `""`  to detach.

### `az network nsg rule update`

- Use `null` instead of `""`  to detach.

### `az network vnet update`

- Use `null` instead of `""`  to detach.

### `az network vnet subnet update`

- Use `null` instead of `""`  to detach.

### `az network cross-region-lb rule`

- Remove parameters `--enable-tcp-reset` and `--idle-timeout`

### `az network application-gateway ssl-profile remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az network application-gateway client-cert remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az network cross-region-lb address-pool address remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az network lb address-pool tunnel-interface remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az network nic ip-config address-pool remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az network nic ip-config inbound-nat-rule remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az network private-endpoint dns-zone-group remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az network private-endpoint ip-config remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

### `az network private-endpoint asg remove`

- Output will be deprecated. Because according to the CLI command design specification, remove/delete commands do not need output.

## RDBMS

### `az mysql flexible-server create`

- The parameter `Enabled` for `--high-availability` will be deprecated, as it's the same as `ZoneRedundant`.

### `az mysql flexible-server update`

- The parameter `Enabled` for `--high-availability` will be deprecated, as it's the same as `ZoneRedundant`.

### `az postgres flexible-server create`

- The parameter `Enabled` for `--high-availability` will be deprecated, as it's the same as `ZoneRedundant`.

### `az postgres flexible-server update`

- The parameter `Enabled` for `--high-availability` will be deprecated, as it's the same as `ZoneRedundant`.

## ServiceBus

### `az servicebus georecovery-alias fail-over`

- Remove `--parameters` argument.

### `az servicebus namespace network-rule`

- This command group is removed and replaced by `az servicebus namespace network-rule-set`.

### `az servicebus namespace network-rule add`

- This command is removed and replaced by `az servicebus namespace network-rule-set ip-rule/virtual-network-rule add`.

### `az servicebus namespace network-rule remove`

- This is removed and replaced by by `az servicebus namespace network-rule-set ip-rule/virtual-network-rule remove`.

### `az servicebus queue update`

- Remove deprecated parameters `--enable-partitioning`, `--enable-session` and `--duplicate-detection`.

## SQL

### `az sql mi link create`

- Remove `--replication-mode` argument.
