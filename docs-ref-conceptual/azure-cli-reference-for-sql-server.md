---
title: Azure CLI references for Azure SQL Server
description: Azure CLI reference landing page for Azure SQL Server
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 05/21/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure SQL Server

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services, including Azure SQL Server, and gives you the ability to manage Azure SQL Server services from a command line.

## References for Azure SQL Server

The [Azure SQL Server](/azure/azure-sql/) CLI experience is composed of core references only and ships as part of the CLI.  

See [az sql](/cli/azure/sql) for a complete list of the Azure CLI references available for the Azure SQL Server service. For references for each subgroup, see the tables in the following sections.

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

## SQL database references

| Reference | Description | More information |
|-|-|-|
| [az sql db](/cli/azure/sql/db) | Manage a SQL Server database. | [What is Azure SQL Database?](/azure/azure-sql/database/sql-database-paas-overview) |
| [az sql db audit-policy](/cli/azure/sql/db/audit-policy) | Manage a SQL database's auditing policy. | [Auditing for Azure SQL Database](/azure/azure-sql/database/auditing-overview) |
| [az sql db classification](/cli/azure/sql/db/classification) | Manage a SQL database's sensitivity classifications. | [Data Discovery & Classification](/azure/azure-sql/database/data-discovery-and-classification-overview) |
| [az sql db classification recommendation](/cli/azure/sql/db/classification/recommendation) | Manage a database's sensitivity classification recommendations. | [Data Discovery & Classification](/azure/azure-sql/database/data-discovery-and-classification-overview) |
| [az sql db ltr-backup](/cli/azure/sql/db/ltr-backup) | Manage a SQL database's long-term retention backup. | [Long-term retention - Azure SQL Database and Azure SQL Managed Instance](/azure/azure-sql/database/long-term-retention-overview) |
| [az sql db ltr-policy](/cli/azure/sql/db/ltr-policy) | Manage a SQL database's long-term retention policy. | [Manage Azure SQL Database long-term backup retention](/azure/azure-sql/database/long-term-backup-retention-configure) |
| [az sql db op](/cli/azure/sql/db/op) | Manage the operations on a SQL database. | [Overview of Azure SQL Managed Instance management operations](/azure/azure-sql/managed-instance/management-operations-overview) |
| [az sql db replica](/cli/azure/sql/db/replica) | Manage replication between SQL databases. | [Replication to Azure SQL Database](/azure/azure-sql/database/replication-to-sql-database) |
| [az sql db tde](/cli/azure/sql/db/tde) | Manage a SQL database's transparent data encryption. | [Transparent data encryption](/azure/azure-sql/database/transparent-data-encryption-tde-overview) |
| [az sql db threat-policy](/cli/azure/sql/db/threat-policy) | Manage a SQL database's threat detection policies. | [Configure Advanced Threat Protection for Azure SQL Database](/azure/azure-sql/database/threat-detection-configure) |

## SQL Managed Instance references

| Reference | Description | More information |
|-|-|-|
| [az sql mi](/cli/azure/sql/mi) | Manage a SQL Managed Instance. | [What is Azure SQL Managed Instance?](/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview) |
| [az sql mi ad-admin](/cli/azure/sql/mi/ad-admin) | Manage a SQL Managed Instance's Active Directory administrator. | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |
| [az sql mi ad-only-auth](/cli/azure/sql/mi/ad-only-auth) | Manage a SQL Managed Instance Azure Active Directory-only settings. | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |
| [az sql mi key](/cli/azure/sql/mi/key) | Manage a SQL Managed Instance's keys. | [Configure Always Encrypted by using Azure Key Vault](/azure/azure-sql/database/always-encrypted-azure-key-vault-configure) |
| [az sql mi op](/cli/azure/sql/mi/op) | Manage operations on a SQL Managed Instance. | [Overview of Azure SQL Managed Instance management operations](/azure/azure-sql/managed-instance/management-operations-overview) |
| [az sql mi tde-key](/cli/azure/sql/mi/tde-key) | Manage a SQL Managed Instance's encryption protector. | [Transparent data encryption](/azure/azure-sql/database/transparent-data-encryption-tde-overview) |

## SQL Managed Instance database references

| Reference | Description | More information |
|-|-|-|
| [az sql midb](/cli/azure/sql/midb) | Manage Azure SQL Managed Instance databases. | [What is Azure SQL Managed Instance?](/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview) |
| [az sql midb log-replay](/cli/azure/sql/midb/log-replay) | Manage Log Replay service commands for an Azure SQL Managed Instance database. | [Migrate databases from SQL Server to SQL Managed Instance by using Log Replay Service](/azure/azure-sql/managed-instance/log-replay-service-migrate) |
| [az sql midb ltr-policy](/cli/azure/sql/midb/ltr-policy) | Manage SQL Managed Instance database long-term retention policy. | [Long-term retention](/azure/azure-sql/database/long-term-retention-overview) |
| [az sql midb short-term-retention-policy](/cli/azure/sql/midb/short-term-retention-policy) | Manage SQL Managed Instance database backup short-term retention policy. | [Automated backups](/azure/azure-sql/database/automated-backups-overview) |

