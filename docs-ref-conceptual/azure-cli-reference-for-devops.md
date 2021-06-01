---
title: Azure CLI references for Azure DevOps Services
description: Azure CLI reference landing page for Azure DevOps Services
author: dbradish-microsoft
manager: barbkess
ms.devlang: azurecli
ms.topic: reference
ms.date: 05/30/2021
ms.author: dbradish
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli
---

# Azure CLI for Azure DevOps

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services, including Azure DevOps Services, and gives you the ability to manage Azure DevOps Services from a command line.

## References for Azure DevOps Services

The [Azure DevOps](/azure/devops) CLI service is associated with the following Azure CLI reference groups. Except for Azure Functions, access to each of these reference groups requires the [azure-devops](https://github.com/Azure/azure-devops-cli-extension) extension:

- [Azure Artifacts](#azure-artifacts-references)
- [Azure Boards](#azure-boards-references)
- [Azure DevOps](#azure-devops-references)
- [Azure Functions (DevOps integration)](#azure-functions-devops-integration-references)
- [Azure Pipelines](#azure-pipelines-references)
- [Azure Repos](#azure-repos-references)

For the references in each subgroup, see the tables in the following sections.

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

### Azure Artifacts references

[Azure Artifacts](/cli/azure/artifacts) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az artifacts universal](/cli/azure/artifacts/universal) | Manage Universal Packages of Azure Artifacts. |  |

### Azure Boards references

[Azure Boards](/cli/azure/boards) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az boards](/cli/azure/boards) | Manage Azure Boards. |  |
| [az boards area project](/cli/azure/boards/area/project) | Manage areas for a project. |  |
| [az boards area team](/cli/azure/boards/area/team) | Manage areas for a team. |  |
| [az boards iteration project](/cli/azure/boards/iteration/project) | Manage iterations for a project. |  |
| [az boards iteration team](/cli/azure/boards/iteration/team) | Manage iterations for a team. |  |
| [az boards work-item](/cli/azure/boards/work-item) | Manage work items. |  |
| [az boards work-item relation](/cli/azure/boards/work-item/relation) | Manage work item relations. |  |

### Azure DevOps references

[Azure DevOps](/cli/azure/devops) has the following references:

#### Security references

| Reference | Description | More information |
|-|-|-|
| [az devops security group](/cli/azure/devops/security) | Manage security groups. |  |
| [az devops security group membership](/cli/azure/devops/security/group/membership) | Manage membership for security groups. |  |
| [az devops security permission](/cli/azure/devops/security/permission) | Manage security permissions. |  |
| [az devops security permission namespace](/cli/azure/devops/security/permission/namespace) | Manage security namespaces. |  |

#### Service endpoint references

| Reference | Description | More information |
|-|-|-|
| [az devops service-endpoint](/cli/azure/devops/service-endpoint) | Manage service endpoints and connections. |  |
| [az devops service-endpoint azurerm](/cli/azure/devops/service-endpoint/azurerm) | Manage Azure RM service endpoints/connections. |  |
[az devops service-endpoint github](/cli/azure/devops/service-endpoint/github) | Manage GitHub service endpoints/connections. |  |

#### Additional references

| Reference | Description | More information |
|-|-|-|
| [az devops](/cli/azure/devops) | Manage Azure DevOps. |  |
| [az devops admin banner](/cli/azure/devops/admin/banner) | Manage administration banner operations. |  |
| [az devops extension](/cli/azure/devops/extension) | Manage extensions. |  |
| [az devops project](/cli/azure/devops/project) | Manage team projects. |  |
[az devops team](/cli/azure/devops/team) | Manage teams. |  |
[az devops user](/cli/azure/devops/user) | Manage users. |  |
[az devops wiki](/cli/azure/devops/wiki) | Manage wikis. |  |
[az devops wiki page](/cli/azure/devops/wiki/page) | Manage wiki pages. |  |

### Azure Functions (DevOps integration) references

[Azure Functions ((DevOps integration))](/cli/azure/functionapp/devops-pipeline) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az functionapp devops-pipeline](/cli/azure/functionapp/devops-pipeline) | Manage Azure Function integration with Azure DevOps. | [Continuous delivery by using Azure DevOps](/azure/azure-functions/functions-how-to-azure-devops) |

### Azure Pipelines references

[Azure Pipelines](/cli/azure/pipelines) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az pipelines](/cli/azure/pipelines) | Manage Azure Pipelines. |  |
| [az pipelines agent](/cli/azure/pipelines/agent) | Manage agents. |  |
| [az pipelines build](/cli/azure/pipelines/build) | Manage builds. |  |
| [az pipelines build definition](/cli/azure/pipelines/build/definition) | Manage build definitions. |  |
| [az pipelines build tag](/cli/azure/pipelines/build/tag) | Manage build tags. |  |
| [az pipelines folder](/cli/azure/pipelines/folder) | Manage folders for organizing pipelines. |  |
| [az pipelines pool](/cli/azure/pipelines/pool) | Manage agent pools. |  |
| [az pipelines queue](/cli/azure/pipelines/queue) | Manage agent queues. |  |
| [az pipelines release](/cli/azure/pipelines/release) | Manage releases. |  |
| [az pipelines release definition](/cli/azure/pipelines/release/definition) | Manage release definitions. |  |
| [az pipelines runs](/cli/azure/pipelines/runs) | Manage pipeline runs. |  |
| [az pipelines runs artifact](/cli/azure/pipelines/runs/artifact) | Manage pipeline run artifacts. |  |
| [az pipelines runs tag](/cli/azure/pipelines/runs/tag) | Manage pipeline run tags. |  |
| [az pipelines variable](/cli/azure/pipelines/variable) | Manage variables. |  |
| [az pipelines variable-group](/cli/azure/pipelines/variable-group) | Manage variable groups. |  |
| [az pipelines variable-group variable](/cli/azure/pipelines/variable-group/variable) | Manage variables in a variable group. |  |

### Azure Repos references

[Azure Repos](/cli/azure/repos) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az repos](/cli/azure/repos) | Manage Azure Repos. |  |
| [az repos import](/cli/azure/repos/import) | Manage Git repositories import. |  |
| [az repos policy](/cli/azure/repos/policy) | Manage branch policy. |  |
| [az repos policy approver-count](/cli/azure/repos/policy/approver-count) | Manage approver count policy. |  |
| [az repos policy build](/cli/azure/repos/policy/build) | Manage build policy. |  |
| [az repos policy case-enforcement](/cli/azure/repos/policy/case-enforcement) | Manage case enforcement policy. |  |
| [az repos policy comment-required](/cli/azure/repos/policy/comment-required) | Manage comment required policy. |  |
| [az repos policy file-size](/cli/azure/repos/policy/file-size) | Manage file size policy. |  |
| [az repos policy merge-strategy](/cli/azure/repos/policy/merge-strategy) | Manage merge strategy policy. |  |
| [az repos policy required-reviewer](/cli/azure/repos/policy/required-reviewer) | Manage required reviewer policy. |  |
| [az repos policy work-item-linking](/cli/azure/repos/policy/work-item-linking) | Manage work item linking policy. |  |
| [az repos pr](/cli/azure/repos/pr) | Manage pull requests. |  |
| [az repos pr policy](/cli/azure/repos/pr/policy) | Manage pull request policies. |  |
| [az repos pr reviewer](/cli/azure/repos/pr/reviewer) | Manage pull request reviewers. |  |
| [az repos pr work-item](/cli/azure/repos/pr/work-item) | Manage work items associated with a pull request. |  |
| [az repos ref](/cli/azure/repos/ref) | Manage Git references. |  |

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.

- Learn more about extension references in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
