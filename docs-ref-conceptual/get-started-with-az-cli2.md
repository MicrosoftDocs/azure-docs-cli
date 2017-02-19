---
title: Get started with Azure CLI 2.0
description: Get started with Azure CLI 2.0 on Linux, Mac, or Windows.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 02/18/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 85c418a8-6177-4833-bb8d-ff4ce2233c1a
---

# Get started with Azure CLI 2.0

Azure CLI 2.0 allows you to manage and administer your Azure resources from the command line and to build automation scrits to do that. This article gets you started with using the Azure CLI.

1. [Install Azure CLI 2.0](install-az-cli2.md)
on whatever platform you use.

1. To verify the installation, run `az --version`. 
You should see the version number of Azure CLI and other dependent libraries installed on your computer. If you get an error instead, then there was a problem in installing the CLI - go to `troubleshooting the installation` page to fix that.

Before you can start using the Azure CLI, you have to login to your Azure account and subscription from the command line. The easiest way to do that is by using the `az login` command. There are other ways to login as well - please see the details of the `az login` command in the ref section to learn about these.

1. Run the login command.

    ```azurecli
    az login
    ```

   You get a code to use in the next step. 

1. Use a web browser to open the page [https://aka.ms/devicelogin](https://aka.ms/devicelogin)
    and enter the code to authenticate.

    You are prompted to log in using your credentials.

1. Log in.

Now you can run any command that accesses your account.

If you are using the Azure CLI 2.0 for the first time, you may want to run the `az configure` command to set up your environment and default settings for output formats etc. For most common use, the easiest output format default is the "table" format - select 3 when prompted for output format choices. See `output format` article for details. You can also select other defaults according to your liking.

```Output
What default output format would you like?
 [1] json - JSON formatted output that most closely matches API responses
 [2] jsonc - Colored JSON formatted output that most closely matches API responses
 [3] table - Human-readable output format
 [4] tsv - Tab and Newline delimited, great for GREP, AWK, etc.
Please enter a choice [3]: 
```
## Get subscriptions list

First thing you can try is to get a list of subscriptions in your Azure account. You can do this by running the `az account list` command. It returns a list of all sunscriptions in your account and shows the subscription that is set as the default one for use in the Azure CLI.

```azurecli
az account list
```

```Output
Name                                         CloudName    SubscriptionId                        State     IsDefault
-------------------------------------------  -----------  ------------------------------------  --------  -----------
Java-Demos                                   AzureCloud   1c638cf4-608f-4ee6-b680-c329e824c3a8  Enabled
Java-Tooling                                 AzureCloud   b6aa872b-f6a7-4cdc-bbc6-0fce6a8b9910  Enabled
Kamaljit_Subscription                        AzureCloud   ff696af2-840a-43d1-af03-8f78cdfb5185  Enabled
My Internal Subscription                     AzureCloud   c484c80e-0a6f-4470-86de-697ecee16984  Enabled   True
VS2017E2E                                    AzureCloud   4569f501-239f-4c48-a7c0-a3b1f507720c  Enabled
```

To select a different subscription as the default, use the `az account set` command. You can verify the change in default subscription by runnng the `az account list` command again.

```azurecli
az account set --subscription "Kamaljit_Subscription"
```

```Output
Name                                         CloudName    SubscriptionId                        State     IsDefault
-------------------------------------------  -----------  ------------------------------------  --------  -----------
Java-Demos                                   AzureCloud   1c638cf4-608f-4ee6-b680-c329e824c3a8  Enabled
Java-Tooling                                 AzureCloud   b6aa872b-f6a7-4cdc-bbc6-0fce6a8b9910  Enabled
Kamaljit_Subscription                        AzureCloud   ff696af2-840a-43d1-af03-8f78cdfb5185  Enabled   True
My Internal Subscription                     AzureCloud   c484c80e-0a6f-4470-86de-697ecee16984  Enabled
VS2017E2E                                    AzureCloud   4569f501-239f-4c48-a7c0-a3b1f507720c  Enabled
```

## Create a resource group

Next let's start by creating a new Resource Group. Resource Groups in Azure provide a way to manage multiple resources together (e.g. you might have a single resource group for an application that uses a virtual machine, a database and a CDN service within it). Below we going to create a new resource group named "MyRG" in the westus2 region of Azure."

```azurecli
az group create -l westus2 -n MyRG
```

```Output
Location    Name
----------  ------
westus2     MyRG
```

## Create a VM

Next let's start creating some virtual machines in the Resource Group, we just created in the above step. Following is the simplest way to create a Linux VM on Azure using the popular UbuntuLTS image with the default size and other properties.

```azurecli
az vm create -n MyLinuxVM -g MyRG --image UbuntuLTS --size Standard_A2
```

```Output
Location    MacAddress         PowerState    PrivateIpAddress    PublicIpAddress    ResourceGroup
----------  -----------------  ------------  ------------------  -----------------  ---------------
westus2     00-0D-3A-F7-30-7E  VM running    10.0.0.4            52.175.202.122     MyRG
```

Now that the VM has been created, you can logon to the VM using ssh. First you have to find the IP address of the VM.

```azurecli
az vm list-ip-addresses -g MyRG
```

```Output
VirtualMachine    PublicIPAddresses    PrivateIPAddresses
----------------  -------------------  --------------------
MyLinuxVM         52.175.202.122       10.0.0.4
```

```azurecli
ssh 52.175.202.122
```

```Output
Welcome to Ubuntu 14.04.4 LTS (GNU/Linux 3.19.0-65-generic x86_64)

 * Documentation:  https://help.ubuntu.com/

  System information as of Sun Feb 19 00:32:28 UTC 2017

  System load: 0.31              Memory usage: 3%   Processes:       89
  Usage of /:  39.6% of 1.94GB   Swap usage:   0%   Users logged in: 0

  Graph this data and manage this system at:
    https://landscape.canonical.com/

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

kamaljitbath@MyLinuxVM:~$
```

Next let's create a Windows VM. For creating a Windows VM, you have to specify a admin username and password. There are sepcial rules for what characters and size of the username and password can be and these must be followed.

```azurecli
az vm create -n MyWinVM -g MyRG --image Win2008R2SP1 --size Standard_A2 --admin-username adminku3r --admin-password p_l33mm0rd
```

```Output
Location    MacAddress         PowerState    PrivateIpAddress    PublicIpAddress    ResourceGroup
----------  -----------------  ------------  ------------------  -----------------  ---------------
westus2     00-0D-3A-F7-A9-AD  VM running    10.0.0.5            52.183.43.57       MyRG
```

Now you can logon to the Windows VM and open a remote session or use RDP.

## Creating other resources on Azure

Just like creating a virtual machine, you can create other resources on Azure from the command line. In general, the pattern for the create command is `az <resource type name> create` with parameters. Here are the commands you can use to create most common resource types from the command line.

```
Resource Type               Azure CLI create command
-------------               ------------------------
Azure Container Service     az acs create
Web App                     az appservice web create
Managed Disks               az disk create
Resource Group              az group create
Virtual Network             az network vnet create
Storage account             az storage account create
Virtual Machine             az vm create
Virtual Machine Scale Set   az vmss create
SQL Server                  az sql server create
Document DB                 az documentdb create
```

Some of the resource create commands are a bit time-consuming. So you can use the `no-wait` option to start the create action in the background and continue using the CLI for other commands.

```azurecli
az az vm create -n MyLinuxVM -g MyRG --image UbuntuLTS --size Standard_A2 --no-wait
```

## Listing and querying the resources

you can use the `list` command to list and see the resources you have created in your Azure subscription. There are various output formats and query options available to filter and sort the list of resources in the way you want to see them.

`az vm list` shows the list of VMs in a simple tabular format (if the output option is selected to be 'table" or set by default to 'table').

```azurecli
az vm list --output table
```

```Output
Name         ResourceGroup    Location
-----------  ---------------  ----------
DemoVM010    DEMORG1          westus
demovm212    DEMORG1          westus
demovm222    DEMORG1          westus
KBDemo001VM  RGDEMO001        westus
KBDemo020    RGDEMO001        westus
MyLinuxVM    MYRG             westus2
MyWinVM      MYRG             westus2
```

'tsv' output format is text-based, tab-separated format without any headers.

```azurecli
az vm list --otput tsv
```

```Output
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010	None	None	westus	DemoVM010			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	cbd56d9b-9340-44bc-a722-25f15b578444
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm212	None	None	westus	demovm212			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	4bdac85d-c2f7-410f-9907-ca7921d930b4
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/demovm222	None	None	westus	demovm222			None	Succeeded	DEMORG1	None			Microsoft.Compute/virtualMachines	e0f59516-1d69-4d54-b8a2-f6c4a5d031de
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo001VM	None	None	westus	KBDemo001VM			None	Succeeded	RGDEMO001	None			Microsoft.Compute/virtualMachines	14e74761-c17e-4530-a7be-9e4ff06ea74b
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/RGDEMO001/providers/Microsoft.Compute/virtualMachines/KBDemo02None	None	westus	KBDemo020			None	Succeeded	RGDEMO001	None			Microsoft.Compute/virtualMachinesed36baa9-9b80-48a8-b4a9-854c7a858ece
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/MYRG/providers/Microsoft.Compute/virtualMachines/MyLinuxVM	None	None	westus2	MyLinuxVM			None	Succeeded	MYRG	None			Microsoft.Compute/virtualMachines	12024b68-55df-48e3-a0cc-5a776bc305b5
None	None		/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/MYRG/providers/Microsoft.Compute/virtualMachines/MyWinVM	None	None	westus2	MyWinVM			None	Succeeded	MYRG	None			Microsoft.Compute/virtualMachines	5684047d-d88f-4dd3-85e0-7a9758293653
```

## Query the results

Use the `--query` parameter to execute a JMESPath query on the results of your `az` command.
Learn more in this article on [query](query-az-cli2.md).

```azurecli
az vm list --query "[?contains(resourceGroup,'MYRG')].{ resource: resourceGroup, name: name }"
```

```Output
Resource    Name
----------  ---------
MYRG        MyLinuxVM
MYRG        MyWinVM
```

You can also use grep command (on Mac and Linux) to further parse the output of the list command and do other filter operations. Learn more in this article on [query](query-az-cli2.md).

```azurecli
az vm list --output tsv | grep MYRG | cut -f8
```

```Output
MyLinuxVM
MyWinVM
```

you can also use the generic `az resource list' to list all resoures and their resource types in your Azure subscription.` 'Query' and 'grep' options work on all list outputs.

## Deleting resources

You can use the 'delete' command to delete the resources you no longer need. You can use the `delete` command with all resources just like the `create` command.

```azurecli
az vm delete -n KBDemo020 -g RGDemo001
```
```Output
Are you sure you want to perform this operation? (y/n): y
EndTime                           Name                                  StartTime                         Status
--------------------------------  ------------------------------------  --------------------------------  ---------
2017-02-19T02:35:56.678905+00:00  5b74ab80-9b29-4329-b483-52b406583e2f  2017-02-19T02:33:35.372769+00:00  Succeeded
```
You can also use the `delete` command to delete many resources at a time. For example, the following command deletes all the resources in a given Resource Group.

```azurecli
az group delete -n MyRG
```

```
Are you sure you want to perform this operation? (y/n): y
```

## Format the output

Use the `--output` parameter to [format the output](format-output-az-cli2.md) of the command.

## Get samples

Look at more example commandline scripts at [common examples](common-examples.md).

## Get help

```azurecli
az [command-group [command]] -h
```

For example, to see what commands and subgroups are available for VMs, use

```azurecli
az vm -h
```

To get help with the command to create a VM, use

```azurecli
az vm create -h
```

## Read the API reference docs

[API reference](/cli/azure)

## Send us your feedback

```azurecli
az feedback
```
