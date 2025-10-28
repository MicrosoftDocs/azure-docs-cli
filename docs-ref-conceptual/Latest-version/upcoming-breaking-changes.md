---
title: Azure CLI upcoming breaking changes | Microsoft Docs
description: Learn about upcoming breaking changes to Azure CLI command groups, references, and parameters.
ms.date: 10/28/2025
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
# customer intent: As an Azure CLI developer, I need to be aware of upcoming breaking changes so I can plan for migration to new reference commands.
---

# Upcoming breaking changes in Azure CLI

The breaking changes listed in this section are planned for the next major release of the Azure CLI unless otherwise noted. Per our [Support lifecycle](./azure-cli-support-lifecycle.md), breaking changes in Azure Core CLI reference groups occur twice a year.

## acr

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

## acs

### `aks create`

[Link to aks reference group](/cli/azure/aks)

- Default SSH key behavior will change. When no SSH key parameters are provided, the command will behave as if '--no-ssh-key' was passed instead of failing in next breaking change release(2.80.0) scheduled for Nov 2025.

## batch

### `batch pool create`

[Link to batch pool reference group](/cli/azure/batch/pool)

- '--target-communication' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--resource-tags' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

### `batch pool list`

[Link to batch pool reference group](/cli/azure/batch/pool)

- The output will be changed in next breaking change release(2.80.0) scheduled for Nov 2025. Remove output fields `targetNodeCommunicationMode`, `currentNodeCommunicationMode`, and `resourceTags`.

### `batch pool show`

[Link to batch pool reference group](/cli/azure/batch/pool)

- The output will be changed in next breaking change release(2.80.0) scheduled for Nov 2025. Remove output fields `targetNodeCommunicationMode`, `currentNodeCommunicationMode`, and `resourceTags`.

### `batch pool set`

[Link to batch pool reference group](/cli/azure/batch/pool)

- '--target-communication' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

### `batch pool reset`

[Link to batch pool reference group](/cli/azure/batch/pool)

- '--target-communication' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

## compute_recommender

### `compute-recommender spot-placement-recommender`

[Link to compute-recommender reference group](/cli/azure/compute-recommender)

- 'compute-recommender spot-placement-recommender' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025. Use 'az compute-recommender spot-placement-score' instead.

## dms

### `dms project create`

[Link to dms project reference group](/cli/azure/dms/project)

- 'location' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

## netappfiles

### `netappfiles volume create`

[Link to netappfiles volume reference group](/cli/azure/netappfiles/volume)

- '--endpoint-type' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

### `netappfiles volume update`

[Link to netappfiles volume reference group](/cli/azure/netappfiles/volume)

- '--endpoint-type' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

## rdbms

### `postgres flexible-server create`

[Link to postgres flexible-server reference group](/cli/azure/postgres/flexible-server)

- Update default value of "--version" in next breaking change release(2.80.0) scheduled for Nov 2025. The default value will be changed from "17" to a supported version based on regional capabilities.
- Please use command group "postgres flexible-server db" for database creation.
- Please use command group "postgres flexible-server db" for database creation.

### `postgres server`

[Link to postgres server reference group](/cli/azure/postgres/server)

- Azure Database for PostgreSQL Single Server is deprecated. Please migrate to Flexible Server for new deployments.

### `postgres server-logs`

[Link to postgres server-logs reference group](/cli/azure/postgres/server-logs)

- Azure Database for PostgreSQL Single Server is deprecated. Please migrate to Flexible Server for new deployments.

### `postgres db`

[Link to postgres db reference group](/cli/azure/postgres/db)

- Azure Database for PostgreSQL Single Server is deprecated. Please migrate to Flexible Server for new deployments.

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

### `sf application update`

[Link to sf application reference group](/cli/azure/sf/application)

- '--service-type-policy' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--upgrade-replica-set-check-timeout' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--max-porcent-unhealthy-partitions' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--max-porcent-unhealthy-replicas' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--max-porcent-unhealthy-services' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--max-porcent-unhealthy-apps' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

### `sf managed-application-type version update`

[Link to sf managed-application-type version reference group](/cli/azure/sf/managed-application-type/version)

- The argument '--package-url' will become required in next breaking change release(2.80.0) scheduled for Nov 2025.

### `sf managed-application update`

[Link to sf managed-application reference group](/cli/azure/sf/managed-application)

- '--service-type-policy' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--upgrade-replica-set-check-timeout' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--instance-close-duration' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--consider-warning-as-error' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--max-percent-unhealthy-partitions' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--max-percent-unhealthy-replicas' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--max-percent-unhealthy-services' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--max-percent-unhealthy-deployed-applications' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

## vm

### `vm create`

[Link to vm reference group](/cli/azure/vm)

- The default value of '--size' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.

### `vmss create`

[Link to vmss reference group](/cli/azure/vmss)

- The default value of '--vm-sku' will be changed to 'Standard_D2s_v5' from 'Standard_DS1_v2' in a future release.

## azext_aks_preview

### `aks create`

[Link to aks reference group](/cli/azure/aks)

- Default SSH key behavior will change. When no SSH key parameters are provided, the command will behave as if '--no-ssh-key' was passed instead of failing in next breaking change release(2.80.0) scheduled for Nov 2025.

## azext_blueprint

### `blueprint`

[Link to blueprint reference group](/cli/azure/blueprint)

- 'az blueprint' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- Blueprints and associated commands will be deprecated
- as early as July 2026. Customers are encouraged to transition to
- Template Specs and Deployments Stacks to support their scenarios beyond that date.
- Migration documentation is available at
- https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/migrate-blueprint.

## azext_connectedk8s

### `connectedk8s enable-features`

[Link to connectedk8s reference group](/cli/azure/connectedk8s)

- '--app-id' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.
- '--app-secret' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

## azext_dms

### `dms project create`

[Link to dms project reference group](/cli/azure/dms/project)

- 'location' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

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

## azext_netappfiles_preview

### `netappfiles volume create`

[Link to netappfiles volume reference group](/cli/azure/netappfiles/volume)

- '--endpoint-type' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

### `netappfiles volume update`

[Link to netappfiles volume reference group](/cli/azure/netappfiles/volume)

- '--endpoint-type' has been deprecated and will be removed in next breaking change release(2.80.0) scheduled for Nov 2025.

## azext_redisenterprise

### `redisenterprise create`

[Link to redisenterprise reference group](/cli/azure/redisenterprise)

- The argument '--public-network-access' will become required in next breaking change release(2.80.0) scheduled for Nov 2025.
- The default value of '--access-keys-auth' will be changed to 'Disabled' from 'Enabled' in next breaking change release(2.80.0) scheduled for Nov 2025.

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

> [!NOTE]
> This article provides information on upcoming breaking changes. For previously published breaking changes, see [Azure CLI release notes](./release-notes-azure-cli.md).
