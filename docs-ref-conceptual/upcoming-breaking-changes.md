---
title: Azure CLI upcoming breaking changes | Microsoft Docs
description: Learn about upcoming breaking changes to Azure CLI command groups, references, and parameters.
ms.date: 04/08/2025
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
# customer intent: As an Azure CLI developer, I need to be aware of upcoming breaking changes so I can plan for migration to new reference commands.
---

# Upcoming breaking changes in Azure CLI

The breaking changes listed in this section are planned for the next major release of the Azure CLI unless otherwise noted. Per our [Support lifecycle](./azure-cli-support-lifecycle.md), breaking changes in Azure Core CLI reference groups occur twice a year.

## acr

### `acr login`

[Link to acr reference group](/cli/azure/acr)

- The output will be changed in next breaking change release(2.73.0) scheduled for May 2025. Exit code will be 1 if command fails for docker login.

## acs

### `aks create`

[Link to aks reference group](/cli/azure/aks)

- The default value of '--node-vm-size' will be changed to 'Dynamically Selected By Azure' from 'Standard_DS2_V2 (Linux), Standard_DS2_V3 (Windows)' in next breaking change release(2.73.0) scheduled for May 2025.

## rdbms

### `postgres flexible-server create`

[Link to postgres flexible-server reference group](/cli/azure/postgres/flexible-server)

- Update default value of "--sku-name" in next breaking change release(2.73.0) scheduled for May 2025. The default value will be changed from "Standard_D2s_v3" to a supported sku based on regional capabilities.
- The default value of '--version' will be changed to '17' from '16' in next breaking change release(2.73.0) scheduled for May 2025.
- Argument '--active-directory-auth' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025. Use '--microsoft-entra-auth' instead.
- The default value of '--create-default-database' will be changed to 'Disabled' from 'Enabled' in next breaking change release(2.73.0) scheduled for May 2025.

### `postgres flexible-server update`

[Link to postgres flexible-server reference group](/cli/azure/postgres/flexible-server)

- User confirmation will be needed for compute and storage updates that trigger a restart of the server.
- Argument '--active-directory-auth' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025. Use '--microsoft-entra-auth' instead.

### `postgres flexible-server replica stop-replication`

[Link to postgres flexible-server replica reference group](/cli/azure/postgres/flexible-server/replica)

- This command has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025. Use 'postgres flexible-server replica promote' instead.

### `postgres flexible-server ad-admin`

[Link to postgres flexible-server ad-admin reference group](/cli/azure/postgres/flexible-server/ad-admin)

- This command group has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025. Use 'microsoft-entra-admin' instead.

## role

### `role assignment list`

[Link to role assignment reference group](/cli/azure/role/assignment)

- Argument '--include-classic-administrators' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

## storage

### `storage account migration start`

[Link to storage account migration reference group](/cli/azure/storage/account/migration)

- Starting from version 2.73.0, changing redundancy configuration would require additional (y/n) confirmation: "After your request to convert the account’s redundancy configuration is validated, the conversion will typically complete in a few days, but can take several weeks depending on current resource demands in the region, account size, and other factors. The conversion can’t be stopped after being initiated, and for accounts with geo redundancy a failover can’t be initiated while conversion is in progress. The data within the storage account will continue to be accessible with no loss of durability or availability. Confirm redundancy configuration change: (y/n)"

## vm

### `sig image-definition list-community`

[Link to sig image-definition reference group](/cli/azure/sig/image-definition)

- Argument '--marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- Argument '--show-next-marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

### `sig image-version list-community`

[Link to sig image-version reference group](/cli/azure/sig/image-version)

- Argument '--marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- Argument '--show-next-marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

### `sig image-definition list-shared`

[Link to sig image-definition reference group](/cli/azure/sig/image-definition)

- Argument '--marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- Argument '--show-next-marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

### `sig image-version list-shared`

[Link to sig image-version reference group](/cli/azure/sig/image-version)

- Argument '--marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.
- Argument '--show-next-marker' has been deprecated and will be removed in next breaking change release(2.73.0) scheduled for May 2025.

# Upcoming breaking changes in Azure CLI Extensions

The breaking changes listed in this section are planned in future releases and occur at the discretion of the extension owner. 

> [!NOTE]
> This article provides information on upcoming breaking changes. For previously published breaking changes, see [Azure CLI release notes](./release-notes-azure-cli.md).
