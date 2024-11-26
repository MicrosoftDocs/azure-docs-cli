---
title: Azure CLI upcoming breaking changes | Microsoft Docs
description: Learn about upcoming breaking changes to Azure CLI command groups, references, and parameters.
ms.date: 10/30/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: As an Azure CLI developer, I need to be aware of upcoming breaking changes so I can plan for migration to new reference commands.
---

# Upcoming breaking changes in Azure CLI

The breaking changes listed in this article are planned for the next major release of the Azure CLI unless otherwise noted. Per our [Support lifecycle](./azure-cli-support-lifecycle.md), breaking changes in Azure CLI Core reference groups occur twice a year.

## acr helm

* In November 2020, Helm 2 reached end of life. Starting on March 30th, 2025 Azure Container Registry will no longer support Helm 2. Therefore, the legacy "Helm repositories" functionality will also be retired. **We recommend that you transition to Helm 3 immediately.**
* Starting January 21st, 2025 the CLI command [az acr helm push](/cli/azure/acr/helm/#az_acr_helm_push) will be retired to prevent pushing new Helm charts to legacy Helm repositories.
* Starting March 30th, 2025 the CLI command group [az acr helm](/cli/azure/acr/helm) will be retired, ending all legacy Helm repository capabilities in Azure Container Registry.
* All Helm charts not stored as an OCI artifact will be deleted from Azure Container Registry on March 30th, 2025.
* Learn how to find all Helm charts stored in a Helm repository here: [az acr helm list](/cli/azure/acr/helm/#az_acr_helm_list). If the Helm chart you are using is listed then it is stored in a legacy Helm repository and is at risk of deletion.

For more information on managing and deploying applications for Kubernetes, see [Push and pull Helm charts to an Azure container registry](/azure/container-registry/container-registry-helm-repos).

> [!NOTE]
> This article provides information on upcoming breaking changes. For previously published breaking changes, see [Azure CLI release notes](./release-notes-azure-cli.md).
