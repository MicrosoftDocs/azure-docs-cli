---
title: Azure CLI upcoming breaking changes | Microsoft Docs
description: Learn about upcoming breaking changes to Azure CLI command groups, references, and parameters.
ms.date: 04/15/2025
ms.service: azure-cli
ms.custom: devx-track-azurecli
# customer intent: As an Azure CLI developer, I need to be aware of upcoming breaking changes so I can plan for migration to new reference commands.
---

# Upcoming breaking changes in Azure CLI

The breaking changes listed in this section are planned for the next major release of the Azure CLI unless otherwise noted. Per our [Support lifecycle](./azure-cli-support-lifecycle.md), breaking changes in Azure Core CLI reference groups occur twice a year.

## core

- Starting from 2.73.0, the azure stack profiles ('2017-03-09-profile', '2018-03-01-hybrid', '2019-03-01-hybrid', '2020-09-01-hybrid') will be deprecated. Please use the 'latest' profile or the CLI 2.66.* (LTS) version instead.

## acr

### `acr login`

[Link to acr reference group](/cli/azure/acr)

- The output will be changed in next breaking change release(2.73.0) scheduled for May 2025. Exit code will be 1 if command fails for docker login.

### `acr helm`

[Link to acr helm reference group](/cli/azure/acr/helm)

- In November 2020, Helm 2 reached end of life. Starting on March 30th, 2025 Azure Container Registry will no longer support Helm 2. Therefore, the legacy "Helm repositories" functionality will also be retired. We recommend that you transition to Helm 3 immediately.
- Starting January 21st, 2025 the CLI command `az acr helm push` was retired to prevent pushing new Helm charts to legacy Helm repositories.
- Starting March 30th, 2025 the CLI command group `az acr helm` was retired, ending all legacy Helm repository capabilities in Azure Container Registry.
- All Helm charts not stored as an OCI artifact was deleted from Azure Container Registry on March 30th, 2025.
- Learn how to find all Helm charts stored in a Helm repository here: `az acr helm list`. If the Helm chart you are using is listed then it is stored in a legacy Helm repository and is at risk of deletion.
- For more information on managing and deploying applications for Kubernetes, see https://aka.ms/acr/helm.

## acs

### `aks create`

[Link to aks reference group](/cli/azure/aks)

- The default value of '--node-vm-size' will be changed to 'Dynamically Selected By Azure' from 'Standard_DS2_V2 (Linux), Standard_DS2_V3 (Windows)' in next breaking change release(2.73.0) scheduled for May 2025.

## cloud

### `cloud register`

[Link to cloud reference group](/cli/azure/cloud)

- Starting from 2.73.0, no gallery endpoint will be returned if using endpoint discovery with --endpoint-resource-manager. Please manually set it with --endpoint-gallery.

### `cloud update`

[Link to cloud reference group](/cli/azure/cloud)

- Starting from 2.73.0, no gallery endpoint will be returned if using endpoint discovery with --endpoint-resource-manager. Please manually set it with --endpoint-gallery.

## netappfiles

### `netappfiles create`

[Link to cloud reference group](/cli/azure/netappfiles)

- '--is-restoring' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

### `netappfiles update`

[Link to cloud reference group](/cli/azure/netappfiles)

- '--avs-data-store' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--creation-token' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--is-large-volume' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--is-restoring' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--ldap-enabled' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--network-features' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--security-style' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--volume-type' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--endpoint-type' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

## profile

### `login`

- Passing the managed identity ID with --username is deprecated and will be removed in 2.73.0. Use --client-id, --object-id or --resource-id instead.

## rdbms

### `postgres flexible-server create`

[Link to postgres flexible-server reference group](/cli/azure/postgres/flexible-server)

- Update default value of "--sku-name" in next breaking change release(2.73.0) scheduled for May 2025. The default value will be changed from "Standard_D2s_v3" to a supported sku based on regional capabilities.
- The default value of '--version' will be changed to '17' from '16' in next breaking change release(2.73.0) scheduled for May 2025.
- The default value of '--create-default-database' will be changed to 'Disabled' from 'Enabled' in next breaking change release(2.73.0) scheduled for May 2025.
- '--active-directory-auth' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025. Use '--microsoft-entra-auth' instead.

### `postgres flexible-server update`

[Link to postgres flexible-server reference group](/cli/azure/postgres/flexible-server)

- '--active-directory-auth' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025. Use '--microsoft-entra-auth' instead.
- User confirmation will be needed for compute and storage updates that trigger a restart of the server.

### `postgres flexible-server replica stop-replication`

[Link to postgres flexible-server replica reference group](/cli/azure/postgres/flexible-server/replica)

- 'postgres flexible-server replica stop-replication' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025. Use 'postgres flexible-server replica promote' instead.

### `postgres flexible-server ad-admin`

[Link to postgres flexible-server ad-admin reference group](/cli/azure/postgres/flexible-server/ad-admin)

- 'postgres flexible-server ad-admin' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025. Use 'microsoft-entra-admin' instead.

## role

### `role assignment list`

[Link to role assignment reference group](/cli/azure/role/assignment)

- '--include-classic-administrators' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

## storage

### `storage account migration start`

[Link to storage account migration reference group](/cli/azure/storage/account/migration)

- Starting from version 2.73.0, changing redundancy configuration would require additional (y/n) confirmation: "After your request to convert the account’s redundancy configuration is validated, the conversion will typically complete in a few days, but can take several weeks depending on current resource demands in the region, account size, and other factors. The conversion can’t be stopped after being initiated, and for accounts with geo redundancy a failover can’t be initiated while conversion is in progress. The data within the storage account will continue to be accessible with no loss of durability or availability. Confirm redundancy configuration change: (y/n)"

## vm

### `sig image-definition list-community`

[Link to sig image-definition reference group](/cli/azure/sig/image-definition)

- '--marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--show-next-marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

### `sig image-version list-community`

[Link to sig image-version reference group](/cli/azure/sig/image-version)

- '--marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--show-next-marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

### `sig image-definition list-shared`

[Link to sig image-definition reference group](/cli/azure/sig/image-definition)

- '--marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--show-next-marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

### `sig image-version list-shared`

[Link to sig image-version reference group](/cli/azure/sig/image-version)

- '--marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- '--show-next-marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

> [!NOTE]
> This article provides information on upcoming breaking changes. For previously published breaking changes, see [Azure CLI release notes](./release-notes-azure-cli.md).