## Server references

| Reference | Description | More information |
|-|-|-|
| [az sql server](/cli/azure/sql/server) | Manage SQL Database servers. | [Create and manage servers](/azure/azure-sql/database/single-database-manage) |
| [az sql server ad-admin](/cli/azure/sql/server/ad-admin) | Manage a server's Active Directory administrator. | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |
| [az sql server ad-only-auth](/cli/azure/sql/server/ad-only-auth) | Manage Azure Active Directory-only Authentication settings for a server. | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |
| [az sql server conn-policy](/cli/azure/sql/server/conn-policy) | Manage a server's connection policy. |  |
| [az sql server dns-alias](/cli/azure/sql/server/dns-alias) | Manage a server's DNS aliases. | [DNS alias for Azure SQL Database](/azure/azure-sql/database/dns-alias-overview) |
| [az sql server firewall-rule](/cli/azure/sql/server/firewall-rule) | Manage a server's firewall rules. | [Azure SQL Database and Azure Synapse IP firewall rules](/azure/azure-sql/database/firewall-configure) |
| [az sql server key](/cli/azure/sql/server/key) | Manage a server's keys. | [Enable Transparent Data Encryption with customer-managed key from Azure Key Vault](/azure/azure-sql/database/transparent-data-encryption-byok-configure) |
| [az sql server ms-support audit-policy](/cli/azure/sql/server/ms-support/audit-policy) | Manage the audit policy of a server's Microsoft support operations. | [Auditing for Azure SQL Database and Azure Synapse Analytics](/azure/azure-sql/database/auditing-overview) |
| [az sql server tde-key](/cli/azure/sql/server/tde-key) | Manage a server's encryption protector. | [Enable Transparent Data Encryption with customer-managed key from Azure Key Vault](/azure/azure-sql/database/transparent-data-encryption-byok-configure) |
| [az sql server vnet-rule](/cli/azure/sql/server/vnet-rule) | Manage a server's virtual network rules. | [Use virtual network service endpoints and rules for servers in Azure SQL Database](/azure/azure-sql/database/vnet-service-endpoint-rule-overview) |

## SQL virtual machines references

| Reference | Description | More information |
|-|-|-|
| [az sql vm](/cli/azure/sql/vm) | Manage SQL virtual machines. | [What is SQL Server on Azure Virtual Machines](/azure/azure-sql/virtual-machines/windows/sql-server-on-azure-vm-iaas-what-is-overview) |
| [az sql vm group](/cli/azure/sql/vm/group) | Manage SQL virtual machine groups. | [Always On availability group on SQL Server on Azure VMs](/azure/azure-sql/virtual-machines/windows/availability-group-overview) |
| [az sql vm group ag-listener](/cli/azure/sql/vm/group/ag-listener) | Manage SQL availability group listeners. | [Configure one or more Always On availability group listeners](/azure/azure-sql/virtual-machines/windows/availability-group-listener-powershell-configure) |

## Additional references

| Reference | Description | More information |
|-|-|-|
| [az sql dw](/cli/azure/sql/dw) | Manage data warehouses. | [What is dedicated SQL pool (formerly SQL DW) in Azure Synapse Analytics?](/azure/synapse-analytics/sql-data-warehouse/sql-data-warehouse-overview-what-is) |
| [az sql elastic-pool](/cli/azure/sql/elastic-pool) | Manage elastic pools. | [Elastic pools](/azure/azure-sql/database/elastic-pool-overview) |
| [az sql elastic-pool op](/cli/azure/sql/elastic-pool/op) | Manage operations on an elastic pool. | [Elastic pools](/azure/azure-sql/database/elastic-pool-overview) |
| [az sql failover-group](/cli/azure/sql/failover-group) | Manage SQL Database failover groups. | [Configure a failover group](/azure/azure-sql/database/auto-failover-group-configure) |
| [az sql instance-failover-group](/cli/azure/sql/instance-failover-group) | Use SQL Managed Instance failover groups. | [Configure a failover group](/azure/azure-sql/database/auto-failover-group-configure) |
| [az sql instance-pool](/cli/azure/sql/instance-pool) | Use Manage Instance pools. | [/azure/azure-sql/managed-instance/instance-pools-overview](What is an Azure SQL Managed Instance pool?) |
| [az sql stg](/cli/azure/sql/stg) | Manage Server Trust Groups. | [Use Server Trust Groups](/azure/azure-sql/managed-instance/server-trust-group-overview) |
| [az sql virtual-cluster](/cli/azure/sql/virtual-cluster) | Manage the virtual cluster of a SQL Managed Instance. | [Virtual cluster connectivity architecture](/azure/azure-sql/managed-instance/connectivity-architecture-overview#virtual-cluster-connectivity-architecture) |

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
