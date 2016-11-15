---
title: Install the Azure CLI 2.0 'Preview' | Microsoft Docs
description: Reference docs for Azure CLI 2.0
keywords: Azure CLI 2.0 Preview, Azure CLI 2.0 Reference, Install Azure CLI 2.0, Azure Python CLI
author: erickson-doug
manager: douge
ms.author: douge
ms.date: 11/15/2016
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: azure-cli
ms.assetid: ea5c0ee1-c530-4a1e-a83f-e1be71f6d416
---

# Install the Azure CLI 2.0 'Preview'

## Install with interactive install script

For OSX and Linux, you can install using curl:

```command
 $ curl -L https://aka.ms/InstallAzureCli | sudo bash 
```

or using wget:

```command
$ wget -q -O - https://aka.ms/InstallAzureCli | bash
```

Some prerequisites may be required. See our [Preview Install Guide](https://github.com/Azure/azure-cli/blob/master/doc/preview_install_guide.md).

## Install with pip

For those familiar with pip, use the following command from the shell:

```command
$ pip install azure-cli
```

Some prerequisites may be required. See our [Preview Install Guide](https://github.com/Azure/azure-cli/blob/master/doc/preview_install_guide.md).

Enable tab completion with source `az.completion.sh.`

## Install with apt-get

A Debian/Ubuntu package is also available. Install it as follows:

```command
$ echo "deb https://apt-mo.trafficmanager.net/repos/azure-cli/ wheezy main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
$ sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
$ sudo apt-get install apt-transport-https
$ sudo apt-get update && sudo apt-get install azure-cli
```

## Install with Docker

We also maintain a docker image preconfigured with the Azure CLI.

```command
$ docker run -it azuresdk/azure-cli-python
```

For installation steps for common platforms, as well as dependency troubleshooting, please take a look at our [Preview Install Guide](https://github.com/Azure/azure-cli/blob/master/doc/preview_install_guide.md).

## Usage

`$ az [ group ] [ subgroup ] [ command ] {parameters}`

## Getting Started

After installation, use the `az configure` command to help setup your environment and get you logged in.

```command
$ az configure
```

For usage and help content, pass in the `-h` parameter, for example:

```command
$ az storage -h
$ az vm create -h
```

## Highlights
Here are a few features and concepts that can help you get the most out of the Azure CLI 2.0 'Preview'.
 
The following examples are showing using the `--output` table format. You can change your default using the `$ az configure` command.

### Tab Completion

We support tab-completion for groups, commands, and some parameters.

### Looking up resource group and name

```command
$ az vm show -g [tab][tab]
AccountingGroup   RGOne  WebPropertiesRG
$ az vm show -g WebPropertiesRG -n [tab][tab]
StoreVM  Bizlogic
$ az vm show -g WebPropertiesRG -n Bizlogic
```

### Querying

You can use the `--query` parameter and the JMESPath query syntax to customize your output.

```command
$ az vm list --query '[].{name:name,os:storageProfile.osDisk.osType}'
Name                    Os
----------------------  -------
storevm                 Linux
bizlogic                Linux
demo32111vm             Windows
dcos-master-39DB807E-0  Linux
```

### Creating a new Linux VM

The following block creates a new resource group in the 'westus' region, then creates a new Ubuntu VM. We automatically provide a series of smart defaults, such as setting up SSH with your `~/.ssh/id_rsa.pub` key. For more details, try `az vm create -h`.

```command
$ az resource group create -l westus -n MyGroup
Name     Location
-------  ----------
MyGroup  westus

$ az vm create -g MyGroup -n MyVM --image ubuntults
MacAddress         ResourceGroup    PublicIpAddress    PrivateIpAddress
-----------------  ---------------  -----------------  ------------------
00-0D-3A-30-B2-D7  MyGroup          52.160.111.118     10.0.0.4

$ ssh 52.160.111.118
Welcome to Ubuntu 14.04.4 LTS (GNU/Linux 3.19.0-65-generic x86_64)

System information as of Thu Sep 15 20:47:31 UTC 2016

System load: 0.39              Memory usage: 2%   Processes:       80
Usage of /:  39.6% of 1.94GB   Swap usage:   0%   Users logged in: 0

myaccount@MyVM:~$
```

## More Samples and Snippets
For more usage examples, take a look at our [GitHub samples repo](http://github.com/Azure/azure-cli-samples).

## Reporting issues and feedback
If you encounter any bugs with the tool please file an issue in the [Issues](https://github.com/Azure/azure-cli/issues) section of our GitHub repo.
To provide feedback from the command line, try the `az feedback` command.
