---
title: Azure CLI references for Azure Cosmos DB | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure Cosmos DB.  Follow links to popular articles to learn how to use the Azure CLI for Azure Cosmos DB.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: reference
ms.date: 06/19/2023
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure cosmos db
---

# Azure CLI reference commands for Azure Cosmos DB

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services, including Azure Cosmos DB, and gives you the ability to manage Cosmos DB services from a command-line.

The Azure CLI commands for [Azure Cosmos DB](/azure/cosmos-db/introduction) are composed of two parts: core and extension. Core Azure CLI commands ship as part of the CLI and are fully supported. An extension gives you access to experimental and pre-release commands. For more information about extension references, see [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).  

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

See [az cosmosdb](/cli/azure/service-page/azure%20cosmos%20db) for an alphabetic list of Azure CLI core and extension references available for the Azure Cosmos DB service. For references in each subgroup, see the tables in the following sections:

- [SQL API](#sql-api-references)
- [API for MongoDB](#api-for-mongodb-references)
- [Cassandra API](#cassandra-api-references)
- [Managed Instance for Apache Cassandra](#managed-instance-for-apache-cassandra-references)
- [Gremlin API](#gremlin-api-references)
- [Table API](#table-api-references)
- [Additional Cosmos DB references](#additional-cosmos-db-references)

## SQL API references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb sql](../latest/docs-ref-autogen/cosmosdb/sql.yml) | Manage the SQL resources of an Azure Cosmos DB account. | [Manage Azure Cosmos Core SQL API resources using Azure CLI](/azure/cosmos-db/manage-with-cli) | Core |
| [az cosmosdb sql container](../latest/docs-ref-autogen/cosmosdb/sql/container.yml) | Manage Azure Cosmos DB SQL containers. | [Azure Cosmos DB container](/azure/cosmos-db/manage-with-cli#azure-cosmos-db-container) | Core |
| [az cosmosdb sql database](../latest/docs-ref-autogen/cosmosdb/sql/database.yml) | Manage Azure Cosmos DB SQL databases. | [Azure Cosmos DB database](/azure/cosmos-db/manage-with-cli#azure-cosmos-db-database) | Core |
| [az cosmosdb sql restorable-container](../latest/docs-ref-autogen/cosmosdb/sql/restorable-container.yml) | Manage different versions of SQL containers that can be restored in a database of an Azure Cosmos DB account. | | Extension: cosmosdb-preview |
| [az cosmosdb sql restorable-database](../latest/docs-ref-autogen/cosmosdb/sql/restorable-database.yml) | Manage different versions of SQL databases that can be restored in a database of an Azure Cosmos DB account. | | Extension: cosmosdb-preview |
| [az cosmosdb sql restorable-resource](../latest/docs-ref-autogen/cosmosdb/sql/restorable-resource.yml) | Manage the databases and its containers that can be restored in an Azure Cosmos DB account for the given timestamp and region. | | Extension: cosmosdb-preview |
| [az cosmosdb sql role](../latest/docs-ref-autogen/cosmosdb/sql/role.yml) | Manage Azure Cosmos DB role resources. | [Configure role-based access control for your Azure Cosmos DB account](/azure/cosmos-db/how-to-setup-rbac) | Extension: cosmosdb-preview |
| [az cosmosdb sql stored-procedure](../latest/docs-ref-autogen/cosmosdb/sql/stored-procedure.yml) | Manage Azure Cosmos DB SQL stored procedures. | [How to write stored procedures](/azure/cosmos-db/how-to-write-stored-procedures-triggers-udfs#stored-procedures) | Core |
| [az cosmosdb sql trigger](../latest/docs-ref-autogen/cosmosdb/sql/trigger.yml) | Manage Azure Cosmos DB SQL triggers. | [How to write triggers](/azure/cosmos-db/how-to-write-stored-procedures-triggers-udfs#triggers) | Core |
| [az cosmosdb sql user-defined-function](../latest/docs-ref-autogen/cosmosdb/sql/user-defined-function.yml) | Manage Azure Cosmos DB SQL user-defined functions. | [How to write user-defined functions](/azure/cosmos-db/how-to-write-stored-procedures-triggers-udfs#udfs) | Core |

## API for MongoDB references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb mongodb](../latest/docs-ref-autogen/cosmosdb/mongodb.yml) | Manage the MongoDB resources of an Azure Cosmos DB account. | [Introduction to API for MongoDB](/azure/cosmos-db/mongodb-introduction) | Core |
| [az cosmosdb mongodb collection](../latest/docs-ref-autogen/cosmosdb/mongodb/collection.yml) | Manage Azure Cosmos DB MongoDB collections.| [Create a database and collection for MongoDB using Azure CLI](/azure/cosmos-db/scripts/cli/mongodb/create) | Core |
| [az cosmosdb mongodb database](../latest/docs-ref-autogen/cosmosdb/mongodb/database.yml) | Manage Azure Cosmos DB MongoDB databases. | [Create a database and collection for MongoDB DB using Azure CLI](/azure/cosmos-db/scripts/cli/mongodb/create) | Core |
| [az cosmosdb mongodb restorable-collection](../latest/docs-ref-autogen/cosmosdb/mongodb/restorable-collection.yml) | Manage different versions of MongoDB collections that are restorable in a database of an Azure Cosmos DB account. | | Extension: cosmosdb-preview |
| [az cosmosdb mongodb restorable-database](../latest/docs-ref-autogen/cosmosdb/mongodb/restorable-database.yml) | Manage different versions of MongoDB databases that are restorable in an Azure Cosmos DB account. | | Extension: cosmosdb-preview |
| [az cosmosdb mongodb restorable-resource](../latest/docs-ref-autogen/cosmosdb/mongodb/restorable-resource.yml) | Manage the databases and its collections that are restorable in an Azure Cosmos DB account for the given timestamp and region. | | Extension: cosmosdb-preview |

## Cassandra API references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb cassandra](../latest/docs-ref-autogen/cosmosdb/cassandra.yml) | Manage the Cassandra resources of an Azure Cosmos DB account. | [Introduction to Cassandra API in Azure Cosmos DB](/azure/cosmos-db/cassandra-introduction) | Core |
| [az cosmosdb cassandra keyspace](../latest/docs-ref-autogen/cosmosdb/cassandra/keyspace.yml) | Manage Azure Cosmos DB Cassandra keyspaces. | [Create a keyspace and table](/azure/cosmos-db/cassandra-spark-ddl-ops) | Core |
| [az cosmosdb cassandra table](../latest/docs-ref-autogen/cosmosdb/cassandra/table.yml) | Manage Azure Cosmos DB Cassandra tables. | [Create a keyspace and table](/azure/cosmos-db/cassandra-spark-ddl-ops) | Core |

## Managed Instance for Apache Cassandra references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az managed-cassandra](../latest/docs-ref-autogen/managed-cassandra.yml) | References for Managed Instance for Apache Cassandra. | [What is Azure-managed instance for Apache Cassandra?](/azure/managed-instance-apache-cassandra/introduction) | Extension: cosmosdb-preview |
| [az managed-cassandra cluster](../latest/docs-ref-autogen/managed-cassandra/cluster.yml) | Reference to handle Managed Instance for Apache Cassandra clusters. | [Manage Apache Cassandra resources using Azure CLI](/azure/managed-instance-apache-cassandra/manage-resources-cli) | Extension: cosmosdb-preview |
| [az managed-cassandra datacenter](../latest/docs-ref-autogen/managed-cassandra/datacenter.yml) | Reference to handle Managed Instance for Apache Cassandra datacenters. | [Manage Apache Cassandra resources using Azure CLI](/azure/managed-instance-apache-cassandra/manage-resources-cli) | Extension: cosmosdb-preview |

## Gremlin API references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb gremlin](../latest/docs-ref-autogen/cosmosdb/gremlin.yml) | Manage the Gremlin resources of an Azure Cosmos DB account. | [Introduction to Gremlin API in Azure Cosmos DB](/azure/cosmos-db/graph-introduction) | Core |
| [az cosmosdb gremlin database](../latest/docs-ref-autogen/cosmosdb/gremlin/database.yml) | Manage Azure Cosmos DB Gremlin databases. | [Create an Azure Cosmos Gremlin API account, database, and graph using Azure CLI](/azure/cosmos-db/scripts/cli/gremlin/create) | Core |
| [az cosmosdb gremlin graph](../latest/docs-ref-autogen/cosmosdb/gremlin/graph.yml) | Manage Azure Cosmos DB Gremlin graphs. | [Create an Azure Cosmos Gremlin API account, database, and graph using Azure CLI](/azure/cosmos-db/scripts/cli/gremlin/create) | Core |

## Table API references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb table](../latest/docs-ref-autogen/cosmosdb/table.yml) | Manage the Table resources of an Azure Cosmos DB account. | [Introduction to Table API in Azure Cosmos DB](/azure/cosmos-db/table-introduction) | core |
| [az cosmosdb table throughput](../latest/docs-ref-autogen/cosmosdb/table/throughput.yml) | Manage the throughput Table resources of an Azure Cosmos DB account. | [Request units in Azure Cosmos DB](/azure/cosmos-db/request-units) | Core |

## Additional Cosmos DB references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb identity](../latest/docs-ref-autogen/cosmosdb/identity.yml) | Manage Azure Cosmos DB-managed service identities. | [Use system-assigned managed identities to access Azure Cosmos DB data](/azure/cosmos-db/managed-identity-based-authentication) | Core |
| [az cosmosdb keys](../latest/docs-ref-autogen/cosmosdb/keys.yml) | Manage Azure Cosmos DB keys. | [Secure access to data in Azure Cosmos DB](/azure/cosmos-db/secure-access-to-data) | Core |
| [az cosmosdb network-rule](../latest/docs-ref-autogen/cosmosdb/network-rule.yml) | Manage Azure Cosmos DB network rules. | [Configure access to Azure Cosmos DB from virtual networks](/azure/cosmos-db/how-to-configure-vnet-service-endpoint) | Core |
| [az cosmosdb private-endpoint-connection](../latest/docs-ref-autogen/cosmosdb/private-endpoint-connection.yml) | Manage Azure Cosmos DB private endpoint connections. | [Configure Azure Private Link for an Azure Cosmos account](/azure/cosmos-db/how-to-configure-private-endpoints) | Core |
| [az cosmosdb private-link-resource](../latest/docs-ref-autogen/cosmosdb/private-link-resource.yml) | Manage Azure Cosmos DB private link resources. | [Configure Azure Private Link for an Azure Cosmos account](/azure/cosmos-db/how-to-configure-private-endpoints) | Core |
| [az cosmosdb restorable-database-account](../latest/docs-ref-autogen/cosmosdb/restorable-database-account.yml) | Manage restorable Azure Cosmos DB accounts. | | Extension: cosmosdb-preview |

## See also

* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
