---
title: Azure CLI upcoming breaking changes | Microsoft Docs
description: Learn about upcoming breaking changes to Azure CLI command groups, references, and parameters.
ms.date: 09/17/2025
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
# customer intent: As an Azure CLI developer, I need to be aware of upcoming breaking changes so I can plan for migration to new reference commands.
---

# Upcoming breaking changes in Azure CLI

The breaking changes listed in this section are planned for the next major release of the Azure CLI unless otherwise noted. Per our [Support lifecycle](./azure-cli-support-lifecycle.md), breaking changes in Azure Core CLI reference groups occur twice a year.

## acr

### `acr helm`

[Link to acr helm reference group](/cli/azure/acr/helm)

- In November 2020, Helm 2 reached end of life. Starting on March 30th, 2025 Azure Container Registry will no longer support Helm 2. Therefore, the legacy "Helm repositories" functionality will also be retired. We recommend that you transition to Helm 3 immediately.
- Starting January 21st, 2025 the CLI command `az acr helm push` was retired to prevent pushing new Helm charts to legacy Helm repositories.
- Starting March 30th, 2025 the CLI command group `az acr helm` was retired, ending all legacy Helm repository capabilities in Azure Container Registry.
- All Helm charts not stored as an OCI artifact was deleted from Azure Container Registry on March 30th, 2025.
- Learn how to find all Helm charts stored in a Helm repository here: `az acr helm list`. If the Helm chart you are using is listed then it is stored in a legacy Helm repository and is at risk of deletion.
- For more information on managing and deploying applications for Kubernetes, see https://aka.ms/acr/helm.

## batch

### `batch pool create`

[Link to batch pool reference group](/cli/azure/batch/pool)

- '--target-communication' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--resource-tags' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.

### `batch pool list`

[Link to batch pool reference group](/cli/azure/batch/pool)

- The output will be changed in next breaking change release(2.79.0) scheduled for Nov 2025. Remove output fields `targetNodeCommunicationMode`, `currentNodeCommunicationMode`, and `resourceTags`.

### `batch pool show`

[Link to batch pool reference group](/cli/azure/batch/pool)

- The output will be changed in next breaking change release(2.79.0) scheduled for Nov 2025. Remove output fields `targetNodeCommunicationMode`, `currentNodeCommunicationMode`, and `resourceTags`.

### `batch pool set`

[Link to batch pool reference group](/cli/azure/batch/pool)

- '--target-communication' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.

### `batch pool reset`

[Link to batch pool reference group](/cli/azure/batch/pool)

- '--target-communication' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.

## compute_recommender

### `compute-recommender spot-placement-recommender`

[Link to compute-recommender reference group](/cli/azure/compute-recommender)

- 'compute-recommender spot-placement-recommender' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025. Use 'az compute-recommender spot-placement-score' instead.

## dms

### `dms project create`

[Link to dms project reference group](/cli/azure/dms/project)

- 'location' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.

## netappfiles

### `netappfiles volume create`

[Link to netappfiles volume reference group](/cli/azure/netappfiles/volume)

- '--endpoint-type' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.

### `netappfiles volume update`

[Link to netappfiles volume reference group](/cli/azure/netappfiles/volume)

- '--endpoint-type' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.

## resource

### `policy set-definition delete`

[Link to policy set-definition reference group](/cli/azure/policy/set-definition)

- Behavior will change in a future release of the resource commands. Bypassing the confirmation prompt will require providing the -y switch.

### `policy exemption create`

[Link to policy exemption reference group](/cli/azure/policy/exemption)

- Date format will change slightly in a future release of the resource commands. New format is ISO-8601, e.g. 2025-08-05T00:45:13Z instead of 2025-08-05T00:45:13+00:00.

### `policy exemption update`

[Link to policy exemption reference group](/cli/azure/policy/exemption)

- Date format will change slightly in a future release of the resource commands. New format is ISO-8601, e.g. 2025-08-05T00:45:13Z instead of 2025-08-05T00:45:13+00:00.

### `policy assignment identity assign`

[Link to policy assignment identity reference group](/cli/azure/policy/assignment/identity)

- Replacing an existing identity will change in a future release of the resource commands. It will require first removing the existing identity.

### `policy assignment identity remove`

[Link to policy assignment identity reference group](/cli/azure/policy/assignment/identity)

- Removing a user assigned identity will change in a future release of the resource commands. It will require providing the --mi-user-assigned switch.

### `policy assignment non-compliance-message create`

[Link to policy assignment non-compliance-message reference group](/cli/azure/policy/assignment/non-compliance-message)

- The return value will change in a future release of the resource commands. It will be the single created message object rather than the full array of message objects.
- The return value will change in a future release of the resource commands. It will be the single created message object rather than the full array of message objects.

### `policy assignment non-compliance-message delete`

[Link to policy assignment non-compliance-message reference group](/cli/azure/policy/assignment/non-compliance-message)

- The return value will change in a future release of the resource commands. It will be empty rather than the full array of remaining message objects.

### `policy definition delete`

[Link to policy definition reference group](/cli/azure/policy/definition)

- Behavior will change in a future release of the resource commands. Bypassing the confirmation prompt will require providing the -y switch.

## servicefabric

### `sf application update`

[Link to sf application reference group](/cli/azure/sf/application)

- '--service-type-policy' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--upgrade-replica-set-check-timeout' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--max-porcent-unhealthy-partitions' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--max-porcent-unhealthy-replicas' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--max-porcent-unhealthy-services' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--max-porcent-unhealthy-apps' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.

### `sf managed-application-type version update`

[Link to sf managed-application-type version reference group](/cli/azure/sf/managed-application-type/version)

- The argument '--package-url' will become required in next breaking change release(2.79.0) scheduled for Nov 2025.

### `sf managed-application update`

[Link to sf managed-application reference group](/cli/azure/sf/managed-application)

- '--service-type-policy' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--upgrade-replica-set-check-timeout' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--instance-close-duration' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--consider-warning-as-error' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--max-percent-unhealthy-partitions' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--max-percent-unhealthy-replicas' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--max-percent-unhealthy-services' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.
- '--max-percent-unhealthy-deployed-applications' has been deprecated and will be removed in next breaking change release(2.79.0) scheduled for Nov 2025.

## vm

### `vm create`

[Link to vm reference group](/cli/azure/vm)

- The default value of '--size' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.

### `vmss create`

[Link to vmss reference group](/cli/azure/vmss)

- The default value of '--vm-sku' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.

> [!NOTE]
> This article provides information on upcoming breaking changes. For previously published breaking changes, see [Azure CLI release notes](./release-notes-azure-cli.md).
