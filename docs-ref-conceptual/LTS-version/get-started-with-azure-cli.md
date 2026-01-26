---
title: Get started with Azure Command-Line Interface (CLI)
description: Learn how to get started with Azure CLI to manage Azure resources efficiently. This guide covers sign-in, essential commands, tab completion, and interactive mode.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cli, how to use azure cli, azure command line interface, azure cli commands, azure cli tutorial
---

# Get started with Azure CLI

Azure CLI is a cross-platform tool that simplifies managing Azure resources from the command line.
Optimized for automation and ease of use, it supports interactive sessions and scripting with
straightforward commands that integrate seamlessly with the Azure Resource Manager model. You can
start using it in your browser with [Azure Cloud Shell][cloudshell] or install it locally to use
from your preferred terminal.

## Install or run in Azure Cloud Shell

The easiest way to try Azure CLI is through [Azure Cloud Shell][get-started-cloudshell], a
browser-based shell with no installation required. Cloud Shell supports Bash and PowerShell and
comes with the latest version of Azure CLI preinstalled.

To install Azure CLI locally, see [How to install Azure CLI][install-azcli].

To check your version, run:

```azurecli-interactive
az version
```

## Sign in to Azure

To start using Azure CLI with a local install, sign in:

[!INCLUDE [interactive-login](includes/interactive-login.md)]

> [!IMPORTANT]
> [!INCLUDE [MFA](includes/multifactor-authentication.md)]

After you sign in, a list of your subscriptions appears. The one marked `isDefault: true` is
currently active. To change to a different subscription, run:

```azurecli-interactive
az account set --subscription "<subscription-id>"
```

## Find commands

Azure CLI commands are organized as command groups. Each group represents an area of an Azure
service. There are two options to find command groups:

- Use the [az find][az-find] command. For example, to search for command names containing `vm`, use
  the following example:

  ```azurecli-interactive
  az find vm
  ```

- Use the `--help` argument to get a complete list of subgroups within a reference group. The
  following example returns all subgroups for virtual machines:

  ```azurecli-interactive
  az vm --help
  ```

  The following example shows the relevant portion of the output.

  ```Output
  Subgroups:
    application            : Manage applications for VM.
    availability-set       : Group resources into availability sets.
    boot-diagnostics       : Troubleshoot the startup of an Azure Virtual Machine.
    ...
  ```

  The help output includes subgroups, parameters, authentication options, and examples.

  Here's another example that finds the Azure CLI commands for grouping virtual machines into
  availability sets, a _subgroup_ of `az vm`:

  ```azurecli-interactive
  az vm availability-set --help
  ```

  You can also use `--help` to get parameter lists and command examples for a reference _command_.

  ```azurecli-interactive
  az vm create --help
  ```

  Here is the relevant section of the example output:

  ```Output
  Arguments
      --name  [Required] : Name of the virtual machine.
      ...
  Authentication Arguments
      --admin-password   : Password for the VM if authentication type is 'Password'.
      --admin-username   : Username for the VM...
      ...
  Managed Service Identity Arguments
      ...
  Examples
      Create a VM from a custom managed image.
        az vm create -g MyResourceGroup -n MyVm --image MyImage
      ...
  ```

- Use the [reference index][reference-index] that lists all command groups alphabetically.

## Use tab completion

Azure CLI supports tab completion in Bash. To enable it in PowerShell, see
[Enable tab completion in PowerShell][tabbed-completion-pwsh].

## Understand global arguments

Common arguments available to most commands include:

|       Argument       |                          Description                          |
| -------------------- | ------------------------------------------------------------- |
| `--help`             | View command help                                             |
| `--output`           | Change output format: `json`, `jsonc`, `tsv`, `table`, `yaml` |
| `--query`            | Filter output using [JMESPath][jmespath]                      |
| `--verbose`          | Print more execution details                                  |
| `--debug`            | Show low-level REST calls for debugging                       |
| `--subscription`     | Specify subscription name or ID                               |
| `--only-show-errors` | Suppress noncritical output                                   |

## Use interactive mode

Run interactive mode with:

```azurecli-interactive
az interactive
```

Interactive mode launches an enhanced Azure CLI experience with inline help and command suggestions.
For more, see [Interactive Mode][interactive-mode].

An optional [VS Code extension][vs-code-extension] provides similar features with autocomplete and
hover tips.

## Provide feedback

We welcome your feedback. Submit issues on [GitHub][feedback] or run:

```azurecli-interactive
az feedback
```

<!-- link references -->

[cloudshell]: /azure/cloud-shell/overview
[get-started-cloudshell]: /azure/cloud-shell/get-started/classic
[install-azcli]: /cli/azure/install-azure-cli
[az-find]: /cli/azure/reference-index#az-find
[reference-index]: /cli/azure/reference-index
[tabbed-completion-pwsh]: ./install-azure-cli-windows.md#enable-tab-completion-in-powershell
[jmespath]: https://jmespath.org
[interactive-mode]: /cli/azure/reference-index#az-interactive
[vs-code-extension]: https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli
[feedback]: https://github.com/azure/azure-cli/issues
