---
title: Azure CLI references for Azure Storage | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure Storage.  Follow links to popular articles to learn how to use the Azure CLI for Azure Storage.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: reference
ms.date: 06/19/2023
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure storage, azure storage sync, azure import-export
---

# Azure CLI reference commands for Azure Storage

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands you use to create and manage Azure resources. It's available across many Azure services, including Azure Storage, and gives you the ability to manage Azure Storage from a command line.

The Azure CLI commands for [Azure Storage](/azure/storage) are composed of two parts: a **core** and its **extensions**. Core Azure CLI commands ship as part of the CLI and are fully supported. Extensions give you access to experimental and pre-release commands. For more information about using extensions, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).  

See [az storage](/cli/azure/service-page/azure%20storage) for an alphabetic list of the Azure CLI core and extension references available for the Azure Storage service. For references for each subgroup, see the tables in the following sections:

- [Azure File Sync](#azure-file-sync-references)
- [Import/Export service](#importexport-service-references)
- [Storage accounts](#storage-account-references)
- [Storage blobs](#storage-blob-references)
- [Storage containers](#storage-container-references)
- [Storage file systems](#storage-file-system-references)
- [Storage queues](#storage-queue-references)
- [Storage file shares](#storage-file-share-references)
- [Storage file shares (SMB 3.0)](#storage-file-share-smb-30-references)
- [Additional storage references](#additional-storage-references)

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

## Azure File Sync references

The references in this table are part of the [storagesync](https://github.com/Azure/azure-cli-extensions/tree/main/src/storagesync) extension.

| Reference | Description | More information |
|-|-|-|
| [az storagesync](../latest/docs-ref-autogen/storagesync.yml) | Manage storage sync services. | [Deploy Azure File Sync](/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-cli) |
| [az storagesync registered-server](../latest/docs-ref-autogen/storagesync/registered-server.yml) | Manage servers that are registered with a storage sync service. |  |
| [az storagesync sync-group](../latest/docs-ref-autogen/storagesync/sync-group.yml) | Manage sync groups in a storage sync service. | [Deploy Azure File Sync](/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-cli) |
| [az storagesync sync-group cloud-endpoint](../latest/docs-ref-autogen/storagesync/sync-group/cloud-endpoint.yml) | Manage cloud endpoints in a storage sync service sync group. | [Deploy Azure File Sync](/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-cli) |
| [az storagesync sync-group server-endpoint](../latest/docs-ref-autogen/storagesync/sync-group/server-endpoint.yml) | Manage server endpoints in a storage sync service sync group. | [Deploy Azure File Sync](/azure/storage/file-sync/file-sync-deployment-guide?tabs=azure-cli) |

## Import/Export service references

The references in this table are part of the [import-export](https://github.com/Azure/azure-cli-extensions/tree/main/src/import-export) extension.

| Reference | Description | More information |
|-|-|-|
| [az import-export](../latest/docs-ref-autogen/import-export.yml) | Manage the import and export jobs for the Azure Import/Export service. | [Use Azure Import/Export service to import data to Azure Files](/azure/import-export/storage-import-export-data-to-files?tabs=azure-cli) |
| [az import-export bit-locker-key](../latest/docs-ref-autogen/import-export/bit-locker-key.yml) | List the BitLocker keys for an import or export job. | |
| [az import-export location](../latest/docs-ref-autogen/import-export/location.yml) | Show location details for an import or export job. | [Use Azure Import/Export service to import data to Azure Files](/azure/import-export/storage-import-export-data-to-files?tabs=azure-cli) |

## Storage account references

| Reference | Description | More information |
|-|-|-|
| [az storage account](../latest/docs-ref-autogen/storage/account.yml) | Manage storage accounts. | [Create a storage account](/azure/storage/common/storage-account-create?tabs=azure-cli) |
| [az storage account blob-inventory-policy](../latest/docs-ref-autogen/storage/account/blob-inventory-policy.yml) | Manage the inventory policy of a storage account. | [Enable Azure Storage blob inventory reports](/azure/storage/blobs/blob-inventory-how-to?tabs=azure-cli) |
| [az storage account blob-service-properties](../latest/docs-ref-autogen/storage/account/blob-service-properties.yml) | Manage the properties of a storage account's Blob service. | [Configure object replication for block blobs](/azure/storage/blobs/object-replication-configure?tabs=azure-cli) |
| [az storage account encryption-scope](../latest/docs-ref-autogen/storage/account/encryption-scope.yml) | Manage the encryption scope for a storage account. | [Create and manage encryption scopes](/azure/storage/blobs/encryption-scope-manage?tabs=cli) |
| [az storage account file-service-properties](../latest/docs-ref-autogen/storage/account/file-service-properties.yml) | Manage the properties of a storage account's Blob service. | [Enable soft delete on Azure file shares](/azure/storage/files/storage-files-enable-soft-delete?tabs=azure-cli) |
| [az storage account keys](../latest/docs-ref-autogen/storage/account/keys.yml) | Manage the keys of a storage account. | [Manage storage account access keys](/azure/storage/common/storage-account-keys-manage?tabs=azure-cli) |
| [az storage account management-policy](../latest/docs-ref-autogen/storage/account/management-policy.yml) | Manage a storage account's management policies. |  |
| [az storage account network-rule](../latest/docs-ref-autogen/storage/account/network-rule.yml) | Manage network rules. | [Configure Azure Storage firewalls and virtual networks](/azure/storage/common/storage-network-security?tabs=azure-cli) |
| [az storage account or-policy](../latest/docs-ref-autogen/storage/account/or-policy.yml) | Manage storage account Object Replication Policy. | [Configure object replication for block blobs](/azure/storage/blobs/object-replication-configure?tabs=azure-cli) |
| [az storage account or-policy rule](../latest/docs-ref-autogen/storage/account/or-policy/rule.yml) | Manage the Object Replication Policy rules of a storage account. | [Configure object replication for block blobs](/azure/storage/blobs/object-replication-configure?tabs=azure-cli) |
| [az storage account private-endpoint-connection](../latest/docs-ref-autogen/storage/account/private-endpoint-connection.yml) | Manage a storage account's private endpoint connection. | |
| [az storage account private-link-resource](../latest/docs-ref-autogen/storage/account/private-link-resource.yml) | Manage a storage account's private link resources. | |

## Storage blob references

Some references in this table are part of the [storage-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-preview) or [storage-blob-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-blob-preview) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az storage blob](../latest/docs-ref-autogen/storage/blob.yml) | Manage object storage for unstructured data (blobs). | | [Quickstart: Create, download, and list blobs with Azure CLI](/azure/storage/blobs/storage-quickstart-blobs-cli) |
| [az storage blob access](../latest/docs-ref-autogen/storage/blob/access.yml) | Manage the access control properties of a blob when Hierarchical Namespace is enabled. | storage-preview |  |
| [az storage blob copy](../latest/docs-ref-autogen/storage/blob/copy.yml) | Manage blob copy operations. | | [Move Azure storage blobs from the command line with the Azure CLI](/learn/modules/copy-blobs-from-command-line-and-code/4-exercise-move-blobs-using-cli) |
| [az storage blob directory](../latest/docs-ref-autogen/storage/blob/directory.yml) | Manage blob directories in a storage account container. | storage-preview |  |
| [az storage blob directory access](../latest/docs-ref-autogen/storage/blob/directory/access.yml) | Manage the access control properties of a directory when Hierarchical Namespace is enabled. | storage-preview | |
| [az storage blob directory metadata](../latest/docs-ref-autogen/storage/blob/directory/metadata.yml) | Manage directory metadata. | storage-preview |  |
| [az storage blob incremental-copy](../latest/docs-ref-autogen/storage/blob/incremental-copy.yml) | Manage blob incremental copy operations. | | |
| [az storage blob lease](../latest/docs-ref-autogen/storage/blob/lease.yml) | Manage storage blob leases. | |  |
| [az storage blob metadata](../latest/docs-ref-autogen/storage/blob/metadata.yml) | Manage blob metadata. | | [View blob properties and metadata using Azure tools and code](/learn/modules/organize-blobs-properties-metadata/3-view-blob-properties-and-metadata-using-azure-tools-and-code) |
| [az storage blob service-properties](../latest/docs-ref-autogen/storage/blob/service-properties.yml) | Manage storage blob service properties. | | [Deploy a static website to blob storage](/learn/modules/create-cdn-static-resources-blob-storage/1b-exercise-deploy-a-website) |
| [az storage blob service-properties delete-policy](../latest/docs-ref-autogen/storage/blob/service-properties/delete-policy.yml) | Manage storage blob delete-policy service properties. | |  |
| [az storage blob tag](../latest/docs-ref-autogen/storage/blob/tag.yml) | Manage storage blob tags. | storage-blob-preview | |

## Storage container references

| Reference | Description | More information |
|-|-|-|
| [az storage container](../latest/docs-ref-autogen/storage/container.yml) | Manage blob storage containers. | [Tutorial: Upload image data in the cloud with Azure Storage](/azure/storage/blobs/storage-upload-process-images?tabs=dotnet%2Cazure-cli) |
| [az storage container immutability-policy](../latest/docs-ref-autogen/storage/container/immutability-policy.yml) | Manage container immutability policies. | [Configure immutability policies for containers](/azure/storage/blobs/immutable-policy-configure-container-scope?tabs=azure-cli) |
| [az storage container lease](../latest/docs-ref-autogen/storage/container/lease.yml) | Manage blob storage container leases. | |
| [az storage container legal-hold](../latest/docs-ref-autogen/storage/container/legal-hold.yml) | Manage container legal holds. | |
| [az storage container metadata](../latest/docs-ref-autogen/storage/container/metadata.yml) | Manage container metadata. | [View blob properties and metadata using azure tools and code](/learn/modules/organize-blobs-properties-metadata/3-view-blob-properties-and-metadata-using-azure-tools-and-code) |
| [az storage container policy](../latest/docs-ref-autogen/storage/container/policy.yml) | Manage container-stored access policies. | [Use Azure Blob storage Shared Access Signatures to restrict access to data in HDInsight](/azure/hdinsight/hdinsight-storage-sharedaccesssignature-permissions) |

## Storage file share references

| Reference | Description | More information |
|-|-|-|
| [az storage share](../latest/docs-ref-autogen/storage/share.yml) | Manage storage file shares. | [Quickstart: Create and manage Azure file shares using Azure CLI](/azure/storage/files/storage-how-to-use-files-cli) |
| [az storage share metadata](../latest/docs-ref-autogen/storage/share/metadata.yml) | Manage the metadata of a file share. | |
| [az storage share policy](../latest/docs-ref-autogen/storage/share/policy.yml) | Manage shared access policies of a file share. |  |

## Storage file share (SMB 3.0) references

| Reference | Description | More information |
|-|-|-|
| [az storage file](../latest/docs-ref-autogen/storage/file.yml) | Manage storage file shares that use the Server Message Block (SMB) 3.0 protocol. | [Quickstart: Create and manage Azure file shares using Azure CLI](/azure/storage/files/storage-how-to-use-files-cli) |
| [az storage file copy](../latest/docs-ref-autogen/storage/file/copy.yml) | Manage the file copy operations of a file share. | |
| [az storage file metadata](../latest/docs-ref-autogen/storage/file/metadata.yml) | Manage the metadata of a file share. | |

## Storage file system references

Some references in this table are part of the [storage-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-preview) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az storage fs](../latest/docs-ref-autogen/storage/fs.yml) | Manage file systems in an Azure Data Lake Storage Gen2 account. | | [Use Azure CLI to manage directories and files in Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-directory-file-acl-cli) |
| [az storage fs access](../latest/docs-ref-autogen/storage/fs/access.yml) | Manage file system access and permissions for an Azure Data Lake Storage Gen2 account. | | [Use Azure CLI to manage ACLs in Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-acl-cli) |
| [az storage fs directory](../latest/docs-ref-autogen/storage/fs/directory.yml) | Manage directories in an Azure Data Lake Storage Gen2 account. | | [Use Azure CLI to manage directories and files in Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-directory-file-acl-cli) |
| [az storage fs directory metadata](../latest/docs-ref-autogen/storage/fs/directory/metadata.yml) | Manage the metadata for a directory in the file system. | |  |
| [az storage fs file](../latest/docs-ref-autogen/storage/fs/file.yml) | Manage files in an Azure Data Lake Storage Gen2 account. | | [Use Azure CLI to manage directories and files in Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-directory-file-acl-cli) |
| [az storage fs file metadata](../latest/docs-ref-autogen/storage/fs/file/metadata.yml) | Manage the metadata for files in the file system. | | |
| [az storage fs metadata](../latest/docs-ref-autogen/storage/fs/metadata.yml) | Manage the metadata for the file system. | | |
| [az storage fs service-properties](../latest/docs-ref-autogen/storage/fs/service-properties.yml) | Manage the properties of a storage account's Azure Data Lake Storage Gen2 service. | storage-preview |  |

## Storage queue references

| Reference | Description | More information |
|-|-|-|
| [az storage queue](../latest/docs-ref-autogen/storage/queue.yml) | Manage storage queues. | [Choose how to authorize access to queue data with Azure CLI](/azure/storage/queues/authorize-data-operations-cli) |
| [az storage queue metadata](../latest/docs-ref-autogen/storage/queue/metadata.yml) | Manage the metadata for a storage queue. | |
| [az storage queue policy](../latest/docs-ref-autogen/storage/queue/policy.yml) | Manage shared access policies for a storage queue. | |

## Additional storage references

Some references in this table are part of the [storage-preview](https://github.com/Azure/azure-cli-extensions/tree/main/src/storage-preview) extension.

| Reference | Description | Extension? | More information |
|-|-|-|-|
| [az snapshot](../latest/docs-ref-autogen/snapshot.yml) | Manage point-in-time copies of managed disks, native blobs, or other snapshots. | | [Create a snapshot using the portal or Azure CLI](/azure/virtual-machines/linux/snapshot-copy-managed-disk) |
| [az storage azcopy](../latest/docs-ref-autogen/storage/azcopy.yml) | Manage storage operations with the `AzCopy` utility. | storage-preview |  |
| [az storage azcopy blob](../latest/docs-ref-autogen/storage/azcopy/blob.yml) | Manage object storage for blobs with the `AzCopy` utility. | storage-preview | [Transcribe audio files](/learn/modules/intro-to-batch-transcription/3-exercise-transcribe-audio-files) |
| [az storage container-rm](../latest/docs-ref-autogen/storage/container-rm.yml) | Manage Azure containers using the `Microsoft.Storage` resource provider. | | |
| [az storage cors](../latest/docs-ref-autogen/storage/cors.yml) | Manage storage service Cross-Origin Resource Sharing (CORS). | | [Enable CORS for your Azure Storage Services using the Azure CLI](/learn/modules/set-up-cors-website-storage/5-enabling-cors-for-your-azure-storage-services-using-the-azure-cli) |
| [az storage directory](../latest/docs-ref-autogen/storage/directory.yml) | Manage file storage directories. | | [Quickstart: Create and manage Azure file shares using Azure CLI](/azure/storage/files/storage-how-to-use-files-cli) |
| [az storage directory metadata](../latest/docs-ref-autogen/storage/directory/metadata.yml) | Manage file storage directory metadata. | | |
| [az storage entity](../latest/docs-ref-autogen/storage/entity.yml) | Manage table storage entities. | | |
| [az storage logging](../latest/docs-ref-autogen/storage/logging.yml) | Manage storage service logging information. | | |
| [az storage message](../latest/docs-ref-autogen/storage/message.yml) | Manage queue storage messages. | | |
| [az storage metrics](../latest/docs-ref-autogen/storage/metrics.yml) | Manage storage service metrics. | | |
| [az storage share-rm](../latest/docs-ref-autogen/storage/share-rm.yml) | Manage Azure file shares with the `Microsoft.Storage` resource provider. | | [How to create an NFS share](/azure/storage/files/storage-files-how-to-create-nfs-shares?tabs=azure-cli) |
| [az storage table](../latest/docs-ref-autogen/storage/table.yml) | Manage NoSQL key-value storage. | | [Set up a function app in Azure Functions](/learn/modules/send-crop-weather-alerts/6-deploy-azure-function-app) |
| [az storage table policy](../latest/docs-ref-autogen/storage/table/policy.yml) | Manage the shared access policies of a storage table. | | |

## See also

* [Authorize access to data in Azure Storage](/azure/storage/common/authorize-data-access)
* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
