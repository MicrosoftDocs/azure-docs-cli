---
title: Azure CLI 2.0 Alias Extension
description: Using the Azure CLI Alias Extension
keywords: Azure CLI, Extensions, Alias
author: aaroney
ms.author: aaroney
manager: routlaw
ms.date: 03/14/2018
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Azure CLI Alias Extension

The extension allows users to define their own custom command alias in the Azure CLI based on existing commands. The motivation behind this is to introduce a fast, concise, and customizable way to interact with the Azure CLI, simplifying workflow, as well as boosting the productivity of our customers.

> [!Note]
> The Alias Extension is in public preview: the features and the configuration file format are subject to change.

## Installing the Alias Extension
**2.0.28** is the minimum version of the Azure CLI that is compatible with the alias extension. To check the version of your CLI, simply run `az --version`. A detailed guide to updating your Azure CLI can be found [here](./install-azure-cli.md).

After updating your Azure CLI to the latest version, you can run the following command to install the extension:
```
az extension add --name alias
```

To verify your installation:
```
az extension list --output table
```

The command above will output a list of installed extensions in your CLI:
```
ExtensionType    Name                       Version
---------------  -------------------------  ---------
whl              alias                      0.2.0
```

## Working with the Alias Extension
To start creating your custom aliases, you will have to first create a configuration file named `alias` (without any file extension) under the `.azure` folder. `.azure` is a hidden folder under your home directory that stores CLI-related configurations and settings. To create an empty alias configuration file, you can run the following commands depending on your operating system:

- macOS / Ubuntu / Azure Cloud Shell / Bash on Windows
```
touch $HOME/.azure/alias
```
- Windows (Command Prompt)
```
type nul > %HOMEPATH%/.azure/alias
```

All of your alias definitions will be stored in the alias configuration file. The configuration file is based on the INI configuration format and has the following additional rules when defining aliases:
- Each alias has a section named "command", which contains the Azure CLI commands to which the alias maps.
- Each alias can contain multiple commands in the command section.
- An alias and its command can contain placeholders that accept positional arguments. Placeholders are delimited by double braces (i.e., `{{}}`). Each replacement field contains a number and a variable name.
- With Python 3 installed on your system, duplicated aliases or duplicated commands in a single alias are not allowed.
- With Python 2 installed on your system, in case of a duplicated alias/command, the latter alias/command will take precedence.
- Error parsing the alias configuration will lead to inability to use the alias feature.

## Features Demonstrations

![Demo 1](./media/azure-cli-alias-extension/azure-cli-alias-demo-1.gif)
![Demo 1](./media/azure-cli-alias-extension/azure-cli-alias-demo-2.gif)

### Simple Aliases

The first use case of the extension is to shorten existing commands. Below is an example of the alias configuration file containing three aliases, `c`, `ac`, and `ls`, each maps to a different command.
```
[c]
command = create

[ac]
command = account

[ls]
command = list
```
After setting up your alias configuration file, you can execute the following commands for verification.
```bash
# Equivalent to 'az group create --name TestRG1 --location "South Central US"'
az group c --name TestRG1 --location "South Central US"

# Equivalent to 'az account list --output table'
az ac ls --output table
```
The first command creates a resource group named `TestRG1` in `South Central US`, whereas the second command outputs a list of subscriptions for the logged in account.

### Complex Aliases
The second use case is to compress long, redundant, and verbose commands into a single alias.
```
[create-rgrp]
command = group create --name myResourceGroup --location eastus --tags owner=$USER

[create-vm]
command = vm create --resource-group myResourceGroup --name myVM --image UbuntuLTS --generate-ssh-keys

[get-vm-ip-addr]
command = vm list-ip-addresses --resource-group myResourceGroup --name myVM --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress"
```
You can use the aliases defined above to create a resource group named `myResourceGroup` in the eastus location, create a virtual machine in `myResourceGroup` named `myVM`, and obtain the public IP address of the virtual machine using `get-vm-ip-addr`.

> [!Note]
> Well-defined environment variables can be referenced in the configuration file, shown in the command section of the first alias.

```bash
# Equivalent to 'az group create --name myResourceGroup --location eastus --tags owners=alice'
az create-rgrp

# Equivalent to 'az vm create --resource-group myResourceGroup --name myVM --image UbuntuLTS --generate-ssh-keys'
az create-vm

# Equivalent to 'az vm list-ip-addresses --resource-group myResourceGroup --name myVM --query "[0].virtualMachine.network.publicIpAddresses[0].ipAddress"'
az get-vm-ip-addr
```

### Positional Arguments

Positional arguments enable you to pass in custom arguments to your aliases. For example, in your alias configuration file:

```
[create-storage-ac {{ rg }} {{ name }}]
command = storage account create --resource-group {{ rg }} --name {{ name }}

[create-storage-container {{ container_name }}]
command = storage container create --name {{ container_name }}

[upload {{ local_path }} {{ container_name }}]
command = storage blob upload-batch --source {{ local_path }} --destination {{ container_name }}
```
You can execute the following commands to create a storage account and a storage container, as well as uploading local files to a given storage container. Note that the positional arguments are spaced-delimited, meaning for each positional argument, it cannot contain any spaces. If you would like to pass in a positional argument with spaces, you will have to surround the argument with a pair of quotes.
```bash
# Equivalent to 'az storage account create --resource-group myResourceGroup --name mystoragesccount'
az create-storage-ac myResourceGroup mystoragesccount

# Save the storage account name as an environment variable
# macOS / Ubuntu / Azure Cloud Shell / Bash on Windows
export AZURE_STORAGE_ACCOUNT=mystoragesccount
# Windows (cmd.exe)
set AZURE_STORAGE_ACCOUNT=mystoragesccount

# Equivalent to 'storage container create --name mycontainer'
az create-storage-container mycontainer

# Equivalent to 'storage blob upload-batch --source mylocalfolder --destination mycontainer'
az upload mylocalfolder mycontainer
```

Since the alias extension utilizes the Jinja template engine, you can also perform additional string processing to the positional arguments that you pass in. For example:
```
[storage-ls {{ url }}]
command = storage blob list
    --account-name {{ url.replace('https://', '').split('.')[0] }}
    --container-name {{ url.replace('https://', '').split('/')[1] }}
```

The `storage-ls` alias basically accepts a storage container URL, and uses the `replace` and `split` string functions to extract the account name and the container name from the URL.

```bash
# Equivalent to 'storage blob list --account-name mystorageaccount --container-name mycontainer'
az storage-ls https://mystorageaccount.blob.core.windows.net/mycontainer
```

For syntax references, you can check out the Jinja documentation [here](http://jinja.pocoo.org/docs/2.10/templates/).

## Uninstalling the Alias Extension
To uninstall the extension, you can execute the following commands:
```bash
az extension remove --name alias
```