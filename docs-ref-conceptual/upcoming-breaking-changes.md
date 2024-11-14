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

## acr helm

* In November 2020, Helm 2 reached end of life. Starting on March 30th, 2025 Azure Container Registry will no longer support Helm 2. Therefore, the legacy "Helm repositories" functionality will also be retired. **We recommend that you transition to Helm 3 immediately.**
* Starting January 21st, 2025 the CLI command [az acr helm push](/cli/azure/acr/helm/#az_acr_helm_push) will be retired to prevent pushing new Helm charts to legacy Helm repositories.
* Starting March 30th, 2025 the CLI command group [az acr helm](/cli/azure/acr/helm) will be retired, ending all legacy Helm repository capabilities in Azure Container Registry.
* All Helm charts not stored as an OCI artifact will be deleted from Azure Container Registry on March 30th, 2025.
* Learn how to find all Helm charts stored in a Helm repository here: [az acr helm list](/cli/azure/acr/helm/#az_acr_helm_list). If the Helm chart you are using is listed then it is stored in a legacy Helm repository and is at risk of deletion.

For more information on managing and deploying applications for Kubernetes, see [Push and pull Helm charts to an Azure container registry](/azure/container-registry/container-registry-helm-repos).

## aks

[Link to aks reference group](/cli/azure/aks)

### `aks create`

- Argument '--no-uptime-sla' has been deprecated and will be removed in version '2.67.0'. Use '--tier free' instead.
- Argument '--uptime-sla' has been deprecated and will be removed in version '2.67.0'. Use '--tier standard' instead.

## db-up

The [db-up](https://github.com/Azure/azure-cli-extensions/tree/main/src/db-up) extension will be retired on November 20, 2024. Use the `create` command associated with the respective database instead. This retirement affects the following reference commands:

* [az mysql up](/cli/azure/mysql#az-mysql-up)
* [az mysql down](/cli/azure/mysql#az-mysql-down)
* [az my sql show-connection-string](/cli/azure/mysql#az-mysql-show-connection-string)
* [az postgres up](/cli/azure/postgres#az-postgres-up)
* [az postgres down](/cli/azure/postgres#az-postgres-down)
* [az postgres show-connection-string](/cli/azure/postgres#az-postgres-show-connection-string)
* [az sql up](/cli/azure/sql#az-sql-up)
* [az sql down](/cli/azure/sql#az-sql-down)
* [az sql show-connection-string](/cli/azure/sql#az-sql-show-connection-string)

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

## profile

### `az login`

- The `--password` parameter will not accept service principal certificate. Use the `--certificate` parameter instead.

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
