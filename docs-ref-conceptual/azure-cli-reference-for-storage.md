---
title: Azure CLI references for Azure Storage | Microsoft Docs
description: Learn how to use the Azure CLI to manage Azure Storage.
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 09/21/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure storage, azure storage sync, azure import-export
---

# Azure CLI reference commands for Azure Storage

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands you use to create and manage Azure resources. It's available across many Azure services, including Azure Storage, and gives you the ability to manage Azure Storage from a command line.

The Azure CLI commands for [Azure Storage](/azure/storage) are composed of two parts: a **core** and its **extensions**. Core Azure CLI commands ship as part of the CLI and are fully supported. Extensions give you access to experimental and pre-release commands. For more information about using extensions, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).  

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

See [Azure Storage](/cli/azure/service-page/azure%20storage) for an alphabetic list of the Azure CLI core and extension references available for the Azure Storage service. For references for each subgroup, see the tables in the following sections:

- [Azure File Sync](#azure-file-sync-references)
- [Import/Export service](#importexport-service-references)
- [Storage accounts](#storage-account-references)
- [Storage blobs](#storage-blob-references)
- [Storage containers](#storage-container-references)
- [Storage file systems](#storage-file-system-references)
- [Storage queues](#storage-queue-references)
- [Storage file shares](#storage-file-share-references)
- [Storage file shares (SMB 3.0)](#storage-file-shares-smb-30-references)
- [Additional storage references](#additional-storage-references)

List of Azure CLI references that can be used to manage Azure Storage, reference descriptions, and links to popular articles:

## Azure File Sync references

The references in this table are part of the [storagesync](https://github.com/Azure/azure-cli-extensions/tree/main/src/storagesync) extension.

| Reference | Description | More information |
|-|-|-|
| [az storagesync](/cli/azure/storagesync) | Manage storage sync services. | [Deploy Azure File Sync](/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-cli) |
| [az storagesync registered-server](/cli/azure/storagesync/registered-server) | Manage servers that are registered with a storage sync service. |  |
| [az storagesync sync-group](/cli/azure/storagesync/sync-group) | Manage sync groups in a storage sync service. | [Deploy Azure File Sync](/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-cli) |
| [az storagesync sync-group cloud-endpoint](/cli/azure/storagesync/sync-group/cloud-endpoint) | Manage cloud endpoints in a storage sync service sync group. | [Deploy Azure File Sync](/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-cli) |
| [az storagesync sync-group server-endpoint](/cli/azure/storagesync/sync-group/server-endpoint) | Manage server endpoints in a storage sync service sync group. | [Deploy Azure File Sync](/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-cli) |

## Import/Export service references

The references in this table are part of the [import-export](https://github.com/Azure/azure-cli-extensions/tree/main/src/import-export) extension.

| Reference | Description | More information |
|-|-|-|
| [az import-export](/cli/azure/import-export) | Manage the import and export jobs for the Azure Import/Export service. | [Use Azure Import/Export service to import data to Azure Files](/azure/import-export/storage-import-export-data-to-files?tabs=azure-cli) |
| [az import-export bit-locker-key](/cli/azure/import-export/bit-locker-key) | List the BitLocker keys for an import or export job. | |
| [az import-export location](/cli/azure/import-export/location) | Show location details for an import or export job. | [Use Azure Import/Export service to import data to Azure Files](/azure/import-export/storage-import-export-data-to-files?tabs=azure-cli) |

## Storage account references

| Reference | Description | More information |
|-|-|-|
| [az storage account](/cli/azure/storage/account) | Manage storage accounts. | [Create a storage account](/azure/storage/common/storage-account-create?tabs=azure-cli) |
| [az storage account blob-inventory-policy](/cli/azure/storage/account/blob-inventory-policy) | Manage the inventory policy of a storage account. | [Enable Azure Storage blob inventory reports](/azure/storage/blobs/blob-inventory-how-to?tabs=azure-cli) |
| [az storage account blob-service-properties](/cli/azure/storage/account/blob-service-properties) | Manage the properties of a storage account's Blob service. | [Configure object replication for block blobs](/azure/storage/blobs/object-replication-configure?tabs=azure-cli) |
| [az storage account encryption-scope](/cli/azure/storage/account/encryption-scope) | Manage the encryption scope for a storage account. | [Create and manage encryption scopes](/azure/storage/blobs/encryption-scope-manage?tabs=cli) |
| [az storage account file-service-properties](/cli/azure/storage/account/file-service-properties) | Manage the properties of a storage account's Blob service. | [Enable soft delete on Azure file shares](/azure/storage/files/storage-files-enable-soft-delete?tabs=azure-cli) |
| [az storage account keys](/cli/azure/storage/account/keys) | Manage the keys of a storage account. | [Manage storage account access keys](/azure/storage/common/storage-account-keys-manage?tabs=azure-cli) |
| [az storage account management-policy](/cli/azure/storage/account/management-policy) | Manage a storage account's management policies. |  |
| [az storage account network-rule](/cli/azure/storage/account/network-rule) | Manage network rules. | [Configure Azure Storage firewalls and virtual networks](/azure/storage/common/storage-network-security?tabs=azure-cli) |
| [az storage account or-policy](/cli/azure/storage/account/or-policy) | Manage storage account Object Replication Policy. | [Configure object replication for block blobs](/azure/storage/blobs/object-replication-configure?tabs=azure-cli) |
| [az storage account or-policy rule](/cli/azure/storage/account/or-policy/rule) | Manage the Object Replication Policy rules of a storage account. | [Configure object replication for block blobs](/azure/storage/blobs/object-replication-configure?tabs=azure-cli) |
| [az storage account private-endpoint-connection](/cli/azure/storage/account/private-endpoint-connection) | Manage a storage account's private endpoint connection. | |
| [az storage account private-link-resource](/cli/azure/storage/account/private-link-resource) | Manage a storage account's private link resources. | |

## Storage blob references

Some references in this table are part of the [storage-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-preview) or [storage-blob-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-blob-preview) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az storage blob](/cli/azure/storage/blob) | Manage object storage for unstructured data (blobs). | | [Quickstart: Create, download, and list blobs with Azure CLI](/azure/storage/blobs/storage-quickstart-blobs-cli) |
| [az storage blob access](/cli/azure/storage/blob/access) | Manage the access control properties of a blob when Hierarchical Namespace is enabled. | storage-preview |  |
| [az storage blob copy](/cli/azure/storage/blob/copy) | Manage blob copy operations. | | [Move Azure storage blobs from the command line with the Azure CLI](/learn/modules/copy-blobs-from-command-line-and-code/4-exercise-move-blobs-using-cli) |
| [az storage blob directory](/cli/azure/storage/blob/directory) | Manage blob directories in a storage account container. | storage-preview |  |
| [az storage blob directory access](/cli/azure/storage/blob/directory/access) | Manage the access control properties of a directory when Hierarchical Namespace is enabled. | storage-preview | |
| [az storage blob directory metadata](/cli/azure/storage/blob/directory/metadata) | Manage directory metadata. | storage-preview |  |
| [az storage blob incremental-copy](/cli/azure/storage/blob/incremental-copy) | Manage blob incremental copy operations. | | |
| [az storage blob lease](/cli/azure/storage/blob/lease) | Manage storage blob leases. | |  |
| [az storage blob metadata](/cli/azure/storage/blob/metadata) | Manage blob metadata. | | [View blob properties and metadata using Azure tools and code](/learn/modules/organize-blobs-properties-metadata/3-view-blob-properties-and-metadata-using-azure-tools-and-code) |
| [az storage blob service-properties](/cli/azure/storage/blob/service-properties) | Manage storage blob service properties. | | [Deploy a static website to blob storage](/learn/modules/create-cdn-static-resources-blob-storage/1b-exercise-deploy-a-website) |
| [az storage blob service-properties delete-policy](/cli/azure/storage/blob/service-properties/delete-policy) | Manage storage blob delete-policy service properties. | |  |
| [az storage blob tag](/cli/azure/storage/blob/tag) | Manage storage blob tags. | storage-blob-preview | |

## Storage container references

| Reference | Description | More information |
|-|-|-|
| [az storage container](/cli/azure/storage/container) | Manage blob storage containers. | [Tutorial: Upload image data in the cloud with Azure Storage](/azure/storage/blobs/storage-upload-process-images?tabs=dotnet%2Cazure-cli) |
| [az storage container immutability-policy](/cli/azure/storage/container/immutability-policy) | Manage container immutability policies. | [Configure immutability policies for containers](/azure/storage/blobs/immutable-policy-configure-container-scope?tabs=azure-cli) |
| [az storage container lease](/cli/azure/storage/container/lease) | Manage blob storage container leases. | |
| [az storage container legal-hold](/cli/azure/storage/container/legal-hold) | Manage container legal holds. | |
| [az storage container metadata](/cli/azure/storage/container/metadata) | Manage container metadata. | [View blob properties and metadata using azure tools and code](/learn/modules/organize-blobs-properties-metadata/3-view-blob-properties-and-metadata-using-azure-tools-and-code) |
| [az storage container policy](/cli/azure/storage/container/policy) | Manage container-stored access policies. | [Use Azure Blob storage Shared Access Signatures to restrict access to data in HDInsight](/azure/hdinsight/hdinsight-storage-sharedaccesssignature-permissions) |

## Storage file share references

| Reference | Description | More information |
|-|-|-|
| [az storage share](/cli/azure/storage/share) | Manage storage file shares. | [Quickstart: Create and manage Azure file shares using Azure CLI](/azure/storage/files/storage-how-to-use-files-cli) |
| [az storage share metadata](/cli/azure/storage/share/metadata) | Manage the metadata of a file share. | |
| [az storage share policy](/cli/azure/storage/share/policy) | Manage shared access policies of a file share. |  |

## Storage file share (SMB 3.0) references

| Reference | Description | More information |
|-|-|-|
| [az storage file](/cli/azure/storage/file) | Manage storage file shares that use the Server Message Block (SMB) 3.0 protocol. | [Quickstart: Create and manage Azure file shares using Azure CLI](/azure/storage/files/storage-how-to-use-files-cli) |
| [az storage file copy](/cli/azure/storage/file/copy) | Manage the file copy operations of a file share. | |
| [az storage file metadata](/cli/azure/storage/file/metadata) | Manage the metadata of a file share. | |

## Storage file system references

Some references in this table are part of the [storage-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-preview) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az storage fs](/cli/azure/storage/fs) | Manage file systems in an Azure Data Lake Storage Gen2 account. | | [Use Azure CLI to manage directories and files in Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-directory-file-acl-cli) |
| [az storage fs access](/cli/azure/storage/fs/access) | Manage file system access and permissions for an Azure Data Lake Storage Gen2 account. | | [Use Azure CLI to manage ACLs in Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-acl-cli) |
| [az storage fs directory](/cli/azure/storage/fs/directory) | Manage directories in an Azure Data Lake Storage Gen2 account. | | [Use Azure CLI to manage directories and files in Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-directory-file-acl-cli) |
| [az storage fs directory metadata](/cli/azure/storage/fs/directory/metadata) | Manage the metadata for a directory in the file system. | |  |
| [az storage fs file](/cli/azure/storage/fs/file) | Manage files in an Azure Data Lake Storage Gen2 account. | | [Use Azure CLI to manage directories and files in Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-directory-file-acl-cli) |
| [az storage fs file metadata](/cli/azure/storage/fs/file/metadata) | Manage the metadata for files in the file system. | | |
| [az storage fs metadata](/cli/azure/storage/fs/metadata) | Manage the metadata for the file system. | | |
| [az storage fs service-properties](/cli/azure/storage/fs/service-properties) | Manage the properties of a storage account's Azure Data Lake Storage Gen2 service. | storage-preview |  |

## Storage queue references

| Reference | Description | More information |
|-|-|-|
| [az storage queue](/cli/azure/storage/queue) | Manage storage queues. | [Choose how to authorize access to queue data with Azure CLI](/azure/storage/queues/authorize-data-operations-cli) |
| [az storage queue metadata](/cli/azure/storage/queue/metadata) | Manage the metadata for a storage queue. | |
| [az storage queue policy](/cli/azure/storage/queue/policy) | Manage shared access policies for a storage queue. | |

## Additional storage references

Some references in this table are part of the [storage-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-preview) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az snapshot](/cli/azure/snapshot) | Manage point-in-time copies of managed disks, native blobs, or other snapshots. | | [Create a snapshot using the portal or Azure CLI](/azure/virtual-machines/linux/snapshot-copy-managed-disk) |
| [az storage azcopy](/cli/azure/storage/azcopy) | Manage storage operations with the `AzCopy` utility. | storage-preview |  |
| [az storage azcopy blob](/cli/azure/storage/azcopy/blob) | Manage object storage for blobs with the `AzCopy` utility. | storage-preview | [Transcribe audio files](/learn/modules/intro-to-batch-transcription/3-exercise-transcribe-audio-files) |
| [az storage container-rm](/cli/azure/storage/container-rm) | Manage Azure containers using the `Microsoft.Storage` resource provider. | | |
| [az storage cors](/cli/azure/storage/cors) | Manage storage service Cross-Origin Resource Sharing (CORS). | | [Enable CORS for your Azure Storage Services using the Azure CLI](/learn/modules/set-up-cors-website-storage/5-enabling-cors-for-your-azure-storage-services-using-the-azure-cli) |
| [az storage directory](/cli/azure/storage/directory) | Manage file storage directories. | | [Quickstart: Create and manage Azure file shares using Azure CLI](/azure/storage/files/storage-how-to-use-files-cli) |
| [az storage directory metadata](/cli/azure/storage/directory/metadata) | Manage file storage directory metadata. | | |
| [az storage entity](/cli/azure/storage/entity) | Manage table storage entities. | | |
| [az storage logging](/cli/azure/storage/logging) | Manage storage service logging information. | | |
| [az storage message](/cli/azure/storage/message) | Manage queue storage messages. | | |
| [az storage metrics](/cli/azure/storage/metrics) | Manage storage service metrics. | | |
| [az storage share-rm](/cli/azure/storage/share-rm) | Manage Azure file shares with the `Microsoft.Storage` resource provider. | | [How to create an NFS share](/azure/storage/files/storage-files-how-to-create-nfs-shares?tabs=azure-cli) |
| [az storage table](/cli/azure/storage/table) | Manage NoSQL key-value storage. | | [Set up a function app in Azure Functions](/learn/modules/send-crop-weather-alerts/6-deploy-azure-function-app) |
| [az storage table policy](/cli/azure/storage/table/policy) | Manage the shared access policies of a storage table. | | |

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.

- Learn more about extensions in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
