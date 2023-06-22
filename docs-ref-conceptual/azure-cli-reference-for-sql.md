---
title: Azure CLI references for Azure SQL | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure SQL.  Follow links to popular articles to learn how to use the Azure CLI for Azure SQL
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: reference
ms.date: 06/19/2023
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure sql
---

# Azure CLI reference commands for Azure SQL

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services and gives you the ability to manage Azure SQL services from a command-line.

The Azure CLI commands for [Azure SQL](/azure/azure-sql/) is composed of core references only and ships as part of the Azure CLI.  See [az sql](../latest/docs-ref-autogen/sql.yml) for an alphabetic list of the Azure CLI core and extension references available for the Azure SQL service. For references for each subgroup, see the tables in the following sections:

- [SQL database](#sql-database-references)
- [SQL Managed Instance](#sql-managed-instance-references)
- [SQL Managed Instance database](#sql-managed-instance-database-references)
- [SQL server](#sql-server-references)
- [SQL virtual machine](#sql-virtual-machine-references)
- [Additional references](#additional-sql-references)

## SQL database references

| Reference | Description | More information |
|-|-|-|
| [az sql db](../latest/docs-ref-autogen/sql/db.yml) | Manage Azure SQL Database. | [What is Azure SQL Database?](/azure/azure-sql/database/sql-database-paas-overview) |
| [az sql db audit-policy](../latest/docs-ref-autogen/sql/db/audit-policy.yml) | Manage a SQL database's auditing policy. | [Auditing for Azure SQL Database](/azure/azure-sql/database/auditing-overview) |
| [az sql db classification](../latest/docs-ref-autogen/sql/db/classification.yml) | Manage a SQL database's sensitivity classifications. | [Data discovery and classification](/azure/azure-sql/database/data-discovery-and-classification-overview) |
| [az sql db classification recommendation](../latest/docs-ref-autogen/sql/db/classification/recommendation.yml) | Manage a database's sensitivity classification recommendations. | [Data discovery and classification](/azure/azure-sql/database/data-discovery-and-classification-overview) |
| [az sql db ltr-backup](../latest/docs-ref-autogen/sql/db/ltr-backup.yml) | Manage a SQL database's long-term retention backup. | [Long-term retention](/azure/azure-sql/database/long-term-retention-overview) |
| [az sql db ltr-policy](../latest/docs-ref-autogen/sql/db/ltr-policy.yml) | Manage a SQL database's long-term retention policy. | [Manage Azure SQL Database long-term backup retention](/azure/azure-sql/database/long-term-backup-retention-configure) |
| [az sql db op](../latest/docs-ref-autogen/sql/db/op.yml) | Manage the operations on a SQL database. | [Configure and manage content reference](/azure/azure-sql/database/how-to-content-reference-guide) |
| [az sql db replica](../latest/docs-ref-autogen/sql/db/replica.yml) | Manage replication between SQL databases. | [Replication to Azure SQL Database](/azure/azure-sql/database/replication-to-sql-database) |
| [az sql db tde](../latest/docs-ref-autogen/sql/db/tde.yml) | Manage a SQL database's transparent data encryption. | [Transparent data encryption](/azure/azure-sql/database/transparent-data-encryption-tde-overview) |
| [az sql db threat-policy](../latest/docs-ref-autogen/sql/db/threat-policy.yml) | Manage a SQL database's threat detection policies. | [Configure Advanced Threat Protection](/azure/azure-sql/database/threat-detection-configure) |

## SQL Managed Instance references

| Reference | Description | More information |
|-|-|-|
| [az sql mi](../latest/docs-ref-autogen/sql/mi.yml) | Manage Azure SQL Managed Instance. | [What is Azure SQL Managed Instance?](/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview) |
| [az sql mi ad-admin](../latest/docs-ref-autogen/sql/mi/ad-admin.yml) | Manage a SQL Managed Instance's Active Directory administrator. | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |
| [az sql mi ad-only-auth](../latest/docs-ref-autogen/sql/mi/ad-only-auth.yml) | Manage a SQL Managed Instance Azure Active Directory-only settings. | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |
| [az sql mi key](../latest/docs-ref-autogen/sql/mi/key.yml) | Manage a SQL Managed Instance's keys. | [Configure Always Encrypted by using Azure Key Vault](/azure/azure-sql/database/always-encrypted-azure-key-vault-configure) |
| [az sql mi op](../latest/docs-ref-autogen/sql/mi/op.yml) | Manage operations on a SQL Managed Instance. | [Overview of Azure SQL Managed Instance management operations](/azure/azure-sql/managed-instance/management-operations-overview) |
| [az sql mi tde-key](../latest/docs-ref-autogen/sql/mi/tde-key.yml) | Manage a SQL Managed Instance's encryption protector. | [Transparent data encryption](/azure/azure-sql/database/transparent-data-encryption-tde-overview) |

## SQL Managed Instance database references

| Reference | Description | More information |
|-|-|-|
| [az sql midb](../latest/docs-ref-autogen/sql/midb.yml) | Manage Azure SQL Managed Instance databases. | [What is Azure SQL Managed Instance?](/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview) |
| [az sql midb log-replay](../latest/docs-ref-autogen/sql/midb/log-replay.yml) | Manage Log Replay service commands for an Azure SQL Managed Instance database. | [Migrate databases from SQL Server to SQL Managed Instance by using Log Replay Service](/azure/azure-sql/managed-instance/log-replay-service-migrate) |
 [az sql midb ltr-backup](../latest/docs-ref-autogen/sql/midb/ltr-backup.yml) | Manage SQL Managed Instance database long-term retention backups. | [Manage Azure SQL Managed Instance long-term backup retention](/azure/azure-sql/managed-instance/long-term-backup-retention-configure) |
| [az sql midb ltr-policy](../latest/docs-ref-autogen/sql/midb/ltr-policy.yml) | Manage SQL Managed Instance database long-term retention policy. | [Long-term retention](/azure/azure-sql/database/long-term-retention-overview) |
| [az sql midb short-term-retention-policy](../latest/docs-ref-autogen/sql/midb/short-term-retention-policy.yml) | Manage SQL Managed Instance database backup short-term retention policy. | [Automated backups](/azure/azure-sql/database/automated-backups-overview) |

## SQL server references

| Reference | Description | More information |
|-|-|-|
| [az sql server](../latest/docs-ref-autogen/sql/server.yml) | Manage SQL Database servers. | [Create and manage servers](/azure/azure-sql/database/single-database-manage) |
| [az sql server ad-admin](../latest/docs-ref-autogen/sql/server/ad-admin.yml) | Manage a server's Active Directory administrator. | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |
| [az sql server ad-only-auth](../latest/docs-ref-autogen/sql/server/ad-only-auth.yml) | Manage Azure Active Directory-only Authentication settings for a server. | [Configure and manage Azure AD authentication with Azure SQL](/azure/azure-sql/database/authentication-aad-configure) |
| [az sql server audit-policy](../latest/docs-ref-autogen/sql/server/audit-policy.yml) | Manage a server's audit policy. | [Auditing for Azure SQL Database](/azure/azure-sql/database/auditing-overview) |
| [az sql server conn-policy](../latest/docs-ref-autogen/sql/server/conn-policy.yml) | Manage a server's connection policy. | [Azure SQL connectivity settings](/azure/azure-sql/database/connectivity-settings) |
| [az sql server dns-alias](../latest/docs-ref-autogen/sql/server/dns-alias.yml) | Manage a server's DNS aliases. | [DNS alias for Azure SQL Database](/azure/azure-sql/database/dns-alias-overview) |
| [az sql server firewall-rule](../latest/docs-ref-autogen/sql/server/firewall-rule.yml) | Manage a server's firewall rules. | [Azure SQL Database and Azure Synapse IP firewall rules](/azure/azure-sql/database/firewall-configure) |
| [az sql server key](../latest/docs-ref-autogen/sql/server/key.yml) | Manage a server's keys. | [Enable Transparent Data Encryption with customer-managed key from Azure Key Vault](/azure/azure-sql/database/transparent-data-encryption-byok-configure) |
| [az sql server ms-support audit-policy](../latest/docs-ref-autogen/sql/server/ms-support/audit-policy.yml) | Manage the audit policy of a server's Microsoft support operations. | [Auditing for Azure SQL Database and Azure Synapse Analytics](/azure/azure-sql/database/auditing-overview) |
| [az sql server tde-key](../latest/docs-ref-autogen/sql/server/tde-key.yml) | Manage a server's encryption protector. | [Enable Transparent Data Encryption with customer-managed key from Azure Key Vault](/azure/azure-sql/database/transparent-data-encryption-byok-configure) |
| [az sql server vnet-rule](../latest/docs-ref-autogen/sql/server/vnet-rule.yml) | Manage a server's virtual network rules. | [Use virtual network service endpoints and rules for servers](/azure/azure-sql/database/vnet-service-endpoint-rule-overview) |

## SQL virtual machine references

| Reference | Description | More information |
|-|-|-|
| [az sql vm](../latest/docs-ref-autogen/sql/vm.yml) | Manage SQL virtual machines. | [What is SQL Server on Azure Virtual Machines](/azure/azure-sql/virtual-machines/windows/sql-server-on-azure-vm-iaas-what-is-overview) |
| [az sql vm group](../latest/docs-ref-autogen/sql/vm/group.yml) | Manage SQL virtual machine groups. | [Always On availability group on SQL Server on Azure VMs](/azure/azure-sql/virtual-machines/windows/availability-group-overview) |
| [az sql vm group ag-listener](../latest/docs-ref-autogen/sql/vm/group/ag-listener.yml) | Manage SQL availability group listeners. | [Configure one or more Always On availability group listeners](/azure/azure-sql/virtual-machines/windows/availability-group-listener-powershell-configure) |

## Additional SQL references

| Reference | Description | More information |
|-|-|-|
| [az sql](../latest/docs-ref-autogen/sql.yml) | Manage Azure SQL. | [What is Azure SQL?](/azure/azure-sql/azure-sql-iaas-vs-paas-what-is-overview) |
| [az sql dw](../latest/docs-ref-autogen/sql/dw.yml) | Manage data warehouses. | [What is dedicated SQL pool (formerly SQL DW) in Azure Synapse Analytics?](/azure/synapse-analytics/sql-data-warehouse/sql-data-warehouse-overview-what-is) |
| [az sql elastic-pool](../latest/docs-ref-autogen/sql/elastic-pool.yml) | Manage elastic pools. | [Elastic pools](/azure/azure-sql/database/elastic-pool-overview) |
| [az sql elastic-pool op](../latest/docs-ref-autogen/sql/elastic-pool/op.yml) | Manage operations on an elastic pool. | [Elastic pools](/azure/azure-sql/database/elastic-pool-overview) |
| [az sql failover-group](../latest/docs-ref-autogen/sql/failover-group.yml) | Manage SQL Database failover groups. | [Configure a failover group](/azure/azure-sql/database/auto-failover-group-configure) |
| [az sql instance-failover-group](../latest/docs-ref-autogen/sql/instance-failover-group.yml) | Use SQL Managed Instance failover groups. | [Configure a failover group](/azure/azure-sql/database/auto-failover-group-configure) |
| [az sql instance-pool](../latest/docs-ref-autogen/sql/instance-pool.yml) | Use Manage Instance pools. | [What is an Azure SQL Managed Instance pool?](/azure/azure-sql/managed-instance/instance-pools-overview) |
| [az sql stg](../latest/docs-ref-autogen/sql/stg.yml) | Manage Server Trust Groups. | [Use Server Trust Groups](/azure/azure-sql/managed-instance/server-trust-group-overview) |
| [az sql virtual-cluster](../latest/docs-ref-autogen/sql/virtual-cluster.yml) | Manage the virtual cluster of a SQL Managed Instance. | [Virtual cluster connectivity architecture](/azure/azure-sql/managed-instance/connectivity-architecture-overview#virtual-cluster-connectivity-architecture) |

## See also

* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)