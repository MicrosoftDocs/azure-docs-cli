---
title: Quickstart - Choosing the right command-line tool for Azure
description: Learn the differences between AzureCLI and Azure PowerShell
keywords: powershell, azure, azurecli, bash, cloudshell
author: Duffney
ms.author: jduffney
ms.topic: quickstart
ms.service: azure
ms.date: 05/26/2021
ms.custom:
---

# Choose the right command-line tool for Azure

When it comes to managing Azure, you have many options. This article compares the Azure CLI and Azure PowerShell language and gives a comparison of the shell environments on which they run.

[Azure CLI](/cli/azure/install-azure-cli), [Azure PowerShell](/powershell/azure/install-az-ps), and [Azure Cloud Shell](/azure/cloud-shell/overview) have overlapping functionality. Each operates differently, and the language is sometimes confused with the environment. Use this guide to determine which is the right tool for you.

## What's the advantage of using a command-line tool?

Azure runs on automation. Every action you take inside the portal translates somewhere to code being executed to read, create, modify, or delete resources.

Moving your workload to Azure lifts some of the administrative burden but not all. As your rate of adoption with Azure increases so will the overhead. Even though you don't have to worry about the data center, you still have to patch and troubleshoot Azure VMs, failover databases, and configure virtual networks.

By using the existing automation that runs Azure, command-line tools reduce that overhead.

Command-line tools automate routine operations, standardize database failovers, and pull data that provide powerful insight. Command-line tools not only give you the ability to scale your tasks in Azure, but they also make much easier to share. Sharing a script is much easier than a lengthy wiki page with time consuming screenshots.

Using a command-line tool isn't always necessary, but it's a useful skill to have.

## Azure CLI vs Azure PowerShell

Azure CLI and Azure PowerShell are command-line tools that enable you to create and manage Azure resources. Both are cross-platform, installable
on Windows, macOS, and Linux.

**Azure CLI**

* Cross-platform command-line interface, installable on Windows, macOS, Linux
* Runs in Windows PowerShell, Cmd, or Bash and other Unix shells.

**Azure PowerShell**

* Cross-platform PowerShell module, runs on Windows, macOS, Linux
* Requires Windows PowerShell or PowerShell

## Different shell environments

|Shell Environment|Azure CLI|Azure PowerShell|
|---|:---:|:---:|
|Cmd|Yes||
|Bash|Yes|
|Windows PowerShell|Yes|Yes|
|PowerShell|Yes|Yes|

Windows PowerShell, PowerShell, Cmd, and Bash are shell environments. Your shell environment not only determines which tools you can use but also changes your command-line experience.

For example, for the line continuation character, Bash uses the backslash `\` while Windows PowerShell uses the backtick  `` ` ``. The differences in the shell environment doesn't change how Azure CLI and Azure PowerShell operate. However, they do change your command-line experience.

Azure CLI has an installer that makes its commands executable in all four shell environments.

Azure PowerShell is set of cmdlets packaged as a PowerShell module named `Az`; not an executable. Windows PowerShell or PowerShell must be used to install the `Az` module. 

Windows PowerShell is the standard scripting shell that comes preinstalled with most Windows operating systems. PowerShell is a stand-alone installation that uses .NET Core as it's run time, allowing allowing it to be installed on macOS, Linux, and Windows.

**Key points:**

* AzureRM is a PowerShell module that is still referenced for Azure administration with PowerShell. However, it has been replaced by Azure PowerShell and has an official retirement date of February 29 2024.

If you're using AzureRM, you can [migrate Azure PowerShell from AzureRM to Az](/powershell/azure/migrate-from-azurerm-to-az).

## What about Azure Cloud Shell?

Azure Cloud Shell is a hosted shell environment that runs on an Ubuntu container.

Cloud Shell provides two shell environments: Bash (with Azure CLI preinstalled) and PowerShell (with Azure PowerShell preinstalled). A dropdown list at the top of the Cloud Shell window allows you to easily switch between the two environments.

