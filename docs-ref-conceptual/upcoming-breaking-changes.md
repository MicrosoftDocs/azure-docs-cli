---
title: Upcoming Breaking Changes - Azure CLI | Microsoft Docs
description: Learn about breaking changes coming to Azure CLI in the next breaking change release
ms.date: 09/27/2024
ms.topic: article
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
---

# Upcoming breaking changes in Azure CLI

## dla

### `dla`

- This command group has been deprecated and will be removed in version '2.67.0'.

## extension

### `extension add`

- The default value of '--allow-preview' will be changed to 'false' from 'true' in next breaking change release(2.67.0).

### `extension update`

- The default value of '--allow-preview' will be changed to 'false' from 'true' in next breaking change release(2.67.0).

## network

### `network public-ip ddos-protection-statu`

- This command group has been deprecated and will be removed in next breaking change release(2.67.0). Use 'az network public-ip ddos-protection' instead.

## sql

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

- The default value of '--allow-preview' will be changed to 'false' from 'true' in next breaking change release(2.67.0).


