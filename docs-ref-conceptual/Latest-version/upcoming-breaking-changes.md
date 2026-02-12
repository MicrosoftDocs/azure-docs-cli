---
title: Azure CLI upcoming breaking changes | Microsoft Docs
description: Learn about upcoming breaking changes to Azure CLI command groups, references, and parameters.
ms.date: 02/12/2026
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
# customer intent: As an Azure CLI developer, I need to be aware of upcoming breaking changes so I can plan for migration to new reference commands.
---

# Upcoming breaking changes in Azure CLI

The breaking changes listed in this section are planned for the next major release of the Azure CLI unless otherwise noted. Per our [Support lifecycle](./azure-cli-support-lifecycle.md), breaking changes in Azure Core CLI reference groups occur twice a year.

## acr

### `acr config content-trust update`

[Link to acr config content-trust reference group](/cli/azure/acr/config/content-trust)

- Remove content-trust enabled configuration in next breaking change release(2.86.0) scheduled for May 2026. The `--status enabled` parameter will no longer be accepted and will result in an error due to Docker Content Trust deprecation. To know more about the Breaking Change, please visit https://aka.ms/acr/dctdeprecation.

### `acr check-health`

[Link to acr reference group](/cli/azure/acr)

- Remove Notary client version validation in next breaking change release(2.86.0) scheduled for May 2026. The Notary client version check will no longer be performed as part of the check-health command due to Docker Content Trust deprecation. To know more about the Breaking Change, please visit https://aka.ms/acr/dctdeprecation.

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

- 'compute-recommender spot-placement-recommender' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026. Use 'az compute-recommender spot-placement-score' instead.

## mysql

### `mysql flexible-server create`

[Link to mysql flexible-server reference group](/cli/azure/mysql/flexible-server)

- '--storage-redundancy' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.

### `mysql flexible-server restore`

[Link to mysql flexible-server reference group](/cli/azure/mysql/flexible-server)

- '--storage-redundancy' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.

### `mysql flexible-server geo-restore`

[Link to mysql flexible-server reference group](/cli/azure/mysql/flexible-server)

- '--storage-redundancy' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.

### `mysql flexible-server replica create`

[Link to mysql flexible-server replica reference group](/cli/azure/mysql/flexible-server/replica)

- '--storage-redundancy' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.

## postgresql

### `postgres flexible-server create`

[Link to postgres flexible-server reference group](/cli/azure/postgres/flexible-server)

- '--high-availability' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026. Use '--zonal-resiliency' instead.

### `postgres flexible-server update`

[Link to postgres flexible-server reference group](/cli/azure/postgres/flexible-server)

- '--high-availability' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026. Use '--zonal-resiliency' instead.

### `postgres flexible-server replica create`

[Link to postgres flexible-server replica reference group](/cli/azure/postgres/flexible-server/replica)

- '--replica-name' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026. Use '--name' instead.

### `postgres flexible-server firewall-rule`

[Link to postgres flexible-server firewall-rule reference group](/cli/azure/postgres/flexible-server/firewall-rule)

- The --name/-n argument will be repurposed to specify the firewall rule name. The --server-name/-s argument will be introduced to specify the server name in next breaking change release(2.86.0) scheduled for May 2026.
- The --rule-name/-r argument has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.

### `postgres flexible-server migration`

[Link to postgres flexible-server migration reference group](/cli/azure/postgres/flexible-server/migration)

- The --migration-name argument has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.
- The --name/-n argument will be repurposed to specify the migration name. The --server-name/-s argument will be introduced to specify the server name in next breaking change release(2.86.0) scheduled for May 2026.

### `postgres flexible-server db`

[Link to postgres flexible-server db reference group](/cli/azure/postgres/flexible-server/db)

- The --database-name/-d argument has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.
- The --name/-n argument will be repurposed to specify the database name. The --server-name/-s argument will be introduced to specify the server name in next breaking change release(2.86.0) scheduled for May 2026.

### `postgres flexible-server backup`

[Link to postgres flexible-server backup reference group](/cli/azure/postgres/flexible-server/backup)

- The --backup-name/-b argument has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.
- The --name/-n argument will be repurposed to specify the backup name. The --server-name/-s argument will be introduced to specify the server name in next breaking change release(2.86.0) scheduled for May 2026.

### `postgres flexible-server long-term-retention`

[Link to postgres flexible-server long-term-retention reference group](/cli/azure/postgres/flexible-server/long-term-retention)

- The --backup-name/-b argument has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.
- The --name/-n argument will be repurposed to specify the backup name. The --server-name/-s argument will be introduced to specify the server name in next breaking change release(2.86.0) scheduled for May 2026.

### `postgres flexible-server index-tuning`

[Link to postgres flexible-server index-tuning reference group](/cli/azure/postgres/flexible-server/index-tuning)

- Index tuning feature has now expanded its capabilities to support other automatically generated recommendations which are covered by the new command.

## netappfiles

### `netappfiles volume update`

[Link to netappfiles volume reference group](/cli/azure/netappfiles/volume)

- '--remote-volume-resource-id' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.

## resource

### `policy assignment identity assign`

[Link to policy assignment identity reference group](/cli/azure/policy/assignment/identity)

