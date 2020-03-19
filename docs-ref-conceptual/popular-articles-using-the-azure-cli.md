---
title: Cross-service links for working with the Azure CLI
description: Links to popular tutorials, quickstarts, samples, concepts, and how-to guides, Azure CLI, virtual machines, Azure Kubernetes Service (AKS), Batch, Azure CLI (Core), Azure Resource Manager, Key Vault, Azure Stack Hub, Functions, Database, Event Hubs, App Configuration, App Config, Germany, Security, Governance, Insights, IoT, Internet of Things, DevOps, Virtual Network, Compute, Networking, Developer Tools, Databases, Analytics, Management and Governance, Hybrid, Storage, Security, AI, AI + Machine Learning, Linux, Windows, Ubuntu, automation, application, web app, script
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 03/01/2020
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Popular articles using the Azure CLI

The Azure CLI is used in many Azure services resulting in articles being spread across document repositories.  This page provides links to select popular articles.  

## Compute

| | | | |
|-|-|-|-|
|Virtual Machines | Tutorial: Linux | [Create a Linux virtual machine with the Azure CLI](azure-cli-vm-tutorial.yml) | Create a virtual machine.  Learn about output queries and setting environment variables.
|Virtual Machines | Quickstart: Linux | [Create a Linux virtual machine using the Azure CLI](/azure/virtual-machines/linux/quick-create-cli) | Create and deploy a Linux virtual machine.  Open a port for web traffic, and install a web server.
|Virtual Machines | How-to guide: Linux |[Create a Linus image of a virtual machine or VHD](/azure/virtual-machines/linux/capture-image) | Deprovision an existing virtual machine, create an image, and create a new virtual machine from the captured image.
|Virtual Machines | How-to guide: Linux | [Upload a VHD to Azure using the Azure CLI](/azure/virtual-machines/linux/disks-upload-vhd-to-managed-disk-cli) | Create an empty managed disk, upload your local VHD file, and copy a managed disk.
|Virtual Machines | How-to guide: Linux | [Create a shared image gallery using the Azure CLI](/azure/virtual-machines/linux/shared-images) | Create a Shared Image Gallery of custom VM images with others in your organization, within or across regions, or within an AAzure Active Directory tenant.
|Virtual Machines | How-to guide: Linux | [Deploy Spot VMs using the Azure CLI (preview)](/azure/virtual-machines/linux/spot-cli) | Deploy a Linux Spot virtual machine that will not be evicted based on price.
|Virtual Machines | Quickstart: Windows | [Create a Windows virtual machine using the Azure CLI](/azure/virtual-machines/windows/quick-create-cli) | Deploy a virtual machine in Azure that runs Windows Server 2016.
|Virtual Machines | Learn Module | [Manage virtual machines using the Azure CLI](https://docs.microsoft.com/learn/modules/manage-virtual-machines-with-azure-cli/) | Create, start, stop, and perform additional management tasks related to virtual machines.
|Azure Kubernetes Service (AKS)| Quickstart | [Deploy an Azure Kubernetes Service (AKS) cluster using the Azure CLI](/azure/aks/kubernetes-walkthrough) | Deploy and manage AKS clusters.  See how to monitor the health of the cluster and pods that run your application.
|Azure Batch|Sample | [Run a job and tasks with Azure Batch using the Azure CLI](/azure/batch/scripts/batch-cli-sample-run-job) | Create a Batch job and add a series of tasks to the job. Monitor a job and its tasks.
|Azure Batch|Sample | [Create and manage a Windows pool in Azure Batch using the Azure CLI](/azure/batch/scripts/batch-cli-sample-manage-windows-pool) | Create and manage a pool of Windows compute nodes with a Cloud Services configuration.
|Azure Container Instance|Quickstart | [Deploy a container instance using the Azure CLI](/azure/container-instances/container-instances-quickstart) | Deploy an isolated Docker container and make its application available with a fully qualified domain name (FQDN). Execute a single deployment command, then browse to the application running in the container.
|Azure Function|Quickstart |  [Create a function in Azure that responds to HTTP requests using the Azure CLI](/azure/azure-functions/functions-create-first-azure-function-azure-cli) | Use command-line tools to create a function that responds to HTTP requests. After testing the code locally, deploy the function to the serverless environment of Azure Functions.

## Networking

| | | | |
|-|-|-|-|
|Virtual Network|Quickstart | [Create a virtual network using the Azure CLI](/azure/virtual-network/quick-create-cli) | Create a virtual network, deploy two virtual machines into the  virtual network, and connected to the virtual machines from the internet.
|Virtual Network|How-to guide | [Enable Accelerated Networking on a Linux virtual machine using the Azure CLI](/azure/virtual-network/create-vm-accelerated-networking-cli) | Create a Linux virtual machine, handle dynamic binding and revocation of virtual function, and enable Accelerated Networking.

## Internet of Things

| | | | |
|-|-|-|-|
|IoT Hub|Tutorial | [Configure IoT Hub message routing using the Azure CLI](/azure/iot-hub/tutorial-routing) | Set up and use custom routing queries with IoT Hub.

## Developer Tools

| | | | |
|-|-|-|-|
|Azure App Configuration|Samples |[Azure CLI samples for Azure App Configuration](/azure/azure-app-configuration/cli-samples) | Get links to bash scripts that use the Azure CLI for Azure App Configuration.
|Azure DevOps| Get Started: DevOps Pipeline |[Create your first Azure Pipeline using the Azure CLI](/azure/devops/pipelines/create-first-pipeline-cli) | Create a new pipeline in a cloned GitHub directory, manage and run your pipelines.
|Azure DevOps| How-to guide: DevOps Pipeline |[Azure Pipeline deployment tasks using the Azure CLI](/azure/devops/pipelines/tasks/deploy/azure-cli?view=azure-devops) | In a build or release pipeline, run a shell or batch script containing the Azure CLI.  Commands run on cross-platform agents running on Linux, macOS, or Windows operating systems.
|Azure DevOps| Tutorial: Jenkins Pipeline |[Deploy to Azure App Service with Jenkins using the Azure CLI](/azure/jenkins/execute-cli-jenkins-pipeline) | Create and configure a Jenkins virtual machine, create a web app in Azure, and prepare a GitHub repository.  Create and run the Jenkins pipeline.

## Databases

| | | | |
|-|-|-|-|
|SQL Database| Sample |[Configure Azure SQL Database using the Azure CLI](/azure/sql-database/sql-database-cli-samples?tabs=single-database) | Azure CLI samples for Azure SQL Database.
|MySQL|Quickstart |[Create an Azure Database for MySQL server using the Azure CLI](/azure/mysql/quickstart-create-mysql-server-database-using-azure-cli) | Create an Azure Database for MySQL server.  Configure a firewall rule and SSL settings.  Get and use connection information.
|Cosmos DB |How-to guide |[Manage Azure Cosmos resources using the Azure CLI](/azure/cosmos-db/manage-with-cli) | Use common commands to automate management of your Azure Cosmos DB accounts, databases, and containers.
|Cosmos DB |Sample |[Azure CLI samples for Azure Cosmos DB SQL (Core) API](/azure/cosmos-db/cli-samples) | Get links to sample Azure CLI scripts for Azure Cosmos DB SQL (Core) API.

## Analytics

| | | | |
|-|-|-|-|
Azure Event Hub |Quickstart |[Create an event hub using the Azure CLI](/azure/event-hubs/event-hubs-quickstart-cli) | Create an Event Hubs namespace, and an event hub.
HDInsight |How-to-guide |[Create HDInsight clusters using the Azure CLI](/azure/hdinsight/hdinsight-hadoop-create-linux-clusters-azure-cli) | Create a HDInsight 3.6 cluster.
HDInsight |Tutorial |[Manage Azure HDInsight clusters using the Azure CLI](/azure/hdinsight/hdinsight-administer-use-command-line) | List, show, delete, and scale HDInsight clusters.

## Management and Governance

| | | | |
|-|-|-|-|
Resource Manager Templates |How-to guide |[Deploy resources with Azure Resource Manager templates and the Azure CLI](/azure/azure-resource-manager/templates/deploy-cli) | Deploy your resources to Azure using templates.
Resource Manager groups |How-to guide |[Manage Azure Resource Manager resource groups by using the Azure CLI](/azure/azure-resource-manager/management/manage-resource-groups-cli) | Use Azure Resource Manager to manage your Azure resource groups.
Resource Graph |Quickstart |[Run your first Resource Graph query using the Azure CLI](/azure/governance/resource-graph/first-query-azurecli) | Add Azure Resource Graph to your Azure CLI installation and run your first Resource Graph query.
Policy assignment |Quickstart |[Create a policy assignment to identify non-compliant resources using the Azure CLI](/azure/governance/policy/assign-policy-azurecli) | Create a policy assignment to identify virtual machines that aren't using managed disks.

## Hybrid

| | | | |
|-|-|-|-|
Azure Stack Hub| Quickstart: Linux VM |[Create a Linux server virtual machine in Azure Stack Hub using the Azure CLI](/azure-stack/user/azure-stack-quick-create-vm-linux-cli) | Create an Ubuntu Server 16.04 LTS virtual machine, connect to the virtual machine with a remote client, and install an NGINX web server.
Azure Stack Hub| Quickstart: Windows VM |[Create a Windows Server virtual machine in Azure Stack Hub using the Azure CLI](/azure-stack/user/azure-stack-quick-create-vm-windows-cli) |Create a Windows Server 2016 virtual machine, connect the virtual machine with a remote client, and install the IIS web server.
Azure Stack Hub| How-to guide: ASDK resources |[Manage and deploy resources to Azure Stack Hub using the Azure CLI](/azure-stack/user/azure-stack-version-profiles-azurecli2) | Set up the Azure CLI to manage Azure Stack Development Kit (ASDK) resources from Linux, Mac, and Windows client platforms.

## Storage

| | | | |
|-|-|-|-|
Blob storage |Quickstart |  [Create, download, and list blobs using the Azure CLI](/azure/storage/blobs/storage-quickstart-blobs-cli) | Upload and download data to and from Azure Blob storage.
Blob storage |How-to guide |[Authorize access to blob or queue data using the Azure CLI](/azure/storage/common/authorize-data-operations-cli) | Specify how data operations are authorized, and set environment variables for parameters.
Blob storage |How-to guide |[Use the Azure CLI to manage directories, files, and ACLs in Azure Data Lake Storage Gen2 (preview)](/azure/storage/blobs/data-lake-storage-directory-file-acl-cli) | Create and manage directories, files, and permissions in storage accounts that have a hierarchical namespace.
File storage |Quickstart |[Create and manage Azure file shares using the Azure CLI](/azure/storage/files/storage-how-to-use-files-cli) | Create and use Azure file shares.  Create and manage share snapshots.

## Security

| | | | |
|-|-|-|-|
Service principal |How-to guide |[Create an Azure service principal with the Azure CLI](/cli/azure/create-an-azure-service-principal-azure-cli) | Create, get information about, and reset a service principal with the Azure CLI.
RBAC |How-to guide |[Add or remove role assignments using Azure RBAC and the Azure CLI](/azure/role-based-access-control/role-assignments-cli) | Assign roles to Azure role-based access control.
Key Vault |How-to guide |[Manage Key Vault using the Azure CLI](/azure/key-vault/key-vault-manage-with-cli2) | Create and manage Azure Key Vault.  Register and authorize an application, set advanced access policies, and learn cross-platform command-line interface commands.
Key Vault |Tutorial |[Manage storage account keys with Key Vault and the Azure CLI](/azure/key-vault/key-vault-ovw-storage-keys) | Manage storage account keys, and generate shared access signature tokens.

## AI + Machine Learning

| | | | |
|-|-|-|-|
Machine Learning |Reference |[Use the Azure CLI extension for Azure Machine Learning](/azure/machine-learning/reference-azure-machine-learning-cli) | Run experiments to create machine learning models and register machine learning models for customer usage.  Package, deploy and track the lifecycle of your machine learning models.
Cognitive Services |How-to-guide |[Create a Cognitive Services resource using the Azure CLI](/azure/cognitive-services/cognitive-services-apis-create-account-cli) | Sign up for Azure Cognitive Services and create an account that has a single-service or multi-service subscription.  Use the keys and endpoint generated for you to authenticate your applications.
Azure Monitor |How-to guide |[Create a Log Analytics workspace using the Azure CLI](/azure/azure-monitor/learn/quick-create-workspace-cli) | Create and deploy a Log Analytics workspace.

## Geographies

| | | | |
|-|-|-|-|
Azure Germany |Get Started |[Connect to Azure Germany by using the Azure CLI](/azure/germany/germany-get-started-connect-with-cli) | Using Azure Germany, manage a large subscription through scripts and access features that are not currently available in the global Azure portal.
Azure Government|Get Started |[Connect to Azure Government with Azure CLI](/azure/azure-government/documentation-government-get-started-connect-with-cli)|Access and start managing resources in Azure Government.

## See also

* [Get started with the Azure CLI](get-started-with-azure-cli.md)
* [Full command reference list for the Azure CLI](/cli/azure/reference-index)
* [Services the Azure CLI can manage](azure-services-the-azure-cli-can-manage.md)