Cloud Shell is accessible in a web browser and has integrations for [Windows Terminal](https://channel9.msdn.com/Shows/IT-Ops-Talk/Azure-Cloud-Shell-in-the-Windows-Terminal) and [Visual Studio Code](https://azure.microsoft.com/en-us/blog/cloudshelleditor/).

![Azure CloudShell Bash and PowerShell environments](./media/choosing-the-right-azure-tool/azure-cloud-shell-bash-powershell.png)

## Which Command-line tool is right for you?

When picking the right tool, consider your past experience and current work environment.

Azure CLI syntax is similar to that of Bash scripting. If you work primarily with Linux systems, Azure CLI feels more natural.

Azure PowerShell is a PowerShell module. If you work primarily with Windows systems, Azure PowerShell is a natural fit. Commands follow a verb-noun naming scheme and
data is returned as objects.

Choose the tool that uses your experience and shortens your learning curve. Take advantage of [Microsoft learning](/learn/paths/manage-resources-in-azure) to become proficient at managing Azure at the command line.

With that said, being open-minded will only improve your abilities. Use a different tool when it makes sense.

**Key points:**

* Feature parity for Azure services doesn't always exist between Azure CLI and Azure PowerShell.

## Azure CLI and Azure PowerShell Side-by-side Command Comparison

Sign in, Subscription, and Location Commands:

|Command|Azure CLI|Azure PowerShell|
|---|---|---|
|Sign in with Web Browser|az login|Connect-AzAccount|
|Get available subscriptions|az account list|Get-AzSubscription|
|Set Subscription|az account set –subscription \<SubscriptionId>|Set-AzContext -Subscription \<SubscriptionID>|
|List Azure Locations|az account list-locations|Get-AzLocation|

---

Find Versions, Get Help, and View Command Help:

|Command|Azure CLI|Azure PowerShell|
|---|---|---|
|Find Version|az --version|Get-InstalledModule -Name Az|
|Get Help|az --help|Get-Help|
|View Command Help|az vm --help|Get-Help -Name New-AzVM

---

Create a Resource Group, VM, and Storage Account:

|Command|Azure CLI|Azure PowerShell|
| --- | --- | --- |
| Create Resource Group | az group create --name \<ResourceGroupName> --location eastus |New-AzResourceGroup -Name \<ResourceGroupName> -Location eastus
| Create Azure Virtual Machine | az vm create --resource-group myResourceGroup --name myVM --image UbuntuLTS --admin-username azureuser --admin-password '\<Password>' |  New-AzVM -ResourceGroupName \<ResourceGroupName> -Name myVM -Image UbuntuLTS -Credential (Get-Credential) |
| Create Azure Storage Account | az storage account create --name \<StorageAccountName> --resource-group \<ResourceGroupName> --location eastus --sku Standard_LRS --kind StorageV2 | New-AzStorageAccount -Name \<StorageAccountName> -ResourceGroupName \<ResourceGroupName> -Location eastus -SkuName Standard_LRS -Kind StorageV2

---

Manage Azure Virtual Machines:

|Command|Azure CLI|Azure PowerShell|
| --- | --- | --- |
|List VM|az vm list|Get-AzVM
|Restart VM|az vm restart --name myVM --resource-group \<ResourceGroupName>|Restart-AzVM -Name myVM -ResourceGroupName \<ResourceGroupName>
|Stop VM|az vm stop --name myVM --resource-group \<ResourceGroupName>|Stop-AzVM -Name myVM -ResourceGroupName \<ResourceGroupName>
|Stop & Deallocate VM| az vm deallocate --name myVM --resource-group \<ResourceGroupName>|Stop-AzVM -Name myVM -ResourceGroupName \<ResourceGroupName>
|Start VM| az vm start --name myVM --resource-group \<ResourceGroupName>|Start-AzVM -Name myVM -ResourceGroupName \<ResourceGroupName>
|Delete VM|az vm delete --name myVM --resource-group \<ResourceGroupName>|Remove-AzVM -Name myVM -ResourceGroupName \<ResourceGroupName>|

Select Properties and Change Output Formats:

|Command|Azure CLI|Azure PowerShell|
| --- | --- | --- |
|Show all subscription information|az account list --all|Get-AzSubscription \| Select-Object -Property *|
|Output as a Table|az account list -o table| Get-AzSubscription \| Format-Table|
|Output as JSON|az account show|Get-AzSubscription \| ConvertTo-Json|

**Key points:**

* Azure CLI defaults to outputting a JSON string. Other format options can be found on the [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli).
* Azure PowerShell defaults to outputting objects. To learn more about formatting in PowerShell, read the [Using Format Commands to Change Output View](/powershell/scripting/samples/using-format-commands-to-change-output-view).

## Next steps

Azure CLI:

* [Install the Azure CLI](/cli/azure/install-azure-cli)

Azure PowerShell:

* [Install Azure PowerShell](/powershell/azure/install-az-ps)
