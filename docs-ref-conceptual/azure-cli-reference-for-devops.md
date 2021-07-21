---
title: Azure CLI references for Azure DevOps
description: Azure CLI reference landing page for Azure DevOps
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

The Azure Command Line Interface ([Azure CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services, including Azure DevOps, and gives you the ability to manage Azure DevOps from a command line.

The [Azure DevOps](/azure/devops) CLI experience is associated with the following Azure CLI reference groups. Except for Azure Functions, access to each of these reference groups requires the [azure-devops](https://github.com/Azure/azure-devops-cli-extension) extension:

- [Azure Artifacts](#azure-artifacts)
- [Azure Boards](#azure-boards)
- [Azure DevOps Organizations](#azure-devops-organizations)
- [Azure Functions (DevOps integration)](#azure-functions-devops-integration)
- [Azure Pipelines](#azure-pipelines)
- [Azure Repos](#azure-repos)

For the references in each subgroup, see the tables in the following sections.

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

## Azure Artifacts

[Azure Artifacts](/cli/azure/artifacts) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az artifacts universal](/cli/azure/artifacts/universal) | Manage Universal Packages of Azure Artifacts. | [Publish and download Universal Packages](/azure/devops/artifacts/quickstarts/universal-packages) |

## Azure Boards

[Azure Boards](/cli/azure/boards) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az boards](/cli/azure/boards) | Manage Azure Boards. | [What is Azure Boards?](/azure/devops/boards/get-started/what-is-azure-boards) |
| [az boards area project](/cli/azure/boards/area/project) | Manage areas for a project. | [Define area paths and assign to a team](/azure/devops/organizations/settings/set-area-paths?tabs=azure-devops-cli) |
| [az boards area team](/cli/azure/boards/area/team) | Manage areas for a team. | [Define area paths and assign to a team](/azure/devops/organizations/settings/set-area-paths?tabs=azure-devops-cli) |
| [az boards iteration project](/cli/azure/boards/iteration/project) | Manage iterations for a project. | [Define iteration paths (sprints) and configure team iterations](/azure/devops/organizations/settings/set-iteration-paths-sprints?tabs=azure-devops-cli) |
| [az boards iteration team](/cli/azure/boards/iteration/team) | Manage iterations for a team. | [Define iteration paths (sprints) and configure team iterations](/azure/devops/organizations/settings/set-iteration-paths-sprints?tabs=azure-devops-cli) |
| [az boards work-item](/cli/azure/boards/work-item) | Manage work items. | [View and add work items](/azure/devops/boards/work-items/view-add-work-items?tabs=azure-devops-cli) |
| [az boards work-item relation](/cli/azure/boards/work-item/relation) | Manage work item relations. | [Linking, traceability, and managing dependencies](/azure/devops/boards/queries/link-work-items-support-traceability) |

## Azure DevOps Organizations

[Azure DevOps](/cli/azure/devops) has the following references:

### Security

| Reference | Description | More information |
|-|-|-|
| [az devops security group](/cli/azure/devops/security) | Manage security groups. | [Get started with permissions, access, and security groups](/azure/devops/organizations/security/about-permissions) |
| [az devops security group membership](/cli/azure/devops/security/group/membership) | Manage membership for security groups. | [Add users and manage access in Azure DevOps](/azure/devops/organizations/accounts/add-organization-users?tabs=azure-devops-cli) |
| [az devops security permission](/cli/azure/devops/security/permission) | Manage security permissions. | [Get started with permissions, access, and security groups](/azure/devops/organizations/security/about-permissions) |
| [az devops security permission namespace](/cli/azure/devops/security/permission/namespace) | Manage security namespaces. | [Security namespace and permission reference](/azure/devops/organizations/security/namespace-reference) |

### Service endpoint

| Reference | Description | More information |
|-|-|-|
| [az devops service-endpoint](/cli/azure/devops/service-endpoint) | Manage service endpoints and connections. | [Create a service endpoint](/azure/devops/extend/develop/service-endpoints) |
| [az devops service-endpoint azurerm](/cli/azure/devops/service-endpoint/azurerm) | Manage Azure Resource Manager service endpoints and connections. | [Service connections](/azure/devops/pipelines/library/service-endpoints) |
[az devops service-endpoint github](/cli/azure/devops/service-endpoint/github) | Manage GitHub service endpoints and connections. | [Service connections](/azure/devops/pipelines/library/service-endpoints) |

### Additional DevOps references

| Reference | Description | More information |
|-|-|-|
| [az devops](/cli/azure/devops) | Manage Azure DevOps. | [What is Azure DevOps?](/azure/devops/user-guide/what-is-azure-devops) |
| [az devops admin banner](/cli/azure/devops/admin/banner) | Manage administration banner operations. | [Add and manage information banners](/azure/devops/organizations/settings/manage-banners) |
| [az devops extension](/cli/azure/devops/extension) | Manage extensions. | [Uninstall or disable extensions](/azure/devops/marketplace/uninstall-disable-extensions?tabs=azure-devops-cli) |
| [az devops project](/cli/azure/devops/project) | Manage team projects. | [Create a project in Azure DevOps](/azure/devops/organizations/projects/create-project?tabs=azure-devops-cli) |
[az devops team](/cli/azure/devops/team) | Manage teams. | [Add a team](/azure/devops/organizations/settings/add-teams?tabs=azure-devops-cli) |
[az devops user](/cli/azure/devops/user) | Manage users. | [Add users and manage access in Azure DevOps](/azure/devops/organizations/accounts/add-organization-users?tabs=azure-devops-cli) |
[az devops wiki](/cli/azure/devops/wiki) | Manage wikis. | [Manage wikis with the CLI](/azure/devops/project/wiki/manage-wikis) |
[az devops wiki page](/cli/azure/devops/wiki/page) | Manage wiki pages. | [Add and edit wiki pages](/azure/devops/project/wiki/add-edit-wiki?tabs=azure-devops-cli) |

## Azure Functions (DevOps integration)

[Azure Functions (DevOps integration)](/cli/azure/functionapp/devops-pipeline) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az functionapp devops-pipeline](/cli/azure/functionapp/devops-pipeline) | Manage Azure Function integration with Azure DevOps. | [Continuous delivery by using Azure DevOps](/azure/azure-functions/functions-how-to-azure-devops) |

## Azure Pipelines

[Azure Pipelines](/cli/azure/pipelines) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az pipelines](/cli/azure/pipelines) | Manage Azure Pipelines. | [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?tabs=azure-cli) |
| [az pipelines agent](/cli/azure/pipelines/agent) | Manage agents. | [Azure Pipelines agents](/azure/devops/pipelines/agents/agents?tabs=azure-devops-cli) |
| [az pipelines build](/cli/azure/pipelines/build) | Manage builds. | [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?tabs=azure-devops-cli) |
| [az pipelines build definition](/cli/azure/pipelines/build/definition) | Manage build definitions. | [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?tabs=azure-devops-cli) |
| [az pipelines build tag](/cli/azure/pipelines/build/tag) | Manage build tags. | [Use predefined variables](/azure/devops/pipelines/build/variables) |
| [az pipelines folder](/cli/azure/pipelines/folder) | Manage folders for organizing pipelines. | [Customize your pipeline](/azure/devops/pipelines/customize-pipeline) |
| [az pipelines pool](/cli/azure/pipelines/pool) | Manage agent pools. | [Agent pools](/azure/devops/pipelines/agents/pools-queues?tabs=yaml%2Cazure-devops-cli) |
| [az pipelines queue](/cli/azure/pipelines/queue) | Manage agent queues. | [Agent pools](/azure/devops/pipelines/agents/pools-queues?tabs=yaml%2Cazure-devops-cli) |
| [az pipelines release](/cli/azure/pipelines/release) | Manage releases. | [Releases in Azure Pipelines](/azure/devops/pipelines/release/releases) |
| [az pipelines release definition](/cli/azure/pipelines/release/definition) | Manage release definitions. | [Releases in Azure Pipelines](/azure/devops/pipelines/release/releases) |
| [az pipelines runs](/cli/azure/pipelines/runs) | Manage pipeline runs. | [Pipeline run sequence](/azure/devops/pipelines/process/runs) |
| [az pipelines runs artifact](/cli/azure/pipelines/runs/artifact) | Manage pipeline run artifacts. | [Publish and download artifacts in Azure Pipelines](/azure/devops/pipelines/artifacts/pipeline-artifacts?tabs=azure-cli) |
| [az pipelines runs tag](/cli/azure/pipelines/runs/tag) | Manage pipeline run tags. | [Add tag to pipeline run](/azure/devops/pipelines/process/runs#add-tag-to-pipeline-run) |
| [az pipelines variable](/cli/azure/pipelines/variable) | Manage variables. | [Define variables](/azure/devops/pipelines/process/variables?tabs=azure-devops-cli) |
| [az pipelines variable-group](/cli/azure/pipelines/variable-group) | Manage variable groups. | [Add and use variable groups](/azure/devops/pipelines/library/variable-groups?tabs=azure-devops-cli) |
| [az pipelines variable-group variable](/cli/azure/pipelines/variable-group/variable) | Manage variables in a variable group. | [Manage variables in a variable group](/azure/devops/pipelines/library/variable-groups?tabs=azure-devops-cli#manage-variables-in-a-variable-group) |

## Azure Repos

[Azure Repos](/cli/azure/repos) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az repos](/cli/azure/repos) | Manage Azure Repos. | [Get started with Git from the command line](/azure/devops/repos/git/share-your-code-in-git-cmdline) |
| [az repos import](/cli/azure/repos/import) | Manage Git repositories import. | [Import a Git repo](/azure/devops/repos/git/import-git-repository) |
| [az repos policy](/cli/azure/repos/policy) | Manage branch policies. | [Git repository settings and policies](/azure/devops/repos/git/repository-settings?tabs=azure-devops-cli) |
| [az repos policy approver-count](/cli/azure/repos/policy/approver-count) | Manage approver count policy. | [Branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos policy build](/cli/azure/repos/policy/build) | Manage build policies. | [Build validation](/azure/devops/repos/git/branch-policies#build-validation) |
| [az repos policy case-enforcement](/cli/azure/repos/policy/case-enforcement) | Manage case-enforcement policy. | [Git repository settings and policies](/azure/devops/repos/git/repository-settings?tabs=azure-devops-cli) |
| [az repos policy comment-required](/cli/azure/repos/policy/comment-required) | Manage comment-required policy. | [Create, view, and manage pull requests](/azure/devops/repos/git/pull-requests) |
| [az repos policy file-size](/cli/azure/repos/policy/file-size) | Manage file size policies. | [Git repository settings and policies](/azure/devops/repos/git/repository-settings?tabs=azure-devops-cli) |
| [az repos policy merge-strategy](/cli/azure/repos/policy/merge-strategy) | Manage merge strategy policy. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos policy required-reviewer](/cli/azure/repos/policy/required-reviewer) | Manage required reviewer policies. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos policy work-item-linking](/cli/azure/repos/policy/work-item-linking) | Manage work item linking policy. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos pr](/cli/azure/repos/pr) | Manage pull requests. | [Create, view, and manage pull requests](/azure/devops/repos/git/pull-requests) |
| [az repos pr policy](/cli/azure/repos/pr/policy) | Manage pull request policies. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos pr reviewer](/cli/azure/repos/pr/reviewer) | Manage pull request reviewers. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos pr work-item](/cli/azure/repos/pr/work-item) | Manage work items associated with a pull request. | [Create, view, and manage pull requests](/azure/devops/repos/git/pull-requests) |
| [az repos ref](/cli/azure/repos/ref) | Manage Git references. | [Manage branches](/azure/devops/repos/git/manage-your-branches) |

## See also

- [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.

- Discover additional [references](/cli/azure/reference-index) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.

- Learn more about extension references in [Use extensions with Azure CLI](./azure-cli-extensions-overview.md).
