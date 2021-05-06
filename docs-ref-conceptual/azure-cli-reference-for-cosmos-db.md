---
title: Azure CLI references for Azure Cosmos DB
description: Azure CLI reference landing page for Azure Cosmos DB
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 04/30/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure Cosmos DB

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services, including Azure Cosmos DB, and gives you the ability to manage Cosmos DB services from a command line.

## References for Azure Cosmos DB

The [Azure Cosmos DB](/azure/cosmos-db/introduction) CLI experience is composed of two parts: core and extension. Core Azure CLI commands ship as part of the CLI and are fully supported. An extension gives you access to experimental and pre-release commands. For more information about extension references, see [Use extensions with Azure CLI](https://docs.microsoft.com/cli/azure/azure-cli-extensions-overview).  

See [az cosmosdb](/cli/azure/cosmosdb) for a complete list of the Azure CLI core and extension references available for the Azure Cosmos DB service. For references for each subgroup, see the tables in the following sections.

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

## SQL API references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb sql](/cli/azure/cosmosdb/sql) | Manage the SQL resources of an Azure Cosmos DB account. | [Manage Azure Cosmos Core SQL API resources using Azure CLI](/azure/cosmos-db/manage-with-cli) | Core |
| [az cosmosdb sql container](/cli/azure/cosmosdb/sql/container) | Manage Azure Cosmos DB SQL containers. | [Azure Cosmos DB container](/azure/cosmos-db/manage-with-cli#azure-cosmos-db-container) | Core |
| [az cosmosdb sql database](/cli/azure/cosmosdb/sql/database) | Manage Azure Cosmos DB SQL databases. | [Azure Cosmos DB database](/azure/cosmos-db/manage-with-cli#azure-cosmos-db-database) | Core |
| [az cosmosdb sql restorable-container](/cli/azure/cosmosdb/sql/restorable-container) | Manage different versions of SQL containers that can be restored in a database of an Azure Cosmos DB account. | | Extension: cosmosdb-preview |
| [az cosmosdb sql restorable-database](/cli/azure/cosmosdb/sql/restorable-database) | Manage different versions of SQL databases that can be restored in a database of an Azure Cosmos DB account. | | Extension: cosmosdb-preview |
| [az cosmosdb sql restorable-resource](/cli/azure/cosmosdb/sql/restorable-resource) | Manage the databases and its containers that can be restored in an Azure Cosmos DB account for the given timestamp and region. | | Extension: cosmosdb-preview |
| [az cosmosdb sql role](/cli/azure/cosmosdb/sql/role) | Manage Azure Cosmos DB role resources. | [Configure role-based access control for your Azure Cosmos DB account](/azure/cosmos-db/how-to-setup-rbac) | Extension: cosmosdb-preview |
| [az cosmosdb sql stored-procedure](/cli/azure/cosmosdb/sql/stored-procedure) | Manage Azure Cosmos DB SQL stored procedures. | [How to write stored procedures](/azure/cosmos-db/how-to-write-stored-procedures-triggers-udfs#stored-procedures) | Core |
| [az cosmosdb sql trigger](/cli/azure/cosmosdb/sql/trigger) | Manage Azure Cosmos DB SQL triggers. | [How to write triggers](/azure/cosmos-db/how-to-write-stored-procedures-triggers-udfs#triggers) | Core |
| [az cosmosdb sql user-defined-function](/cli/azure/cosmosdb/sql/user-defined-function) | Manage Azure Cosmos DB SQL user-defined functions. | [How to write user-defined functions](/azure/cosmos-db/how-to-write-stored-procedures-triggers-udfs#udfs) | Core |

## API for MongoDB references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb mongodb](/cli/azure/cosmosdb/mongodb) | Manage the MongoDB resources of an Azure Cosmos DB account. | [Introduction to API for MongoDB](/azure/cosmos-db/mongodb-introduction) | Core |
| [az cosmosdb mongodb collection](/cli/azure/cosmosdb/mongodb/collection) | Manage Azure Cosmos DB MongoDB collections.| [Create a database and collection for MongoDB using Azure CLI](/azure/cosmos-db/scripts/cli/mongodb/create) | Core |
| [az cosmosdb mongodb database](/cli/azure/cosmosdb/mongodb/database) | Manage Azure Cosmos DB MongoDB databases. | [Create a database and collection for MongoDB DB using Azure CLI](/azure/cosmos-db/scripts/cli/mongodb/create) | Core |
| [az cosmosdb mongodb restorable-collection](/cli/azure/cosmosdb/mongodb/restorable-collection) | Manage different versions of MongoDB collections that are restorable in a database of an Azure Cosmos DB account. | | Extension: cosmosdb-preview |
| [az cosmosdb mongodb restorable-database](/cli/azure/cosmosdb/mongodb/restorable-database) | Manage different versions of MongoDB databases that are restorable in an Azure Cosmos DB account. | | Extension: cosmosdb-preview |
| [az cosmosdb mongodb restorable-resource](/cli/azure/cosmosdb/mongodb/restorable-resource) | Manage the databases and its collections that are restorable in an Azure Cosmos DB account for the given timestamp and region. | | Extension: cosmosdb-preview |

## Cassandra API references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb cassandra](/cli/azure/cosmosdb/cassandra) | Manage the Cassandra resources of an Azure Cosmos DB account. | [Introduction to Cassandra API in Azure Cosmos DB](/azure/cosmos-db/cassandra-introduction) | Core |
| [az cosmosdb cassandra keyspace](/cli/azure/cosmosdb/cassandra/keyspace) | Manage Azure Cosmos DB Cassandra keyspaces. | [Create a keyspace and table](/azure/cosmos-db/cassandra-spark-ddl-ops) | Core |
| [az cosmosdb cassandra table](/cli/azure/cosmosdb/cassandra/table) | Manage Azure Cosmos DB Cassandra tables. | [Create a keyspace and table](/azure/cosmos-db/cassandra-spark-ddl-ops) | Core |

## Managed Instance for Apache Cassandra references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az managed-cassandra](/cli/azure/managed-cassandra) | References for Managed Instance for Apache Cassandra. | [What is Azure-managed instance for Apache Cassandra?](/azure/managed-instance-apache-cassandra/introduction) | Extension: cosmosdb-preview |
| [az managed-cassandra cluster](/cli/azure/managed-cassandra/cluster) | Reference to handle Managed Instance for Apache Cassandra clusters. | [Manage Apache Cassandra resources using Azure CLI](/azure/managed-instance-apache-cassandra/manage-resources-cli) | Extension: cosmosdb-preview |
| [az managed-cassandra datacenter](/cli/azure/managed-cassandra/datacenter) | Reference to handle Managed Instance for Apache Cassandra datacenters. | [Manage Apache Cassandra resources using Azure CLI](/azure/managed-instance-apache-cassandra/manage-resources-cli) | Extension: cosmosdb-preview |

## Gremlin API references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb gremlin](/cli/azure/cosmosdb/gremlin) | Manage the Gremlin resources of an Azure Cosmos DB account. | [Introduction to Gremlin API in Azure Cosmos DB](/azure/cosmos-db/graph-introduction) | Core |
| [az cosmosdb gremlin database](/cli/azure/cosmosdb/gremlin/database) | Manage Azure Cosmos DB Gremlin databases. | [Create an Azure Cosmos Gremlin API account, database, and graph using Azure CLI](/azure/cosmos-db/scripts/cli/gremlin/create) | Core |
| [az cosmosdb gremlin graph](/cli/azure/cosmosdb/gremlin/graph) | Manage Azure Cosmos DB Gremlin graphs. | [Create an Azure Cosmos Gremlin API account, database, and graph using Azure CLI](/azure/cosmos-db/scripts/cli/gremlin/create) | Core |

## Table API references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb table](/cli/azure/cosmosdb/table) | Manage the Table resources of an Azure Cosmos DB account. | [Introduction to Table API in Azure Cosmos DB](/azure/cosmos-db/table-introduction) | core |
| [az cosmosdb table throughput](/cli/azure/cosmosdb/table/throughput) | Manage the throughput Table resources of an Azure Cosmos DB account. | [Request units in Azure Cosmos DB](/azure/cosmos-db/request-units) | Core |

## Additional references

| Reference | Description | More information | Core or extension
|-|-|-|-|
| [az cosmosdb identity](/cli/azure/cosmosdb/identity) | Manage Azure Cosmos DB-managed service identities. | [Use system-assigned managed identities to access Azure Cosmos DB data](/azure/cosmos-db/managed-identity-based-authentication) | Core |
| [az cosmosdb keys](/cli/azure/cosmosdb/keys) | Manage Azure Cosmos DB keys. | [Secure access to data in Azure Cosmos DB](/azure/cosmos-db/secure-access-to-data) | Core |
| [az cosmosdb network-rule](/cli/azure/cosmosdb/network-rule) | Manage Azure Cosmos DB network rules. | [Configure access to Azure Cosmos DB from virtual networks](/azure/cosmos-db/how-to-configure-vnet-service-endpoint) | Core |
| [az cosmosdb private-endpoint-connection](/cli/azure/cosmosdb/private-endpoint-connection) | Manage Azure Cosmos DB private endpoint connections. | [Configure Azure Private Link for an Azure Cosmos account](/azure/cosmos-db/how-to-configure-private-endpoints) | Core |
| [az cosmosdb private-link-resource](/cli/azure/cosmosdb/private-link-resource) | Manage Azure Cosmos DB private link resources. | [Configure Azure Private Link for an Azure Cosmos account](/azure/cosmos-db/how-to-configure-private-endpoints) | Core |
| [az cosmosdb restorable-database-account](/cli/azure/cosmosdb/restorable-database-account) | Manage restorable Azure Cosmos DB accounts. | | Extension: cosmosdb-preview |

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.

- Learn more about extension references in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
