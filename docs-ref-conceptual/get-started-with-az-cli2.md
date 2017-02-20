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

The Azure CLI 2.0 is Azure's new command line experience for managing Azure resources. It can be used on macOS, Linux, and Windows. 

Azure CLI 2.0 is optimized for managing and administering Azure resources from the command line, as well as for building 
automation scripts that work against the Azure Resource Manager.  This article will help get you started using it, and teach
you the core concepts behind it.

## Install Azure CLI

The first step will be to make sure you have the latest version of the Azure CLI installed:

1. [Install Azure CLI 2.0](install-az-cli2.md)
on whatever platform you use.

2. To verify the installation was successful, run `az --version` from your command line. 

You should see the version number of Azure CLI and other dependent libraries installed on your computer.  
  
If you get an error, there was likely a problem installing the CLI. Review the "Installation Troubleshooting" section of [Azure CLI 2.0 installation documentation](install-az-cli2.md#Installation Troubleshooting) 
for guidance, or post a comment in the discussion at the bottom of that page for help.

## Login to Azure

Now that you have the Azure CLI 2.0 installed, your next step will be to securely connect it with your Azure account. To do this,
use the `az login` command.

3. Run the following command from the command-line.

    ```azurecli
    az login
    ```
   This will output a code to use in the next step. 

  1. Use a web browser to open the page [https://aka.ms/devicelogin](https://aka.ms/devicelogin) and enter the code.
  
  You will then be prompted to log in using your Azure credentials.

  2. Log in.

  Now you can run commands from the Azure CLI 2.0 on the Azure resources and services available to your account.

## Create a Resource Group

Now that we've got everything setup, let's use the Azure CLI to create some new resources within Azure.

We'll first create a new Resource Group.  Resource Groups in Azure provide a way to manage multiple resources that you 
want to logically group together.  For example, you might create a Resource Group for a particular application or project you
are working on and add a virtual machine, a database and a CDN service within it.

Let's create a new resource group named "MyResourceGroup" in the *westus2* region of Azure.  Type the following command to do so:

```azurecli
az group create -n MyResourceGroup -l westus2 
```

Once the resource group has been created, the `az group create` command will output several properties of the newly created resource:

```Output
{
  "id": "/subscriptions/79d35904-6ebb-471a-93c0-4e81261b8077/resourceGroups/MyResourceGroup",
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

You can create a Linux VM using the popular UbuntuLTS image with the following command:

```azurecli
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS --size Standard_DS1_v2
```

When you run the above command, the Azure CLI 2.0 will look for an SSH key pair stored under your ~/.ssh directory.  If you don't already 
have a SSH key pair stored there you can ask the Azure CLI to automatically create one for you by passing the --generate-ssh-keys parameter:

```azurecli
az vm create -n MyLinuxVM -g MyResourceGroup --image UbuntuLTS --size Standard_DS1_v2 --generate-ssh-keys
```

The `az vm create` command will return once the VM has been fully created and is ready to be accessed and used. The `az vm create` command
outputs several properties of the newly create VM including its public IP address once it completes:

```Output
{
  "fqdns": "",
  "id": "/subscriptions/79d35904-6ebb-471a-93c0-4e81261b8077/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyLinuxVM",
  "location": "westus2",
  "macAddress": "00-0D-3A-F7-40-B6",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.4",
  "publicIpAddress": "52.175.211.81",
  "resourceGroup": "MyResourceGroup"
}
```

Now that the VM has been created, you can logon using **ssh** with the public IP address of the VM you just created:

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

my-login@MyLinuxVM:~$
```

## Create a Windows Server Virtual Machine

Let's now create a new Windows Server 2012 R2 based VM using the `az vm create` command and add it to the same "MyResourceGroup" resource group that
we used for our Linux VM.

Note that Azure requires that you avoid using easily guessed usernames/passwords, and so there are specific rules for what 
characters can be used in the username and password of your Windows VMs, as well as the minumum length of both.  Please substitute your own username/password below 
when running the below command.

```azurecli
az vm create -n MyWinVM -g MyResourceGroup --image Win2012R2Datacenter --admin-username adminku3r --admin-password p_l33mm0rd --size Standard_DS1_v2
```

The `az vm create` command will return once the VM has been fully created and is ready to be accessed and used.

```Output
{
  "fqdns": "",
  "id": "/subscriptions/79d35904-6ebb-471a-93c0-4e81261b8077/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyWinVM",
  "location": "westus2",
  "macAddress": "00-0D-3A-F7-78-41",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.5",
  "publicIpAddress": "52.183.47.216",
  "resourceGroup": "MyResourceGroup"
}
```

You can then logon to your newly created Windows Server VM using Remote Desktop and the public IP address of the VM (which is returned in the output above).  
If you are on a Windows based system you can do this from the command-line using the mstsc command:

```azurecli
mstsc /v:52.183.47.216
```

You will need to supply the same username/password combination you used when creating the VM to login.

## Creating other resources in Azure

We've now walked through how to create a Resource Group, a Linux VM, and a Windows Server VM. You can 
create many other types of Azure resources as well.  

All of the new resources you create using the Azure CLI 2.0 will be done so using a consistent `az <resource type name> create` naming pattern.  For example, 
to create a new Azure Network Load Balancer that we could then associate with our newly created VMs, we can use the following create command:

```azurecli
az network lb create -n MyLoadBalancer -g MyResourceGroup
```

We could also create a new private Virtual Network (commonly referred to a a "VNet" within Azure) for our infrastructure using the following create command:

```azurecli
az network vnet create -n MyVirtualNetwork -g MyResourceGroup --address-prefix 10.0.0.0/16
```

What makes Azure and the Azure CLI really powerful is that we can use it not just to get cloud-based infrastructure, but also to
create managed platform services as well that we can optionally combine with infrastructure to build even more powerful solutions.

For example, you can use the Azure CLI to create an Azure AppService (which is a managed platform service that provides a great way 
host web apps without having to worry about infrastructure) and then create two new Web Apps within it using the following create commands:

```azurecli
# Create an Azure AppService that we can host any number of web apps within
az appservice plan create -n MyAppServicePlan -g MyResourceGroup

# Create Two Web Apps within the AppService (note: name param must be a unique DNS entry)
az appservice web create -n MyWebApp43432 -g MyResourceGroup --plan MyAppServicePlan 
az appservice web create -n MyWebApp43433 -g MyResourceGroup --plan MyAppServicePlan 
```

Once you understand the basics of the `az <resource type name> create` pattern, it becomes easy to create anything. Below are 
some popular Azure resource types and the appropriate Azure CLI create command to create them:

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

Please visit the Reference documentation to learn more about the additional resource specific 
parameters that you can pass to each of the above create commands, as well as about other resource types in Azure that you can create. 

## Useful tip: Optimizing create operations using --no-wait

By default when you create resources using the Azure CLI 2.0, the `az <resource type name> create` command will wait until the 
resource has been created and is ready for you to use.  For example, if you create a VM, the `az vm create` command will by default
not return until the VM is created and is ready for you to SSH or RDP into it.

We use this approach because it often makes it easier to write automation scripts that contain multiple steps that might 
depend on each other (and need a prior task to have completed successfully before continuing).

If you do not need to wait on a resource to have been fully created before continuing, you can use the `no-wait` option to start 
a create action in the background and continue using the CLI for other commands.

For example, the below usage of the `az vm create` will start a VM deployment and then return much more quickly (and before the VM
has fully booted):

```azurecli
az vm create -n MyLinuxVM2 -g MyResourceGroup --image UbuntuLTS --no-wait
```

Using the `--no-wait` approach can help you optimize the performance of your automation scripts considerably.

## Listing resources and formatting output

You can use the `list` command within the Azure CLI to find and list the resources you have running in Azure. 

Like with the create command, you can list resources using the Azure CLI 2.0 using a common `az <resource type name> list` naming pattern that is
consistent across all resource types.  There are various output formats and query options available to filter and sort the list of resources in the way you prefer to see them.

For example, `az vm list` will show the list of all VMs you have.   

```azurecli
az vm list 
```
The values returned are by default in JSON, and look like below (only showing partial output for sake of brevity).

```json
[
  {
    "availabilitySet": null,
    "diagnosticsProfile": null,
    "hardwareProfile": {
      "vmSize": "Standard_DS1_v2"
    },
    "id": "/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/DEMORG1/providers/Microsoft.Compute/virtualMachines/DemoVM010",
    "instanceView": null,
    "licenseType": null,
    "location": "westus2",
    "name": "MyLinuxVM",
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/ff696af2-840a-43d1-af03-8f78cdfb5185/resourceGroups/demorg1/providers/Microsoft.Network/networkInterfaces/DemoVM010VMNic",
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

You can optionally modify the output format using the `--output` option.  Run the `az vm list` command below to see both the Linux and Windows Server VMs we created earlier using the easy to read *table* format option
(where by default we only show the most common properties):

```azurecli
az vm list --output table
```

```Output
Name       ResourceGroup    Location
---------  ---------------  ----------
MyLinuxVM  MyResourceGroup  westus2
MyWinVM    MyResourceGroup  westus2
```

The *tsv* output option can be used to get a text-based, tab-separated format without any headers (which ends up being useful when you 
want to pipe the output into another text based tool like grep). 

```azurecli
az vm list --output tsv
```

```Output
None    None            /subscriptions/79d35904-6ebb-471a-93c0-4e81261b8077/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyLinuxVM        None    None    westus2 MyLinuxVM                   None        Succeeded       MyResourceGroup None                    Microsoft.Compute/virtualMachines       e4858940-f06d-4152-ad81-619903f61917
None    None            /subscriptions/79d35904-6ebb-471a-93c0-4e81261b8077/resourceGroups/MyResourceGroup/providers/Microsoft.Compute/virtualMachines/MyWinVM  None    None    westus2 MyWinVM                 None    Succeeded       MyResourceGroup None                    Microsoft.Compute/virtualMachines       2ad8bdae-0971-4f7c-ad4a-afd097c7f480
```
Please visit the Output formats documentation to learn more about the additional ways you can list resources and format the output.

## Querying resources and shaping outputs

Often you want to be able to query for only those resources that meet a specific condition.  

The `list` command has built-in support
that makes it easy to filter resources by ResourceGroup name.  For example, you can pass either a `--ResourceGroup` or `--g` parameter
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

For even more powerful querying support you can use the the `--query` parameter to execute 
a JMESPath query on the results of *any* `az` command.  JMESPath queries can be used both to filter as well
as shape the output of any returned result.

For example, execute the command below to query for any VM resource within a resource group that contains the letters "My" (meaning it would
return not just resources within "MyResourceGroup" but also anything within "MyResourceGroup2"):

```azurecli
az vm list --output table --query "[?contains(resourceGroup,'MY')]" 
```

```Output
ResourceGroup    ProvisioningState    Name       Location    VmId
---------------  -------------------  ---------  ----------  ------------------------------------
MYRESOURCEGROUP  Succeeded            MyLinuxVM  westus2     e4858940-f06d-4152-ad81-619903f61917
MYRESOURCEGROUP  Succeeded            MyWinVM    westus2     2ad8bdae-0971-4f7c-ad4a-afd097c7f480
```

We could then choose to further refine the output by using the shaping capability of JMESPath queries to output different values
as well.  For example, the below command will change the output so that instead of the standard columns displayed we can
navigate into the returned output to retrieve the type of OS disk the VM is using to determine whether the OS is Linux
or Windows based:

```azurecli
az vm list --output table --query "[?contains(resourceGroup,'MY')].{ VMName:name,OSType:storageProfile.osDisk.osType }" 
```

```Output
VMName     OSType
---------  --------
MyLinuxVM  Linux
MyWinVM    Windows
```

The JMESPath support in Azure CLI is very powerful.  Learn more about how to use it in our [query](query-az-cli2.md) article.

## Deleting resources

You can use the `delete` command within Azure CLI to delete the resources you no longer need. You can use the `delete` command with 
any resource just like you can with the `create` command.

```azurecli
az vm delete -n MyLinuxVM -g MyResourceGroup
```

By default the CLI will prompt to ensure you really want to delete it (you can supress this for automated scripts):

```Output
Are you sure you want to perform this operation? (y/n): y
EndTime                           Name                                  StartTime                         Status
--------------------------------  ------------------------------------  --------------------------------  ---------
2017-02-19T02:35:56.678905+00:00  5b74ab80-9b29-4329-b483-52b406583e2f  2017-02-19T02:33:35.372769+00:00  Succeeded
```

You can also use the `delete` command to delete many resources at a time. For example, the following command deletes all the 
resources in the "MyResourceGroup" resource group that we've used for all of the samples in this Get Started tutorial.

```azurecli
az group delete -n MyResourceGroup
```

```
Are you sure you want to perform this operation? (y/n): y
```

Run the command above and it will ensure that everything you've created as part of this Get Started tutorial is cleaned-up and gone.

## Get samples

To learn more about ways to use the Azure CLI, check out our most common scripts for [Linux Virtual Machines](/azure/virtual-machines/virtual-machines-linux-cli-samples?toc=%2fcli%2fazure%2ftoc.json), [Web apps](/azure/app-service/app-service-cli-samples?toc=%2fcli%2fazure%2ftoc.json), and [SQL Database](/azure/sql-database/sql-database-cli-samples?toc=%2fcli%2fazure%2ftoc.json).

## Read the API reference docs

[API reference](/cli/azure)

## Get help

The Azure CLI has built-in help documentation that you can run from the command-line:

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

## Manage multiple Azure Subscriptions

If you are brand new to Azure, you will only have a single subscription and you can skip this section.

If you have been using Azure for awhile, though, you might have created multiple Azure subscriptions to manage different projects under. 
If so, you can configure Azure CLI 2.0 to execute commands against a particular subscription.

To do this, run the `az account list` command to get a list of all subscriptions in your account. 

```azurecli
az account list --output table
```

```Output
Name                                         CloudName    SubscriptionId                        State     IsDefault
-------------------------------------------  -----------  ------------------------------------  --------  -----------
My Producton Subscription                    AzureCloud   1c638cf4-608f-4ee6-b680-c329e824c3a8  Enabled
My DevTest Subscription                      AzureCloud   b6aa872b-f6a7-4cdc-bbc6-0fce6a8b9910  Enabled   True
My Demos                                     AzureCloud   ff696af2-840a-43d1-af03-8f78cdfb5185  Enabled
```

The IsDefault property in the table above indicates which is the default subscription your Azure CLI commands will run against.

To select a different subscription as the default, use the `az account set` command. 

```azurecli
az account set --subscription "My Demos"
```

You can verify the change by runnng the `az account list --output table` command again.

Once you set your default subscription, all subsequent Azure CLI commands will run against this subscription.

## Send us your feedback

```azurecli
az feedback
```
