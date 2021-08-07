---
title: Azure CLI references for Azure Storage
description: Azure CLI reference landing page for Azure Storage
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 08/04/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure Storage

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands you use to create and manage Azure resources. It's available across many Azure services, including Azure Web Apps, and gives you the ability to manage Azure Web Apps from a command line.

The [Azure Storage](/azure/storage) CLI experience is composed of two parts: core and extension. Core Azure CLI commands ship as part of the CLI and are fully supported. An extension gives you access to experimental and pre-release commands. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).  

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

See [Azure Storage](/cli/azure/service-page/azure%20storage) for a complete list of the Azure CLI core and extension references available for the Azure Storage service. For references for each subgroup, see the tables in the following sections:

- [Import-export](#import-export)
- [Storage accounts](#storage-accounts)
- [Storage blobs](#storage-blobs)
- [Storage containers](#storage-containers)
- [Storage file systems](#storage-file-systems)
- [Storage queues](#storage-queues)
- [Storage file shares](#storage-file-shares)
- [Additional storage references](#additional-storage-references)

## Import-export

These references are part of the [import-export](https://github.com/Azure/azure-cli-extensions/tree/main/src/import-export) extension.

| Reference | Description | More information |
|-|-|-|
| [az import-export](/cli/azure/import-export) | Manage import-export. |  |
| [az import-export bit-locker-key](/cli/azure/import-export/bit-locker-key) | Import-export bit-locker-key. |
| [az import-export location](/cli/azure/import-export/location) | Manage import-export locations. |  |

## Storage accounts

| Reference | Description | More information |
|-|-|-|
| [az storage account](/cli/azure/storage/account) | Manage storage accounts. |  |
| [az storage account blob-inventory-policy](/cli/azure/storage/account/blob-inventory-policy) | Manage storage account Blob Inventory Policy. |  |
| [az storage account blob-service-properties](/cli/azure/storage/account/blob-service-properties) | Manage the properties of a storage account's Blob service. |  |
| [az storage account encryption-scope](/cli/azure/storage/account/encryption-scope) | Manage the encryption scope for a storage account. |  |
| [az storage account file-service-properties](/cli/azure/storage/account/file-service-properties) | Manage the properties of a storage account's Blob service. |  |
| [az storage account keys](/cli/azure/storage/account/keys) | Manage storage account keys. |  |
| [az storage account management-policy](/cli/azure/storage/account/management-policy) | Manage storage account management policies. |  |
| [az storage account network-rule](/cli/azure/storage/account/network-rule) | Manage network rules. |  |
| [az storage account or-policy](/cli/azure/storage/account/or-policy) | Manage storage account Object Replication Policy. |  |
| [az storage account or-policy rule](/cli/azure/storage/account/or-policy/rule) | Manage storage account Object Replication Policy rules. |  |
| [az storage account private-endpoint-connection](/cli/azure/storage/account/private-endpoint-connection) | Manage storage account private endpoint connection. |  |
| [az storage account private-link-resource](/cli/azure/storage/account/private-link-resource) | Manage storage account private link resources. |  |

## Storage blobs

Some references in this table are part of the [storage-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-preview) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az storage blob](/cli/azure/storage/blob) | Manage object storage for unstructured data (blobs). |  |  |
| [az storage blob access](/cli/azure/storage/blob/access) | Manage the access control properties of a blob when Hierarchical Namespace is enabled. | Yes | |
| [az storage blob copy](/cli/azure/storage/blob/copy) | Manage blob copy operations.  |  |
| [az storage blob directory](/cli/azure/storage/blob/directory) | Manage blob directories in storage account container. | Yes | |
| [az storage blob directory access](/cli/azure/storage/blob/directory/access) | storage-preview extension   Manage the access control properties of a directory when Hierarchical Namespace is enabled. | Yes | |
| [az storage blob directory metadata](/cli/azure/storage/blob/directory/metadata) | storage-preview extension  Manage directory metadata. | Yes | |
| [az storage blob incremental-copy](/cli/azure/storage/blob/incremental-copy) | Manage blob incremental copy operations. | | |
| [az storage blob lease](/cli/azure/storage/blob/lease) | Manage storage blob leases. |  | | |
| [az storage blob metadata](/cli/azure/storage/blob/metadata) | Manage blob metadata. |  |  |
| [az storage blob service-properties](/cli/azure/storage/blob/service-properties) | Manage storage blob service properties. |  |  |
| [az storage blob service-properties delete-policy](/cli/azure/storage/blob/service-properties/delete-policy) | Manage storage blob delete-policy service properties. |  |  |

## Storage containers

| Reference | Description | More information |
|-|-|-|
| [az storage container](/cli/azure/storage/container) | Manage blob storage containers. |  |
| [az storage container immutability-policy](/cli/azure/storage/container/immutability-policy) | Manage container immutability policies. |  |
| [az storage container lease](/cli/azure/storage/container/lease) | Manage blob storage container leases. |  |
| [az storage container legal-hold](/cli/azure/storage/container/legal-hold) | Manage container legal holds. |  |
| [az storage container metadata](/cli/azure/storage/container/metadata) | Manage container metadata. |  |
| [az storage container policy](/cli/azure/storage/container/policy) | Manage container stored access policies. |  |

## Storage file systems

| Reference | Description | More information |
|-|-|-|
| [az storage fs](/cli/azure/storage/fs) | Manage file systems in an Azure Data Lake Storage Gen2 account. | |
| [az storage fs access](/cli/azure/storage/fs/access) | Manage file system access and permissions for an Azure Data Lake Storage Gen2 account. | |
| [az storage fs directory](/cli/azure/storage/fs/directory) | Manage directories in an Azure Data Lake Storage Gen2 account. | |
| [az storage fs directory metadata](/cli/azure/storage/fs/directory/metadata) | Manage the metadata for a directory in the file system. | |
| [az storage fs file](/cli/azure/storage/fs/file) | Manage files in an Azure Data Lake Storage Gen2 account. | |
| [az storage fs file metadata](/cli/azure/storage/fs/file/metadata) | Manage the metadata for files in file system. | |
| [az storage fs metadata](/cli/azure/storage/fs/metadata) | Manage the metadata for the file system. | |

## Storage queues

| Reference | Description | More information |
|-|-|-|
| [az storage queue](/cli/azure/storage/queue) | Manage storage queues. |  |
| [az storage queue metadata](/cli/azure/storage/queue/metadata) | Manage the metadata for a storage queue. |  |
| [az storage queue policy](/cli/azure/storage/queue/policy) | Manage shared access policies for a storage queue. |  |

## Storage file shares

| Reference | Description | More information |
|-|-|-|
| [az storage share](/cli/azure/storage/share) | Manage file shares. |  |
| [az storage share metadata](/cli/azure/storage/share/metadata) | Manage the metadata of a storage file share. |  |
| [az storage share policy](/cli/azure/storage/share/policy) | Manage shared access policies of a storage file share. |  |

## Additional storage references

| Reference | Description | More information |
|-|-|-|
| [az storage container-rm](/cli/azure/storage/container-rm) | Manage Azure containers using the `Microsoft.Storage` resource provider. |  |
| [az storage cors](/cli/azure/storage/cors) | Manage storage service Cross-Origin Resource Sharing (CORS). |  |
| [az storage directory](/cli/azure/storage/directory) | Manage file storage directories. |  |
| [az storage directory metadata](/cli/azure/storage/directory/metadata) | Manage file storage directory metadata. |  |
| [az storage entity](/cli/azure/storage/entity) | Manage table storage entities. |  |
| [az storage file](/cli/azure/storage/file) | Manage file shares that use the SMB 3.0 protocol. |  |
| [az storage file copy](/cli/azure/storage/file/copy) | Manage file copy operations. |  |
| [az storage file metadata](/cli/azure/storage/file/metadata) | Manage file metadata. |  |
| [az storage logging](/cli/azure/storage/logging) | Manage storage service logging information. |  |
| [az storage message](/cli/azure/storage/message) | Manage queue storage messages. |  |
| [az storage metrics](/cli/azure/storage/metrics) | Manage storage service metrics. |  |
| [az storage share-rm](/cli/azure/storage/share-rm) | Manage Azure file shares using the `Microsoft.Storage` resource provider. |  |
| [az storage table policy](/cli/azure/storage/table/policy) | Manage shared access policies of a storage table. |  |

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.

- Learn more about extension references in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
