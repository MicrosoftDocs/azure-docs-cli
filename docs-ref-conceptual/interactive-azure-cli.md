---
title: Learn to use Azure CLI interactive mode | Microsoft Docs
description: The Azure CLI interactive mode is an interactive shell with autocompletion, command descriptions, and examples. 
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/2/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
Keywords: azure cli interactive mode
---

# Azure CLI interactive mode

You can use Azure CLI in interactive mode by running the `az interactive` command.  The Azure CLI interactive mode places you in an interactive shell with autocompletion, command descriptions, and examples.

![interactive mode](./media/interactive-azure-cli/webapp-create.png)

> [!NOTE]
> We're not using the default style here, which doesn't read as well on a black background.

If you're not already signed in to your account, use the `login` command.

## What is the Azure CLI interactive mode?

Azure CLI Interactive Mode (az interactive) provides users an interactive environment to run Azure CLI commands. The interactive mode makes it easier for you to learn the Azure CLI’s capabilities, command syntax, and output formats. It provides autocompletion dropdowns, autocached suggestions combined with runtime documentation, and includes examples about how each command is used. Azure CLI Interactive Mode aims to provide an ideal experience for users learning to use Azure CLI commands. 

## Configure

Interactive mode optionally displays command descriptions, parameter descriptions, and command examples.
Turn descriptions and examples on or off using `F1`.

![Descriptions and examples on/off](./media/interactive-azure-cli/descriptions-and-examples.png)

You can turn the display of parameter defaults on or off using `F2`.

![Display parameter default on/off](./media/interactive-azure-cli/defaults.png)

`F3` toggles the display of some key gestures.

![Key gestures toggle](./media/interactive-azure-cli/gestures.png)

## Scope

You can scope your interactive mode to a specific command group like `vm` or `vm image`.
When you do, all commands are interpreted in that scope.
It's a great shorthand if you're doing all your work in that command group.

Instead of typing these commands:

```azurecli
az>> vm create -n myVM -g myRG --image Ubuntu2204
az>> vm list -o table
```

You can scope to the vm command group and type these commands:

```azurecli
az>> %%vm
az vm>> create -n myVM -g myRG --image Ubuntu2204
az vm>>list -o table
```

You can scope to lower-level command groups as well.
You could scope to `vm image` using `%%vm image`.
In this case, since we're already scoped to `vm`, we would use `%%image`.

```azurecli
az vm>> %%image
az vm image>>
```

At that point, we can pop the scope back up to `vm` using `%%..`,
or we can scope to the root with just `%%`.

```azurecli
az vm image>> %%
az>>
```

## Query

You can execute a JMESPath query on the results of the last command that you executed by using `??`followed by a JMESPath query.
For example, after you created a group, you can retrieve the id of the new group.

```azurecli
az>> group create -n myRG -l westEurope
az>> "?? id"
```

You can also use this syntax to use the result of the previous command as an argument for your next command.*
For instance after having listed all groups, list all the resources of type `virtualMachine`on the first group whose location is westeurope. 

```azurecli
az>> vm create --name myVM --resource-group myRG --image Ubuntu2204 --no-wait -o json
az>> group list -o json
az>> resource list -g "?? [?location=='westeurope'].name | [0]" --query "[?type=='Microsoft.Compute/virtualMachines'].name
```

To learn more about querying the results of your commands,
see [Query command results with the Azure CLI](query-azure-cli.md).

## Bash commands

You can run shell commands without leaving interactive mode using `#[cmd]`.

```azurecli
az>> #dir
```

## Examples

Some commands have lots of examples.
You can scroll to the next page of examples using `CTRL-N` and the previous page using `CTRL-Y`.

![Scroll to next page of examples](./media/interactive-azure-cli/examples.png)

You can also look at a specific example using `::#`.

```azurecli
az>> vm create ::8
```
