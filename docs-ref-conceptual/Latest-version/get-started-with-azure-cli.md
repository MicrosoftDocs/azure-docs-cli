---
title: Get started with Azure Command-Line Interface (CLI)
description: Learn how to get started with Azure CLI to manage Azure resources efficiently. This guide covers sign-in, essential commands, tab completion, and interactive mode.
ms.topic: concept-article
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

For more information about subscription selection, see
[Manage Azure subscriptions][manage-azure-subscriptions]. For advanced sign-in options, see
[Sign in with Azure CLI][sign-into-azcli].

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

## Explore samples and articles

For usage examples, see:

- The [Samples index][samples-index] for Azure CLI examples by [subject][samples-by-subject],
  [reference group][samples-by-reference], or [GitHub repo][samples-by-github].
- The [Article index][article-index] to find in-depth guides. Use your keyboard `find` shortcut
  keys, like `Ctrl + F`, to quickly find the reference command group in which you're interested. For
  example, the article index for `az vm` looks like the following table:

  |               Reference subgroup               |                                    Azure CLI article showing reference use                                     |
  | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
  | [az vm](/cli/azure/vm)                         | [Output formats for Azure CLI commands](/cli/azure/format-output-azure-cli)                                    |
  |                                                | [How to use variables in Azure CLI commands](/cli/azure/azure-cli-variables)                                   |
  |                                                | [Get VM information with queries](/cli/azure/azure-cli-vm-tutorial-4)                                          |
  |                                                | {More articles listed here.}                                                                                   |
  | [az vm aem](/cli/azure/vm/aem)                 | [New Version of Azure VM extension for SAP solutions](/azure/sap/workloads/vm-extension-for-sap-new)           |
  |                                                | [Standard Version of Azure VM extension for SAP solutions](/azure/sap/workloads/vm-extension-for-sap-standard) |
  | [az vm application](/cli/azure/vm/application) | {...}                                                                                                          |

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

For more information, see [Output formats][outputs-format] and [Query results][query-results].

## Use interactive mode

Run interactive mode with:

```azurecli-interactive
az interactive
```

Interactive mode launches an enhanced Azure CLI experience with inline help and command suggestions.
For more, see [Interactive Mode][interactive-mode].

An optional [VS Code extension][vs-code-extension] provides similar features with autocomplete and
hover tips.

## Learn through tutorials and quickstarts

Get hands-on with Azure CLI basics using the [onboarding tutorial][onboarding-tutorial]. You learn
how to:

- [Manage your default subscription][manage-default-sub]
- [Create resources with randomized names][resource-random-name]
- [Use environment variables][environment-variables]
- [Debug commands and parse JSON files][debug]
- [Delete resources efficiently][delete-resources]

> [!NOTE]
> Azure CLI examples on Microsoft Learn are written for Bash. One-liners usually work across shells,
> but multiline scripts may require adjustments. For more information, see
> [Learn syntax differences between Bash, PowerShell, and Cmd][syntax-diffs]

## Provide feedback

We welcome your feedback. Submit issues on [GitHub][feedback] or run:

```azurecli-interactive
az feedback
```

## See also

- [Onboarding cheat sheet][cheatsheet]
- [Azure CLI tutorial][onboarding-tutorial]
- [Use Azure CLI in Bash][bash]
- [PowerShell considerations][powershell]

<!-- link references -->

[cloudshell]: /azure/cloud-shell/overview
[get-started-cloudshell]: /azure/cloud-shell/get-started/classic
[install-azcli]: /cli/azure/install-azure-cli
[manage-azure-subscriptions]: manage-azure-subscriptions-azure-cli.md
[sign-into-azcli]: authenticate-azure-cli.md#sign-into-azure-with-azure-cli
[az-find]: /cli/azure/reference-index#az-find
[reference-index]: /cli/azure/reference-index
[samples-index]: ./samples-index.md
[samples-by-subject]: ./samples-index.md?tabs=service
[samples-by-reference]: ./samples-index.md?tabs=command
[samples-by-github]: ./samples-index.md?tabs=github
[article-index]: ./reference-docs-index.md
[tabbed-completion-pwsh]: ./install-azure-cli-windows.md#enable-tab-completion-in-powershell
[jmespath]: https://jmespath.org
[outputs-format]: format-output-azure-cli.md
[query-results]: use-azure-cli-successfully-query.md
[interactive-mode]: /cli/azure/reference-index#az-interactive
[vs-code-extension]: https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli
[onboarding-tutorial]: ./get-started-tutorial-0-before-you-begin.md
[manage-default-sub]: ./get-started-tutorial-1-prepare-environment.md#find-and-change-your-active-subscription
[resource-random-name]: ./get-started-tutorial-1-prepare-environment.md#create-a-resource-group-containing-a-random-id
[environment-variables]: ./get-started-tutorial-1-prepare-environment.md#set-environment-variables
[debug]: ./use-azure-cli-successfully-troubleshooting.md#the---debug-parameter
[delete-resources]: ./get-started-tutorial-4-delete-resources.md#delete-multiple-azure-resources-using-a-script
[syntax-diffs]: ./get-started-tutorial-2-environment-syntax.md
[feedback]: https://github.com/azure/azure-cli/issues
[cheatsheet]: ./cheat-sheet-onboarding.md
[bash]: ./use-azure-cli-successfully-bash.md
[powershell]: ./use-azure-cli-successfully-powershell.md
