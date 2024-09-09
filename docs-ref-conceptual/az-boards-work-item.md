---
title: Mockup of az boards work-item reference command
description: Learn the different authentication types for your Azure CLI login — sign in with Azure CLI automatically, locally, or interactively using the az login command.
ms.date: 09/02/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli
#customer intent: n/a
---

# az boards work-item

> [!NOTE]
> This reference is part of the **azure-devops** extension for the Azure CLI (version 2.30.0 or higher). The extension will automatically install the first time you run an az boards work-item command. [Learn more](./azure-cli-extensions-overview) about extensions.

Manage work items.

## Commands

|Name|Description|Type|Status|
|-|-|-|-|
|az boards work-item create | Create a work item | Extension | GA |
|as boards work-item delete | Delete a work item | Extension | GA|

## az boards work-item create

Create a work item

```azure-cli
az boards work-item create --title
                           --type
                           [--area]
                           [--assigned-to]
                           [--description]
                           [--detect {false, true}]
                           [--discussion]
                           [--fields]
                           [--iteration]
                           [--open]
                           [--org]
                           [--project]
                           [--reason]
```

### Required Parameters

`--title`
Title of the work item.

`--type`
Name of the work item type (e.g. Bug).

### Optional Parameters

`--area`
Area the work item is assigned to (e.g. Demos).

`--assigned-to`
Name of the person the work item is assigned-to (e.g. fabrikam).

`--description -d`
Description of the work item.

`--detect`
Automatically detect organization.

Accepted values: false, true

`--discussion`
Comment to add to a discussion in a work item.

`--fields -f`
Space separated "field=value" pairs for custom fields you would like to set. In case of multiple fields : "field1=value1" "field2=value2". Refer https://aka.ms/azure-devops-cli-field-api for more details on fields.

`--iteration`
Iteration path of the work item (e.g. Demos\Iteration 1).

`--open`
Open the work item in the default web browser.

Default value: False

`--org --organization`
Azure DevOps organization URL. You can configure the default organization using az devops configure -d organization=ORG_URL. Required if not configured as default or picked up via git config. Example: https://dev.azure.com/MyOrganizationName/.

`--project -p`
Name or ID of the project. You can configure the default project using az devops configure -d project=NAME_OR_ID. Required if not configured as default or picked up via git config.

`--reason`
Reason for the state of the work item.

### Learn

Use the following links to quickstarts, how-to guides, tutorials or samples to learn practical ways to implement `az boards work-item` in your environment.

- [Customize your pipeline](/azure/devops/pipelines/customize-pipeline)
- [Remove, delete, or restore work items in Azure Boards](/azure/devops/boards/backlogs/remove-delete-work-items)
- [Add and update a work item](/azure/devops/boards/backlogs/remove-delete-work-items)
- [View and add work items using the Work Items page](/azure/devops/boards/work-items/view-add-work-items)
- [Move work items from one team to another team](/azure/devops/boards/work-items/move-work-items)

## az boards work-item delete

Delete a work item

...