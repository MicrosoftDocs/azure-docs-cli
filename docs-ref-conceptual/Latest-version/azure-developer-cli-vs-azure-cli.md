---
title: Azure CLI vs Azure Developer CLI - differences and when to use each
description: Learn the differences between Azure CLI (az) and Azure Developer CLI (azd), including their purpose, capabilities, and when to use each tool for your Azure workflow.
ms.service: azure-cli
ms.custom: devx-track-azurecli
ms.topic: concept-article
keywords: azure cli vs azure developer cli, az vs azd, azure cli comparison, azure developer cli vs azure cli, azd cli
---

# Azure CLI vs Azure Developer CLI

Azure CLI (`az`) and Azure Developer CLI (`azd`) are both command-line tools for working with Azure, but they serve different purposes. This article explains the differences and helps you choose the right tool for your workflow.

## Overview

| Feature | Azure CLI (`az`) | Azure Developer CLI (`azd`) |
|---------|-----------------|----------------------------|
| **Primary purpose** | Manage Azure resources | Streamline developer workflows |
| **Audience** | IT admins, DevOps, developers | Application developers |
| **Scope** | Individual resource management | End-to-end app deployment |
| **Command prefix** | `az` | `azd` |
| **Install package** | `azure-cli` | `azure-dev` |

## Azure CLI (`az`)

Azure CLI is a cross-platform tool for managing Azure resources. It provides direct access to Azure Resource Manager operations, enabling you to create, configure, and manage individual Azure services.

### When to use Azure CLI

- Create and manage individual Azure resources (VMs, storage accounts, databases).
- Automate infrastructure provisioning and configuration.
- Query resource properties and manage role-based access control (RBAC).
- Script repetitive Azure management tasks.
- Work with Azure services at the resource level.

### Example Azure CLI commands

```azurecli-interactive
# Create a resource group
az group create --name myResourceGroup --location eastus

# Create a virtual machine
az vm create --resource-group myResourceGroup --name myVM --image Ubuntu2204

# List storage accounts
az storage account list --output table
```

## Azure Developer CLI (`azd`)

Azure Developer CLI is a developer-centric tool that accelerates the time it takes to get your application running in Azure. It uses application templates that include infrastructure-as-code (IaC) files and configuration to provision and deploy resources.

### When to use Azure Developer CLI

- Scaffold a new application from a template and deploy it to Azure.
- Provision infrastructure and deploy application code in a single workflow.
- Set up CI/CD pipelines for your application.
- Work with Azure Developer CLI templates (`azd` templates) for repeatable deployments.
- Manage the full application lifecycle from development to production.

### Example Azure Developer CLI commands

```bash
# Initialize a new project from a template
azd init --template todo-nodejs-mongo

# Provision infrastructure and deploy the application
azd up

# Deploy code changes only
azd deploy

# Set up a CI/CD pipeline
azd pipeline config
```

## Key differences

### Scope of operations

- **Azure CLI** operates at the _resource level_. You create and manage individual Azure services such as virtual machines, databases, and networking components.
- **Azure Developer CLI** operates at the _application level_. You provision and deploy entire application stacks defined in templates.

### Infrastructure definition

- **Azure CLI** uses imperative commands. You specify each step to create and configure resources.
- **Azure Developer CLI** uses declarative templates (Bicep or Terraform) to define infrastructure. The tool handles the orchestration.

### Workflow focus

- **Azure CLI** focuses on Azure resource management and automation.
- **Azure Developer CLI** focuses on the inner-loop and outer-loop developer experience — from writing code to deploying applications.

## Using both tools together

Azure CLI and Azure Developer CLI are complementary. A common workflow is:

1. Use `azd` to scaffold and deploy your application from a template.
1. Use `az` to fine-tune individual resource configurations or troubleshoot specific services.
1. Use `az` in scripts for resource-level automation that goes beyond the application template.

## Related content

- [Get started with Azure CLI](get-started-with-azure-cli.md)
- [Install Azure CLI](install-azure-cli.md)
- [What is Azure Developer CLI?](/azure/developer/azure-developer-cli/overview)
- [Choose the right Azure command-line tool](choose-the-right-azure-command-line-tool.md)
