---
title: Cross-service links for working with the Azure CLI
description: Links to popular tutorials, quickstarts, samples, concepts, and how-to guides 
keywords: Azure CLI, virtual machines, Azure Kubernetes Service (AKS), Batch, Azure CLI (Core), Azure Resource Manager, Key Vault, Azure Stack Hub, Functions, Azure Database, Event Hubs, Azure App Configuration, Sovereign, Security, Governance, Insights, DevOps, automation, application, web app, script, certificate, itpro, it pro, role, aad, authentication, authenticate
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 02/28/2020
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azurecli
---

# Links for working with Azure CLI

The Azure CLI reference syntax is found across many Azure services resulting in tutorials, quickstarts, samples, and how-to guides being spread across document repositories.  Use these links to popular articles to complete common tasks.

## Virtual Machine

| | | | |
|-|-|-|-|
Tutorial | Linux | [Create a Linux virtual machine running Ubuntu with the Azure CLI](/azure-cli-vm-tutorial) | create a virtual machine with the Azure CLI.  Learn about output queries, Azure resource reuse and resource cleanup.
Quickstart | Linux | [Create a Linux virtual machine using the Azure CLI](/virtual-machines/linux/quick-create-cli) | Deploy a Linux virtual machine in Azure.
How-to guide | Linux | [Create a Linus image of a virtual machine or VHD](/virtual-machines/linux/capture-image) | Deprovision an existing virtual machine, create an image, and create a new virtual machine from the captured image.
How-to guide | Linux | [Upload a VHD to Azure using the Azure CLI](/virtual-machines/linux/disks-upload-vhd-to-managed-disk-cli) | Create an empty managed disk, upload your local VHD file, and copy a managed disk.
How-to guide | Linux | [Create a shared image gallery using the Azure CLI](/virtual-machines/linux/shared-images) | Create a Shared Image Gallery of custom VM images with others in your organization, within or across regions, or within an AAzure Active Directory tenant.
How-to guide | Linux | [Deploy Spot VMs using the Azure CLI (preview)](/virtual-machines/linux/spot-cli) | Deploy a Linux Spot virtual machine in Azure.
Quickstart | Windows | [Create a Windows virtual machine using the Azure CLI](/virtual-machines/windows/quick-create-cli) | Deploy a virtual machine in Azure that runs Windows Server 2016.
Learn Module | Manage | [Manage virtual machines using the Azure CLI](https://docs.microsoft.com/learn/modules/manage-virtual-machines-with-azure-cli/) | Create, start, stop, and perform additional management tasks related to virtual machines in Azure.

## Virtual Network

| | | | |
|-|-|-|-|
Quickstart | [Create a virtual network using the Azure CLI]((Network)/virtual-network/quick-create-cli) | Create a virtual network, deploy two virtual machines into the  virtual network, and connected to the virtual machines from the internet.
How-to guide | [Enable Accelerated Networking on a Linux virtual machine using the Azure CLI](/virtual-network/create-vm-accelerated-networking-cli) | Create a Linux virtual machine, handle dynamic binding and revocation of virtual function, and enable Accelerated Networking.

## IoT Hub

| | | | |
|-|-|-|-|
Tutorial | [Configure IoT Hub message routing using the Azure CLI](/iot-hub/tutorial-routing) | Set up and use custom routing queries with IoT Hub.

## Azure App Configuration

| | | |
|-|-|-|
Samples | [Azure CLI samples for Azure App Configuration](/azure-app-configuration/cli-samples) | Get links to bash scripts that use the Azure CLI for Azure App Configuration.

## Azure Batch

| | | |
|-|-|-|
Sample | [Run a job and tasks with Azure Batch using the Azure CLI](/batch/scripts/batch-cli-sample-run-job ) | Create a Batch job and add a series of tasks to the job. Monitor a job and its tasks.
Sample | [Create and manage a Windows pool in Azure Batch using the Azure CLI](/batch/scripts/batch-cli-sample-manage-windows-pool) | Create and manage a pool of Windows compute nodes with a Cloud Services configuration.

## Azure Container Instance

| | | |
|-|-|-|
Quickstart | [Deploy a container instance using the Azure CLI](/container-instances/container-instances-quickstart) | Use the Azure CLI to deploy an isolated Docker container and make its application available with a fully qualified domain name (FQDN). Execute a single deployment command, then browse to the application running in the container.

## Azure Database

| | | | |
|-|-|-|-|
Sample | SQL Database | [Configure Azure SLQ Database using the Azure CLI](/sql-database/sql-database-cli-samples?tabs=single-database) | Azure CLI samples for Azure SQL Database.
Quickstart | MySQL | [Create an Azure Database for MySQL server using the Azure CLI](/mysql/quickstart-ceate-mysql-server-database-using-azure-cli) | Create an Azure Database for MySQL server.  Configure a firewall rule and SSL settings.  Get and use connection information.
How-to guide| Cosmos DB | [Manage Azure Cosmos resources using the Azure CLI](/cosmos-db/manage-with-cli) | Use common commands to automate management of your Azure Cosmos DB accounts, databases, and containers.
Sample | Cosmos DB | [Azure CLI samples for Azure Cosmos DB SQL (Core) API](/cosmos-db/cli-samples) | Get links to sample Azure CLI scripts for Azure Cosmos DB SQL (Core) API.

## Azure Event Hub

| | | |
|-|-|-|
Quickstart | [Create an event hub using the Azure CLI](/event-hubs/event-hubs-quickstart-cli) | Create an Event Hubs namespace, and an event hub.

## Azure Function

| | | |
|-|-|-|
Quickstart |  [Create your first function from the command line using the Azure CLI](/azure-functions/functions-create-first-azure-function-azure-cli) | Create a function app project, enable extension bundles, and create and run a function.  Deploy the function app project to Azure.

## Azure Germany

| | | |
|-|-|-|
Get Started |  [Connect to Azure Germany by using the Azure CLI](/germany/germany-get-started-connect-with-cli) | Using Azure Germany, manage a large subscription through scripts and access features that are not currently available in the global Azure portal.

## Azure Kubernetes Service (AKS)

| | | |
|-|-|-|
Quickstart | [Deploy an Azure Kubernetes Service (AKS) cluster using the Azure CLI](/aks/kubernetes-walkthrough) | Deploy and manage AKS clusters.  See how to monitor the health of the cluster and pods that run your application.

## Azure Resource Manager

| | | | |
|-|-|-|-|
How-to guide | Templates | [Deploy resources with Azure Resource Manager templates and the Azure CLI](/azure-resource-manager/templates/deploy-cli) | Deploy your resources to Azure using templates.
How-to guide | Resource groups | [Manage Azure Resource Manager resource groups by using the Azure CLI](/azure-resource-manager/management/manage-resource-groups-cli) | Use Azure Resource Manager to manage your Azure resource groups.

## Azure Stack Hub

| | | | |
|-|-|-|-|
Quickstart | Linux VM | [Create a Linux server virtual machine in Azure Stack Hub using the Azure CLI](-stack/user/azure-stack-quick-create-vm-linux-cli?view=azs-1910) | Create an Ubuntu Server 16.04 LTS virtual machine, connect to the virtual machine with a remote client, and install an NGINX web server.
Quickstart | Windows VM | [Create a Windows Server virtual machine in Azure Stack Hub using the Azure CLI](-stack/user/azure-stack-quick-create-vm-windows-cli?view=azs-1910) | Create a Windows Server 2016 virtual machine, connect the virtual machine with a remote client, and install the IIS web server.
How-to guide | ASDK resources | [Manage and deploy resources to Azure Stack Hub using the Azure CLI](-stack/user/azure-stack-version-profiles-azurecli2?view=azs-1910) | Set up the Azure CLI to manage Azure Stack Development Kit (ASDK) resources from Linux, Mac, and Windows client platforms.

## Azure Storage

| | | | |
|-|-|-|-|
How-to guide | Blob storage | [Use the Azure CLI with Azure Storage](/storage/common/storage-azure-cli) | Work with resources in your Azure Storage account.
Quickstart | Blob storage | [Create, download, and list blobs using the Azure CLI](/storage/blobs/storage-quickstart-blobs-cli) | Upload and download data to and from Azure Blob storage.
How-to guide | Blob storage | [Use the Azure CLI to manage directories, files, and ACLs in Azure Data Lake Storage Gen2 (preview)](/storage/blobs/data-lake-storage-directory-file-acl-cli) | Create and manage directories, files, and permissions in storage accounts that have a hierarchical namespace.
Quickstart | File storage | [Create and manage Azure file shares using the Azure CLI](/storage/files/storage-how-to-use-files-cli) | Create and use Azure file shares.  Create and manage share snapshots.

## Security

| | | | |
|-|-|-|-|
How-to guide | Service principal | [Create an Azure service principal with the Azure CLI](/create-an-azure-service-principal-azure-cli) | Create, get information about, and reset a service principal with the Azure CLI.
How-to guide | RBAC | [Add or remove role assignments using Azure RBAC and the Azure CLI](/role-based-access-control/role-assignments-cli) | Assign roles to Azure role-based access control.
How-to guide | Key Vault | [Manage Key Vault using the Azure CLI](/key-vault/key-vault-manage-with-cli2) | Create and manage Azure Key Vault.  Register and authorize an application, set advanced access policies, and learn cross-platform command-line interface commands.
Tutorial | Key Vault | [Manage storage account keys with Key Vault and the Azure CLI](/key-vault/key-vault-ovw-storage-keys) | Manage storage account keys, and generate shared access signature tokens.

## Governance

| | | | |
|-|-|-|-|
Quickstart | Resource Graph | [Run your first Resource Graph query using the Azure CLI](/governance/resource-graph/first-query-azurecli) | Add Azure Resource Graph to your Azure CLI installation and run your first Resource Graph query.
Quickstart | Policy assignment | [Create a policy assignment to identify non-compliant resources using the Azure CLI](/governance/policy/assign-policy-azurecli) | Create a policy assignment to identify virtual machines that aren't using managed disks.

## Insights

| | | | |
|-|-|-|-|
Reference |  Machine Learning | [Use the Azure CLI extension for Azure Machine Learning](/machine-learning/reference-azure-machine-learning-cli) | Run experiments to create machine learning models and register machine learning models for customer usage.  Package, deploy and track the lifecycle of your machine learning models.
How-to-guide | Cognitive Services | [Create a Cognitive Services resource using the Azure CLI](/cognitive-services/How-to-guide/cognitive-services-apis-create-account-cli) | Sign up for Azure Cognitive Services and create an account that has a single-service or multi-service subscription.  Use the keys and endpoint generated for you to authenticate your applications.
How-to guide | Azure Monitor | [Create a Log Analytics workspace using the Azure CLI](/azure-monitor/learn/quick-create-workspace-cli) | Create and deploy a Log Analytics workspace.
How-to-guide | HDInsight | [Create HDInsight clusters using the Azure CLI](/hdinsight/hdinsight-hadoop-create-linux-clusters-azure-cli) | Create a HDInsight 3.6 cluster.
Tutorial | HDInsight | [Manage Azure HDInsight clusters using the Azure CLI](/hdinsight/hdinsight-administer-use-command-line) | List, show, delete, and scale HDInsight clusters.

## Azure DevOps - Git repositories

| | | | |
|-|-|-|-|
Get Started | DevOps Pipeline | [Create your first Azure Pipeline using the Azure CLI](/devops/pipelines/create-first-pipeline-cli) | Create a new pipeline in a cloned GitHub directory, manage and run your pipelines.
How-to guide | DevOps Pipeline | [Azure Pipeline deployment tasks using the Azure CLI](/devops/pipelines/tasks/deploy/azure-cli?view=azure-devops) | In a build or release pipeline, run a shell or batch script containing the Azure CLI.  Commands can be run on cross-platform agents running on Linux, macOS, or Windows operating systems.
Tutorial | Jenkins Pipeline | [Deploy to Azure App Service with Jenkins using the Azure CLI](/jenkins/execute-cli-jenkins-pipeline) | Create and configure a Jenkins virtual machine, create a web app in Azure, and prepare a GitHub repository.  Create and run the Jenkins pipeline.
