---
title: Get started with Azure CLI 2.0
description: Get started with Azure CLI 2.0 on Linux, Mac, or Windows.
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 02/27/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 85c418a8-6177-4833-bb8d-ff4ce2233c1a
---

# Get started with Azure CLI 2.0

The Azure CLI 2.0 is Azure's new command line experience for managing Azure resources.
It can be used on macOS, Linux, and Windows. 

Azure CLI 2.0 is optimized for managing and administering Azure resources from the command line,
and for building automation scripts that work against the Azure Resource Manager.
This article helps get you started using it, and teaches you the core concepts behind it.

For information about the latest release, see the [release notes](release-notes-azure-cli.md).

## Install Azure CLI

The first step is to make sure you have the latest version of the Azure CLI installed:

1. [Install Azure CLI 2.0](install-azure-cli.md)
on whatever platform you use.

2. To verify the installation was successful, run `az --version` from your command line. 

You should see the version number of Azure CLI and other dependent libraries installed on your computer.  
  
If you get an error, there was likely a problem installing the CLI. Review the "Installation Troubleshooting" section of [Azure CLI 2.0 installation article](install-azure-cli.md#troubleshooting) 
for guidance, or post a comment in the discussion at the bottom of that page for help.

## Log in to Azure

Now that you have the Azure CLI 2.0 installed, your next step will be to securely connect it with your Azure account. Use the `az login` command to do this.

1. Run the following command from the command line.

    ```azurecli
    az login
    ```
   This command will output a code to use in the next step. 

2. Use a web browser to open the page [https://aka.ms/devicelogin](https://aka.ms/devicelogin) and enter the code.
  
3. At the prompt, log in using your Azure credentials.

Now you can run commands from the Azure CLI 2.0 on the Azure resources and services available to your account.

## Create a Resource Group

Now that we've got everything set up, let's use the Azure CLI to create resources within Azure.

First, create a Resource Group.  Resource Groups in Azure provide a way to manage multiple resources that you 
want to logically group together.  For example, you might create a Resource Group for an application or project
and add a virtual machine, a database and a CDN service within it.

Let's create a resource group named "MyResourceGroup" in the *westus2* region of Azure.  To do so type the following command:

```azurecli
az group create -n MyResourceGroup -l westus2 
```

Once the resource group has been created, the `az group create` command outputs several properties of the newly created resource:

```Output
{
  "id": "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/MyResourceGroup",
  "location": "westus2",
  "managedBy": null,
  "name": "MyResourceGroup",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null
}
```

## Create a Linux Virtual Machine

Now that we have our resource group, let's create a Linux VM within it.

You can create a Linux VM using the popular UbuntuTLS image, with two attached storage disks of 10GB and 20GB, with the following command:

```azurecli
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS --data-disk-sizes-gb 10 20
```

When you run the preceding command, the Azure CLI 2.0 looks for an SSH key pair stored under your ~/.ssh directory.  If you don't already have an SSH key pair stored there, you can ask the Azure CLI to automatically create one for you by passing the --generate-ssh-keys parameter:

```azurecli
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS --generate-ssh-keys
```

The `az vm create` command returns output once the VM has been fully created and is ready to be accessed and used. The output includes several properties of the newly created VM including its public IP address:

```Output
{
  "fqdns": "",
  "id": "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyLinuxVM",
  "location": "westus2",
  "macAddress": "xx-xx-xx-xx-xx-xx",
  "powerState": "VM running",
  "privateIpAddress": "xx.x.x.x",
  "publicIpAddress": "xx.xxx.xxx.xx",
  "resourceGroup": "MyResourceGroup"
}
```

Now that the VM has been created, you can log on to your new Linux VM using **SSH** with the public IP address of the VM you created:

```azurecli
ssh xx.xxx.xxx.xxx
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

my-login@MyLinuxVM:~$
```

## Create a Windows Server Virtual Machine

Let's now create a Windows Server 2016 Datacenter based VM using the `az vm create` command and add it to the same "MyResourceGroup" resource group that we used for our Linux VM.  Like the Linux VM example we'll also attach two storage disks using the `--data-disk-sizes-gb` parameter.

Azure requires that you avoid using easily guessed usernames/passwords. There are specific rules for what characters can be used as well as the minimum length of both username and password.  

> [!NOTE]
> You will be prompted to enter your username and password when running this command.

```azurecli
az vm create -n MyWinVM -g MyResourceGroup --image Win2016Datacenter
```

The `az vm create` command output results once the VM has been fully created and is ready to be accessed and used.

```Output
{
  "fqdns": "",
  "id": "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyWinVM",
  "location": "westus2",
  "macAddress": "xx-xx-xx-xx-xx-xx",
  "powerState": "VM running",
  "privateIpAddress": "xx.x.x.x",
  "publicIpAddress": "xx.xxx.xx.xxx",
  "resourceGroup": "MyResourceGroup"
}
```

Now log on to your newly created Windows Server VM using Remote Desktop and the public IP address of the VM (which is returned in the output from `az vm create`).  
If you are on a Windows-based system, you can do this from the command line using the `mstsc` command:

```azurecli
mstsc /v:xx.xxx.xx.xxx
```

Supply the same username/password combination you used when creating the VM to log in.

## Creating other resources in Azure

We've now walked through how to create a Resource Group, a Linux VM, and a Windows Server VM. You can create many other types of Azure resources as well.  

All new resources are created using a consistent `az <resource type name> create` naming pattern.  For example, to create an Azure Network Load Balancer that we could then associate with our newly created VMs, we can use the following create command:

```azurecli
az network lb create -n MyLoadBalancer -g MyResourceGroup
```

We could also create a new private Virtual Network (commonly referred to as a "VNet" within Azure) for our infrastructure using the following create command:

```azurecli
az network vnet create -n MyVirtualNetwork -g MyResourceGroup --address-prefix 10.0.0.0/16
```

What makes Azure and the Azure CLI powerful is that we can use it not just to get cloud-based infrastructure but also to
create managed platform services.  The managed platform services can also be combined with infrastructure to build even more powerful solutions.

For example, you can use the Azure CLI to create an Azure AppService.  Azure AppService is a managed platform service that provides a great way to host web apps without having to worry about infrastructure.  After creating the Azure AppService, you can create two new Azure Web Apps within the AppService using the following create commands:

```azurecli
# Create an Azure AppService that we can host any number of web apps within
az appservice plan create -n MyAppServicePlan -g MyResourceGroup

# Create Two Web Apps within the AppService (note: name param must be a unique DNS entry)
az appservice web create -n MyWebApp43432 -g MyResourceGroup --plan MyAppServicePlan 
az appservice web create -n MyWebApp43433 -g MyResourceGroup --plan MyAppServicePlan 
```

Once you understand the basics of the `az <resource type name> create` pattern, it becomes easy to create anything. Following are 
some popular Azure resource types and the corresponding Azure CLI create commands to create them:

```
Resource Type               Azure CLI create command
-------------               ------------------------
Resource Group              az group create
Virtual Machine             az vm create
Virtual Network             az network vnet create
Load Balancer               az network lb create
Managed Disk                az disk create
Storage account             az storage account create
Virtual Machine Scale Set   az vmss create
Azure Container Service     az acs create
Web App                     az appservice web create
SQL Database Server         az sql server create
Document DB                 az documentdb create
```

Visit the [Reference documentation](/azure/doc-ref-autogen) to learn more about the additional resource-specific parameters that you can pass to each of the preceding commands and the resource types you can create. 

## Useful tip: Optimizing create operations using --no-wait

By default when you create resources using the Azure CLI 2.0, the `az <resource type name> create` command waits until the 
resource has been created and is ready for you to use.  For example, if you create a VM, the `az vm create` command will, by default,
not return until the VM is created and is ready for you to SSH or RDP into it.

We use this approach because it makes it easier to write automation scripts that contain multiple steps with dependencies (and need a prior task to have completed successfully before continuing).

If you do not need to wait on creation of a resource before continuing, you can use the `no-wait` option to start 
a create action in the background. You can continue using the CLI for other commands.

For example, the following usage of the `az vm create` starts a VM deployment and then return much more quickly (and before the VM
has fully booted):

```azurecli
az vm create -n MyLinuxVM2 -g MyResourceGroup --image UbuntuLTS --no-wait
```

Using the `--no-wait` approach can help you optimize the performance of your automation scripts considerably.

## Listing resources and formatting output

You can use the `list` command within the Azure CLI to find and list the resources running in Azure. 

Like with the create command, you can list resources using the Azure CLI 2.0 using a common `az <resource type name> list` naming pattern that is consistent across all resource types.  There are various output formats and query options available to filter and sort the list of resources in the way you prefer to see them.

For example, `az vm list` shows the list of all VMs you have.   

```azurecli
az vm list 
```
The values returned are by default in JSON (only showing partial output for sake of brevity).

```json
[
  {
    "availabilitySet": null,
    "diagnosticsProfile": null,
    "hardwareProfile": {
      "vmSize": "Standard_DS1_v2"
    },
    "id": "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010",
    "instanceView": null,
    "licenseType": null,
    "location": "westus2",
    "name": "MyLinuxVM",
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/demorg1/providers/Microsoft.Network/networkInterfaces/DemoVM010VMNic",
          "primary": null,
          "resourceGroup": "MyResourceGroup"
        }
      ]
    },
          ...
          ...
          ...   
]
```

You can optionally modify the output format using the `--output` option.  Run the `az vm list` command to see both the Linux and Windows Server VMs created earlier, along with the most common properties of a VM, using the easy to read *table* format option:

```azurecli
az vm list --output table
```

```Output
Name       ResourceGroup    Location
---------  ---------------  ----------
MyLinuxVM  MyResourceGroup  westus2
MyWinVM    MyResourceGroup  westus2
```

The *tsv* output option can be used to get a text-based, tab-separated format without any headers.  This format is useful when you 
want to pipe the output into another text-based tool like grep. 

```azurecli
az vm list --output tsv
```

```
None    None            /subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyLinuxVM        None    None    westus2 MyLinuxVM                   None        Succeeded       MyResourceGroup None                    Microsoft.Compute/virtualMachines       XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
None    None            /subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyWinVM  None    None    westus2 MyWinVM                 None    Succeeded       MyResourceGroup None                    Microsoft.Compute/virtualMachines       XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
```
Visit the [output formats](format-output-azure-cli.md) article to learn more about the additional ways to list resources and format the output.

## Querying resources and shaping outputs

Often you want to be able to query for only those resources that meet a specific condition.  

The `list` command has built-in support
that makes it easy to filter resources by Resource Group name.  For example, you can pass either a `--ResourceGroup` or `-g` parameter
to a `list` command to only retrieve those resources within a specific resource group:

```azurecli
az vm list -g MyResouceGroup --output table
```

```Output
Name       ResourceGroup    Location
---------  ---------------  ----------
MyLinuxVM  MyResourceGroup  westus2
MyWinVM    MyResourceGroup  westus2
```

For even more powerful querying support, you can use the `--query` parameter to execute 
a JMESPath query on the results of *any* `az` command.  JMESPath queries can be used both to filter as well
as shape the output of any returned result.

For example, execute the following command to query for any VM resource within any resource group that contains the letters "My":

```azurecli
az vm list --output table --query "[?contains(resourceGroup,'MY')]" 
```

```Output
ResourceGroup    ProvisioningState    Name       Location    VmId
---------------  -------------------  ---------  ----------  ------------------------------------
MYRESOURCEGROUP  Succeeded            MyLinuxVM  westus2     XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
MYRESOURCEGROUP  Succeeded            MyWinVM    westus2     XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
```

We could then choose to further refine the output by using the shaping capability of JMESPath queries to output different values
as well.  For example, the following command retrieves the type of OS disk the VM is using to determine whether the OS is Linux or Windows based:

```azurecli
az vm list --output table --query "[?contains(resourceGroup,'MY')].{ VMName:name,OSType:storageProfile.osDisk.osType }" 
```

```Output
VMName     OSType
---------  --------
MyLinuxVM  Linux
MyWinVM    Windows
```

The JMESPath support in Azure CLI is powerful.  Learn more about how to use it in our [query](query-azure-cli.md) article.

## Deleting resources

You can use the `delete` command within Azure CLI to delete the resources you no longer need. You can use the `delete` command with 
any resource just like you can with the `create` command.

```azurecli
az vm delete -n MyLinuxVM -g MyResourceGroup
```

By default the CLI prompts to confirm deletion.  You can suppress this prompt for automated scripts.

```Output
Are you sure you want to perform this operation? (y/n): y
EndTime                           Name                                  StartTime                         Status
--------------------------------  ------------------------------------  --------------------------------  ---------
2017-02-19T02:35:56.678905+00:00  5b74ab80-9b29-4329-b483-52b406583e2f  2017-02-19T02:33:35.372769+00:00  Succeeded
```

You can also use the `delete` command to delete many resources at a time. For example, the following command deletes all the 
resources in the "MyResourceGroup" resource group that we've used for all the samples in this Get Started tutorial.

```azurecli
az group delete -n MyResourceGroup
```

```Output
Are you sure you want to perform this operation? (y/n): y
```

## Get samples

To learn more about ways to use the Azure CLI, check out our most common scripts for
[Linux VMs](/azure/virtual-machines/virtual-machines-linux-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json),
[Windows VMs](/azure/virtual-machines/virtual-machines-windows-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json), 
[Web apps](/azure/app-service-web/app-service-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json),
and [SQL Database](/azure/sql-database/sql-database-cli-samples?toc=%2fcli%2fazure%2ftoc.json&bc=%2fcli%2fazure%2fbreadcrumb%2ftoc.json).

## Read the API reference docs

[API reference](/cli/azure)

## Get help

The Azure CLI has built-in help documentation, which matches our web documentation that you can run from the command line:

```azurecli
az [command-group [command]] -h
```

For example, to see what commands and subgroups are available for VMs, use:

```azurecli
az vm -h
```

To get help with the command to create a VM, use:

```azurecli
az vm create -h
```

## Switch from Azure CLI 1.0

If you already know how to use Azure CLI 1.0 (azure.js),
you'll notice places where the commands aren't quite the same.
Sometimes the commands to perform a task are significantly different.
To help you make the switch from Azure CLI 1.0 to Azure CLI 2.0,
we've started this [command mapping](https://github.com/Azure/azure-cli/blob/master/doc/azure2az_commands.rst).

## Send us your feedback

```azurecli
az feedback
```
