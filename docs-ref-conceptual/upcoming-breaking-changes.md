---
title: Azure CLI upcoming breaking changes | Microsoft Docs
description: Learn about upcoming breaking changes to Azure CLI command groups, references, and parameters.
ms.date: 10/30/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As an Azure CLI developer, I need to be aware of upcoming breaking changes so I can plan for migration to new reference commands.
---

# Upcoming breaking changes in Azure CLI

The breaking changes listed in this article are planned for the next major release of the Azure CLI unless otherwise noted. Per our [Support lifecycle](./azure-cli-support-lifecycle.md), breaking changes in Azure CLI Core reference groups occur twice a year.

## aks

[Link to aks reference group](/cli/azure/aks)

### `az aks create`

- Argument '--no-uptime-sla' has been deprecated and will be removed in version '2.67.0'. Use '--tier free' instead.
- Argument '--uptime-sla' has been deprecated and will be removed in version '2.67.0'. Use '--tier standard' instead.

## dla

[Link to dla reference group](/cli/azure/dla)

### `dla`

- This command group has been deprecated and will be removed in version '2.67.0'.

## extension

[Link to extension reference group](/cli/azure/extension)

### `extension add`

- The default value of '--allow-preview' will be changed to 'false' from 'true' in next breaking change release(2.67.0).

### `extension update`

- The default value of '--allow-preview' will be changed to 'false' from 'true' in next breaking change release(2.67.0).

## network

### `network public-ip ddos-protection-statu`

[Link to network public-ip subgroup](/cli/azure/network/public-ip)

- This command group has been deprecated and will be removed in next breaking change release(2.67.0). Use 'az network public-ip ddos-protection' instead.

## sql

[Link to sql mi link subgroup](/cli/azure/sql/mi/link)

### `sql mi link create`

- The output will be changed in next breaking change release(2.67.0). Deprecated output properties: targetDatabase, primaryAvailabilityGroupName, secondaryAvailabilityGroupNamesourceEndpoint, sourceReplicaId, targetReplicaId, linkState, lastHardenedLsn.
New output properties: databases, partnerAvailabilityGroupName, instanceAvailabilityGroupName, partnerEndpoint, distributedAvailabilityGroupName, instanceLinkRole, partnerLinkRole, failoverMode, seedingMode. To know more about the Breaking Change, please visit aka.ms/mi-link-rest-api-create-or-update.
- Option '--primary-availability-group-name' has been deprecated and will be removed in next breaking change release(2.67.0). Use '--partner-availability-group-name' instead.
- Option '--secondary-availability-group-name' has been deprecated and will be removed in next breaking change release(2.67.0). Use '--instance-availability-group-name' instead.
- Argument '--source-endpoint' has been deprecated and will be removed in next breaking change release(2.67.0). Use '--partner-endpoint' instead.
- Option '--target-database' has been deprecated and will be removed in next breaking change release(2.67.0). Use '--databases' instead.

### `sql mi link list`

- The output will be changed in next breaking change release(2.67.0). Deprecated output properties: targetDatabase, primaryAvailabilityGroupName, secondaryAvailabilityGroupNamesourceEndpoint, sourceReplicaId, targetReplicaId, linkState, lastHardenedLsn.
New output properties: databases, partnerAvailabilityGroupName, instanceAvailabilityGroupName, partnerEndpoint, distributedAvailabilityGroupName, instanceLinkRole, partnerLinkRole, failoverMode, seedingMode. To know more about the Breaking Change, please visit aka.ms/mi-link-rest-api-list-by-instance.

### `sql mi link show`

- The output will be changed in next breaking change release(2.67.0). Deprecated output properties: targetDatabase, primaryAvailabilityGroupName, secondaryAvailabilityGroupNamesourceEndpoint, sourceReplicaId, targetReplicaId, linkState, lastHardenedLsn.
New output properties: databases, partnerAvailabilityGroupName, instanceAvailabilityGroupName, partnerEndpoint, distributedAvailabilityGroupName, instanceLinkRole, partnerLinkRole, failoverMode, seedingMode. To know more about the Breaking Change, please visit aka.ms/mi-link-rest-api-get.

### `sql mi link update`

- The output will be changed in next breaking change release(2.67.0). Deprecated output properties: targetDatabase, primaryAvailabilityGroupName, secondaryAvailabilityGroupNamesourceEndpoint, sourceReplicaId, targetReplicaId, linkState, lastHardenedLsn.
New output properties: databases, partnerAvailabilityGroupName, instanceAvailabilityGroupName, partnerEndpoint, distributedAvailabilityGroupName, instanceLinkRole, partnerLinkRole, failoverMode, seedingMode. To know more about the Breaking Change, please visit aka.ms/mi-link-rest-api-create-or-update.

## util

### `upgrade`

[Link to `az upgrade` reference command](/cli/azure/reference-index#az-upgrade)

- The default value of '--allow-preview' will be changed to 'false' from 'true' in next breaking change release(2.67.0).
