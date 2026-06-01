---
title: Azure CLI upcoming breaking changes | Microsoft Docs
description: Learn about upcoming breaking changes to Azure CLI command groups, references, and parameters.
ms.date: 06/01/2026
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
# customer intent: As an Azure CLI developer, I need to be aware of upcoming breaking changes so I can plan for migration to new reference commands.
---

# Upcoming breaking changes in Azure CLI

The breaking changes listed in this section are planned for the next major release of the Azure CLI unless otherwise noted. Per our [Support lifecycle](./azure-cli-support-lifecycle.md), breaking changes in Azure Core CLI reference groups occur twice a year.

## acr

### `acr config content-trust`

[Link to acr config content-trust reference group](/cli/azure/acr/config/content-trust)

- Content Trust is being deprecated and will be completely removed on March 31, 2028. Refer to https://aka.ms/acr/dctdeprecation for details and transition guidance

### `acr helm`

[Link to acr helm reference group](/cli/azure/acr/helm)

- In November 2020, Helm 2 reached end of life. Starting on March 30th, 2025 Azure Container Registry will no longer support Helm 2. Therefore, the legacy "Helm repositories" functionality will also be retired. We recommend that you transition to Helm 3 immediately.
- Starting January 21st, 2025 the CLI command `az acr helm push` was retired to prevent pushing new Helm charts to legacy Helm repositories.
- Starting March 30th, 2025 the CLI command group `az acr helm` was retired, ending all legacy Helm repository capabilities in Azure Container Registry.
- All Helm charts not stored as an OCI artifact was deleted from Azure Container Registry on March 30th, 2025.
- Learn how to find all Helm charts stored in a Helm repository here: `az acr helm list`. If the Helm chart you are using is listed then it is stored in a legacy Helm repository and is at risk of deletion.
- For more information on managing and deploying applications for Kubernetes, see https://aka.ms/acr/helm.

## compute_recommender

### `compute-recommender spot-placement-recommender`

[Link to compute-recommender reference group](/cli/azure/compute-recommender)

- 'compute-recommender spot-placement-recommender' has been deprecated and will be removed in next breaking change release(2.92.0) scheduled for Nov 2026. Use 'az compute-recommender spot-placement-score' instead.

## netappfiles

### `netappfiles subvolume`

[Link to netappfiles subvolume reference group](/cli/azure/netappfiles/subvolume)

- netappfiles subvolume command group is being deprecated and will be removed in a future release.

## servicefabric

### `sf managed-application update`

[Link to sf managed-application reference group](/cli/azure/sf/managed-application)

- Options list has changed, run help command to see allowed options

## vm

### `sig image-version create`

[Link to sig image-version reference group](/cli/azure/sig/image-version)

- The default value of '--end-of-life-date' will be changed to '6 months from publish date' from 'None' in a future release.
- The default value of '--block-deletion-before-end-of-life' will be changed to 'True' from 'None' in a future release.

### `sig image-version update`

[Link to sig image-version reference group](/cli/azure/sig/image-version)

- The default value of '--end-of-life-date' will be changed to '6 months from publish date' from 'None' in a future release.
- The default value of '--block-deletion-before-end-of-life' will be changed to 'True' from 'None' in a future release.

## azext_blueprint

### `blueprint`

[Link to blueprint reference group](/cli/azure/blueprint)

- 'az blueprint' has been deprecated and will be removed in next breaking change release(2.92.0) scheduled for Nov 2026.
- Blueprints and associated commands will be deprecated
- as early as July 2026. Customers are encouraged to transition to
- Template Specs and Deployments Stacks to support their scenarios beyond that date.
- Migration documentation is available at
- https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/migrate-blueprint.

## azext_redisenterprise

### `redisenterprise create`

[Link to redisenterprise reference group](/cli/azure/redisenterprise)

- The argument '--public-network-access' will become required in next breaking change release(2.92.0) scheduled for Nov 2026.
- The default value of '--access-keys-auth' will be changed to 'Disabled' from 'Enabled' in next breaking change release(2.92.0) scheduled for Nov 2026.

## azext_spring

### `spring`

[Link to spring reference group](/cli/azure/spring)

- 'spring' has been deprecated and will be removed in Mar 2028.

## azext_ssh

### `ssh vm`

[Link to ssh reference group](/cli/azure/ssh)

- On May 21st 2025, any ssh commands connecting to ARC machines on versions <2.0.4 will no longer work. Please upgrade to az ssh version >=2.0.4

### `ssh config`

[Link to ssh reference group](/cli/azure/ssh)

- On May 21st 2025, any ssh commands connecting to ARC machines on versions <2.0.4 will no longer work. Please upgrade to az ssh version >=2.0.4

### `ssh arc`

[Link to ssh reference group](/cli/azure/ssh)

- On May 21st 2025, any ssh arc commands on versions <2.0.4 will no longer work. Please upgrade to az ssh version >=2.0.4

> [!NOTE]
> This article provides information on upcoming breaking changes. For previously published breaking changes, see [Azure CLI release notes](./release-notes-azure-cli.md).
