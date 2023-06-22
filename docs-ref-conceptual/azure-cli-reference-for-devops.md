---
title: Azure CLI references for Azure DevOps | Microsoft Docs
description: Find Azure CLI core and extension reference commands to manage Azure DevOps.  Follow links to popular articles to learn how to use the Azure CLI for Azure DevOps.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.tool: azure-cli
ms.topic: reference
ms.date: 06/19/2023
ms.service: azure-cli
ms.reviewer: robb
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli references, azure devops
---

# Azure CLI reference commands for Azure DevOps

The Azure Command-Line Interface ([CLI](./what-is-azure-cli.md)) is a set of commands used to create and manage Azure resources. It's available across many Azure services and gives you the ability to manage Azure DevOps from a command-line.  

The Azure CLI commands for [Azure DevOps](/azure/devops) allow you to streamline tasks bypassing user interface workflows.  They are associated with the following Azure CLI reference groups. Except for Azure Functions, use of each of these reference groups requires the [azure-devops](https://github.com/Azure/azure-devops-cli-extension) extension:

- [Azure Artifacts](#azure-artifact-references)
- [Azure Boards](#azure-board-references) 
- [Azure DevOps Organizations](#azure-devops-organization-references) 
- [Azure Functions (DevOps integration)](#azure-function-devops-integration-references) 
- [Azure Pipelines](#azure-pipeline-references) 
- [Azure Repos](#azure-repo-references) 

> [!NOTE]
> You're prompted to install an extension reference on first use. Or, you can use the [az extension add](/cli/azure/extension#az_extension_add) command to manually install an extension by name.

## Azure Artifact references

[Azure Artifacts](../latest/docs-ref-autogen/artifacts.yml) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az artifacts universal](../latest/docs-ref-autogen/artifacts/universal.yml) | Manage Universal Packages of Azure Artifacts. | [Publish and download Universal Packages](/azure/devops/artifacts/quickstarts/universal-packages) |

## Azure Board references

[Azure Boards](../latest/docs-ref-autogen/boards.yml) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az boards](../latest/docs-ref-autogen/boards.yml) | Manage Azure Boards. | [What is Azure Boards?](/azure/devops/boards/get-started/what-is-azure-boards) |
| [az boards area project](../latest/docs-ref-autogen/boards/area/project.yml) | Manage areas for a project. | [Define area paths and assign to a team](/azure/devops/organizations/settings/set-area-paths?tabs=azure-devops-cli) |
| [az boards area team](../latest/docs-ref-autogen/boards/area/team.yml) | Manage areas for a team. | [Define area paths and assign to a team](/azure/devops/organizations/settings/set-area-paths?tabs=azure-devops-cli) |
| [az boards iteration project](../latest/docs-ref-autogen/boards/iteration/project.yml) | Manage iterations for a project. | [Define iteration paths (sprints) and configure team iterations](/azure/devops/organizations/settings/set-iteration-paths-sprints?tabs=azure-devops-cli) |
| [az boards iteration team](../latest/docs-ref-autogen/boards/iteration/team.yml) | Manage iterations for a team. | [Define iteration paths (sprints) and configure team iterations](/azure/devops/organizations/settings/set-iteration-paths-sprints?tabs=azure-devops-cli) |
| [az boards work-item](../latest/docs-ref-autogen/boards/work-item.yml) | Manage work items. | [View and add work items](/azure/devops/boards/work-items/view-add-work-items?tabs=azure-devops-cli) |
| [az boards work-item relation](../latest/docs-ref-autogen/boards/work-item/relation.yml) | Manage work item relations. | [Linking, traceability, and managing dependencies](/azure/devops/boards/queries/link-work-items-support-traceability) |

## Azure DevOps Organization references

[Azure DevOps](../latest/docs-ref-autogen/devops.yml) has the following references:

### Security references

| Reference | Description | More information |
|-|-|-|
| [az devops security group](../latest/docs-ref-autogen/devops/security.yml) | Manage security groups. | [Get started with permissions, access, and security groups](/azure/devops/organizations/security/about-permissions) |
| [az devops security group membership](../latest/docs-ref-autogen/devops/security/group/membership.yml) | Manage membership for security groups. | [Add users and manage access in Azure DevOps](/azure/devops/organizations/accounts/add-organization-users?tabs=azure-devops-cli) |
| [az devops security permission](../latest/docs-ref-autogen/devops/security/permission.yml) | Manage security permissions. | [Get started with permissions, access, and security groups](/azure/devops/organizations/security/about-permissions) |
| [az devops security permission namespace](../latest/docs-ref-autogen/devops/security/permission/namespace.yml) | Manage security namespaces. | [Security namespace and permission reference](/azure/devops/organizations/security/namespace-reference) |

### Service endpoint references

| Reference | Description | More information |
|-|-|-|
| [az devops service-endpoint](../latest/docs-ref-autogen/devops/service-endpoint.yml) | Manage service endpoints and connections. | [Create a service endpoint](/azure/devops/extend/develop/service-endpoints) |
| [az devops service-endpoint azurerm](../latest/docs-ref-autogen/devops/service-endpoint/azurerm.yml) | Manage Azure Resource Manager service endpoints and connections. | [Service connections](/azure/devops/pipelines/library/service-endpoints) |
| [az devops service-endpoint github](../latest/docs-ref-autogen/devops/service-endpoint/github.yml) | Manage GitHub service endpoints and connections. | [Service connections](/azure/devops/pipelines/library/service-endpoints) |

### Additional DevOps organization references

| Reference | Description | More information |
|-|-|-|
| [az devops](../latest/docs-ref-autogen/devops.yml) | Manage Azure DevOps. | [What is Azure DevOps?](/azure/devops/user-guide/what-is-azure-devops) |
| [az devops admin banner](../latest/docs-ref-autogen/devops/admin/banner.yml) | Manage administration banner operations. | [Add and manage information banners](/azure/devops/organizations/settings/manage-banners) |
| [az devops extension](../latest/docs-ref-autogen/devops/extension.yml) | Manage extensions. | [Uninstall or disable extensions](/azure/devops/marketplace/uninstall-disable-extensions?tabs=azure-devops-cli) |
| [az devops project](../latest/docs-ref-autogen/devops/project.yml) | Manage team projects. | [Create a project in Azure DevOps](/azure/devops/organizations/projects/create-project?tabs=azure-devops-cli) |
| [az devops team](../latest/docs-ref-autogen/devops/team.yml) | Manage teams. | [Add a team](/azure/devops/organizations/settings/add-teams?tabs=azure-devops-cli) |
| [az devops user](../latest/docs-ref-autogen/devops/user.yml) | Manage users. | [Add users and manage access in Azure DevOps](/azure/devops/organizations/accounts/add-organization-users?tabs=azure-devops-cli) |
| [az devops wiki](../latest/docs-ref-autogen/devops/wiki.yml) | Manage wikis. | [Manage wikis with the CLI](/azure/devops/project/wiki/manage-wikis) |
| [az devops wiki page](../latest/docs-ref-autogen/devops/wiki/page.yml) | Manage wiki pages. | [Add and edit wiki pages](/azure/devops/project/wiki/add-edit-wiki?tabs=azure-devops-cli) |

## Azure Function (DevOps integration) references

[Azure Functions (DevOps integration)](../latest/docs-ref-autogen/functionapp/devops-pipeline.yml) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az functionapp devops-pipeline](../latest/docs-ref-autogen/functionapp/devops-pipeline.yml) | Manage Azure Function integration with Azure DevOps. | [Continuous delivery by using Azure DevOps](/azure/azure-functions/functions-how-to-azure-devops) |

## Azure Pipeline references

[Azure Pipelines](../latest/docs-ref-autogen/pipelines.yml) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az pipelines](../latest/docs-ref-autogen/pipelines.yml) | Manage Azure Pipelines. | [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?tabs=azure-cli) |
| [az pipelines agent](../latest/docs-ref-autogen/pipelines/agent.yml) | Manage agents. | [Azure Pipelines agents](/azure/devops/pipelines/agents/agents?tabs=azure-devops-cli) |
| [az pipelines build](../latest/docs-ref-autogen/pipelines/build.yml) | Manage builds. | [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?tabs=azure-devops-cli) |
| [az pipelines build definition](../latest/docs-ref-autogen/pipelines/build/definition.yml) | Manage build definitions. | [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline?tabs=azure-devops-cli) |
| [az pipelines build tag](../latest/docs-ref-autogen/pipelines/build/tag.yml) | Manage build tags. | [Use predefined variables](/azure/devops/pipelines/build/variables) |
| [az pipelines folder](../latest/docs-ref-autogen/pipelines/folder.yml) | Manage folders for organizing pipelines. | [Customize your pipeline](/azure/devops/pipelines/customize-pipeline) |
| [az pipelines pool](../latest/docs-ref-autogen/pipelines/pool.yml) | Manage agent pools. | [Agent pools](/azure/devops/pipelines/agents/pools-queues?tabs=yaml%2Cazure-devops-cli) |
| [az pipelines queue](../latest/docs-ref-autogen/pipelines/queue.yml) | Manage agent queues. | [Agent pools](/azure/devops/pipelines/agents/pools-queues?tabs=yaml%2Cazure-devops-cli) |
| [az pipelines release](../latest/docs-ref-autogen/pipelines/release.yml) | Manage releases. | [Releases in Azure Pipelines](/azure/devops/pipelines/release/releases) |
| [az pipelines release definition](../latest/docs-ref-autogen/pipelines/release/definition.yml) | Manage release definitions. | [Releases in Azure Pipelines](/azure/devops/pipelines/release/releases) |
| [az pipelines runs](../latest/docs-ref-autogen/pipelines/runs.yml) | Manage pipeline runs. | [Pipeline run sequence](/azure/devops/pipelines/process/runs) |
| [az pipelines runs artifact](../latest/docs-ref-autogen/pipelines/runs/artifact.yml) | Manage pipeline run artifacts. | [Publish and download artifacts in Azure Pipelines](/azure/devops/pipelines/artifacts/pipeline-artifacts?tabs=azure-cli) |
| [az pipelines runs tag](../latest/docs-ref-autogen/pipelines/runs/tag.yml) | Manage pipeline run tags. | [Add tag to pipeline run](/azure/devops/pipelines/process/runs#add-tag-to-pipeline-run) |
| [az pipelines variable](../latest/docs-ref-autogen/pipelines/variable.yml) | Manage variables. | [Define variables](/azure/devops/pipelines/process/variables?tabs=azure-devops-cli) |
| [az pipelines variable-group](../latest/docs-ref-autogen/pipelines/variable-group.yml) | Manage variable groups. | [Add and use variable groups](/azure/devops/pipelines/library/variable-groups?tabs=azure-devops-cli) |
| [az pipelines variable-group variable](../latest/docs-ref-autogen/pipelines/variable-group/variable.yml) | Manage variables in a variable group. | [Manage variables in a variable group](/azure/devops/pipelines/library/variable-groups?tabs=azure-devops-cli#manage-variables-in-a-variable-group) |

## Azure Repo references

[Azure Repos](../latest/docs-ref-autogen/repos.yml) has the following references:

| Reference | Description | More information |
|-|-|-|
| [az repos](../latest/docs-ref-autogen/repos.yml) | Manage Azure Repos. | [Get started with Git from the command line](/azure/devops/repos/git/share-your-code-in-git-cmdline) |
| [az repos import](../latest/docs-ref-autogen/repos/import.yml) | Manage Git repositories import. | [Import a Git repo](/azure/devops/repos/git/import-git-repository) |
| [az repos policy](../latest/docs-ref-autogen/repos/policy.yml) | Manage branch policies. | [Git repository settings and policies](/azure/devops/repos/git/repository-settings?tabs=azure-devops-cli) |
| [az repos policy approver-count](../latest/docs-ref-autogen/repos/policy/approver-count.yml) | Manage approver count policy. | [Branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos policy build](../latest/docs-ref-autogen/repos/policy/build.yml) | Manage build policies. | [Build validation](/azure/devops/repos/git/branch-policies#build-validation) |
| [az repos policy case-enforcement](../latest/docs-ref-autogen/repos/policy/case-enforcement.yml) | Manage case-enforcement policy. | [Git repository settings and policies](/azure/devops/repos/git/repository-settings?tabs=azure-devops-cli) |
| [az repos policy comment-required](../latest/docs-ref-autogen/repos/policy/comment-required.yml) | Manage comment-required policy. | [Create, view, and manage pull requests](/azure/devops/repos/git/pull-requests) |
| [az repos policy file-size](../latest/docs-ref-autogen/repos/policy/file-size.yml) | Manage file size policies. | [Git repository settings and policies](/azure/devops/repos/git/repository-settings?tabs=azure-devops-cli) |
| [az repos policy merge-strategy](../latest/docs-ref-autogen/repos/policy/merge-strategy.yml) | Manage merge strategy policy. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos policy required-reviewer](../latest/docs-ref-autogen/repos/policy/required-reviewer.yml) | Manage required reviewer policies. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos policy work-item-linking](../latest/docs-ref-autogen/repos/policy/work-item-linking.yml) | Manage work item linking policy. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos pr](../latest/docs-ref-autogen/repos/pr.yml) | Manage pull requests. | [Create, view, and manage pull requests](/azure/devops/repos/git/pull-requests) |
| [az repos pr policy](../latest/docs-ref-autogen/repos/pr/policy.yml) | Manage pull request policies. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos pr reviewer](../latest/docs-ref-autogen/repos/pr/reviewer.yml) | Manage pull request reviewers. | [Improve code quality with branch policies](/azure/devops/repos/git/branch-policies) |
| [az repos pr work-item](../latest/docs-ref-autogen/repos/pr/work-item.yml) | Manage work items associated with a pull request. | [Create, view, and manage pull requests](/azure/devops/repos/git/pull-requests) |
| [az repos ref](../latest/docs-ref-autogen/repos/ref.yml) | Manage Git references. | [Manage branches](/azure/devops/repos/git/manage-your-branches) |

## See also

* [Get started with Azure CLI](./get-started-with-azure-cli.md) to learn about installation and sign in.
* Discover additional [reference commands](../latest/docs-ref-autogen/reference-index.yml) and [available extensions](./azure-cli-extensions-list.md) in the Azure CLI documentation.
* [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md)