- Replacing an existing identity will change in a future release of the resource commands. It will require first removing the existing identity.

### `policy assignment identity remove`

[Link to policy assignment identity reference group](/cli/azure/policy/assignment/identity)

- Removing a user assigned identity will change in a future release of the resource commands. It will require providing the --mi-user-assigned switch.

### `policy assignment non-compliance-message create`

[Link to policy assignment non-compliance-message reference group](/cli/azure/policy/assignment/non-compliance-message)

- The return value will change in a future release of the resource commands. It will be the single created message object rather than the full array of message objects.
- The return value will change in a future release of the resource commands. It will be the single created message object rather than the full array of message objects.

### `policy assignment non-compliance-message delete`

[Link to policy assignment non-compliance-message reference group](/cli/azure/policy/assignment/non-compliance-message)

- The return value will change in a future release of the resource commands. It will be empty rather than the full array of remaining message objects.

### `policy set-definition delete`

[Link to policy set-definition reference group](/cli/azure/policy/set-definition)

- Behavior will change in a future release of the resource commands. Bypassing the confirmation prompt will require providing the -y switch.

### `policy exemption create`

[Link to policy exemption reference group](/cli/azure/policy/exemption)

- Date format will change slightly in a future release of the resource commands. New format is ISO-8601, e.g. 2025-08-05T00:45:13Z instead of 2025-08-05T00:45:13+00:00.

### `policy exemption update`

[Link to policy exemption reference group](/cli/azure/policy/exemption)

- Date format will change slightly in a future release of the resource commands. New format is ISO-8601, e.g. 2025-08-05T00:45:13Z instead of 2025-08-05T00:45:13+00:00.

### `policy definition delete`

[Link to policy definition reference group](/cli/azure/policy/definition)

- Behavior will change in a future release of the resource commands. Bypassing the confirmation prompt will require providing the -y switch.

## servicefabric

### `sf managed-application update`

[Link to sf managed-application reference group](/cli/azure/sf/managed-application)

- Options list has changed, run help command to see allowed options

## storage

### `storage account create`

[Link to storage account reference group](/cli/azure/storage/account)

- The --min-tls-version argument values TLS1_0 and TLS1_1 have been retired on 2026/02/03 and will be removed on 2026/03/03.

### `storage account update`

[Link to storage account reference group](/cli/azure/storage/account)

- The --min-tls-version argument values TLS1_0 and TLS1_1 have been retired on 2026/02/03 and will be removed on 2026/03/03.

## vm

### `vm create`

[Link to vm reference group](/cli/azure/vm)

- The default value of '--size' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.

### `vmss create`

[Link to vmss reference group](/cli/azure/vmss)

- The default value of '--vm-sku' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.

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

- 'az blueprint' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.
- Blueprints and associated commands will be deprecated
- as early as July 2026. Customers are encouraged to transition to
- Template Specs and Deployments Stacks to support their scenarios beyond that date.
- Migration documentation is available at
- https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/migrate-blueprint.

## azext_managednetworkfabric

### `networkfabric device upgrade`

[Link to networkfabric device reference group](/cli/azure/networkfabric/device)

- The argument '--version' will become required in 9.0.x.

### `networkfabric l3domain create`

[Link to networkfabric l3domain reference group](/cli/azure/networkfabric/l3domain)

- '--route-prefix-limit' has been deprecated and will be removed in 9.0.x.

### `networkfabric l3domain update`

[Link to networkfabric l3domain reference group](/cli/azure/networkfabric/l3domain)

- '--route-prefix-limit' has been deprecated and will be removed in 9.0.x.

## azext_neon

### `neon`

[Link to neon reference group](/cli/azure/neon)

- 'az neon' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.
- Deprecation Notice: The Neon Azure Native Integration is being deprecated and will
- reach end of life on January 31, 2026. Transfer your projects to a Neon managed organization
- today. Migration documentation is available at https://neon.com/docs/import/migrate-from-azure-native

## azext_netappfiles_preview

### `netappfiles volume update`

[Link to netappfiles volume reference group](/cli/azure/netappfiles/volume)

- '--remote-volume-resource-id' has been deprecated and will be removed in next breaking change release(2.86.0) scheduled for May 2026.

## azext_redisenterprise

### `redisenterprise create`

[Link to redisenterprise reference group](/cli/azure/redisenterprise)

- The argument '--public-network-access' will become required in next breaking change release(2.86.0) scheduled for May 2026.
- The default value of '--access-keys-auth' will be changed to 'Disabled' from 'Enabled' in next breaking change release(2.86.0) scheduled for May 2026.

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

## azext_storage_preview

### `storage account create`

[Link to storage account reference group](/cli/azure/storage/account)

- The --min-tls-version argument values TLS1_0 and TLS1_1 have been retired on 2026/02/03 and will be removed on 2026/03/03.

### `storage account update`

[Link to storage account reference group](/cli/azure/storage/account)

- The --min-tls-version argument values TLS1_0 and TLS1_1 have been retired on 2026/02/03 and will be removed on 2026/03/03.

> [!NOTE]
> This article provides information on upcoming breaking changes. For previously published breaking changes, see [Azure CLI release notes](./release-notes-azure-cli.md).
