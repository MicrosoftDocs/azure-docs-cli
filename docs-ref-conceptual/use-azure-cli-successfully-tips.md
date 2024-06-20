---
title: Tips for using the Azure CLI | Microsoft Docs
description: Learn tips for using Azure CLI successfully, such as output formats, passing parameter values, and quoting rules for different shells.
ms.date: 06/21/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli, linux-related-content
---

# Tips for using the Azure CLI successfully

Azure CLI is a command-line tool that allows you to configure and manage Azure resources from many shell environments. After you [choose your preferred shell environment](./choose-the-right-azure-command-line-tool.md#different-shell-environments) and [install the Azure CLI](./install-azure-cli.md), use this article to discover useful tips on how to avoid common pitfalls and use the Azure CLI successfully.

To learn more about specific Azure CLI commands, see the [Azure CLI Reference list](../latest/docs-ref-autogen/reference-index.yml).

## Choose a scripting language

The Azure CLI is an open source _tool_ that you can run in many _scripting languages_.

* It is the scripting language that determines the quoting, escape character, and line continuation rules for Azure CLI commands.
* You cannot easily copy Azure CLI command syntax _containing single or double quotes, escape characters or line continuation characters_ from a Bash scripting language to a PowerShell scripting language.
* **Most Microsoft documentation for the Azure CLI is written and tested in Bash.** 
* If PowerShell is your scripting language of choice, consider using the tool, [Azure PowerShell](/powershell/azure/), which has native [PowerShell](/powershell/) scripting language functionality.

For more information on scripting language options for Azure CLI, see [Choose the right command-line tool](./choose-the-right-azure-command-line-tool.md).

## FAQ

Here are some links to help you answer the most frequently asked Azure CLI questions:

| Subject area with article link | Tip |
|-|-|
| [Authentication]() | Find answers to questions on WAM and MFA.
| [Configuration settings]() | Learn how to turn on/off Azure CLI features and set default values.
| [Output format](./format-output-azure-cli.md) | Your command output determines how secrets are protected and the format returned by the `--query` parameter.
| [Support lifecycle](./azure-cli-support-lifecycle.md) | Information on supported operating systems, scripting languages and end of life (EOL).
| [Command type and status](./reference-types-and-status.md) | 
| [List of Azure CLI reference groups](./reference-docs-index.md) | A to Z list of Azure CLI reference groups with drill down to subgroups and commands.
| [List of Azure CLI articles](/cli/azure/reference-index) | A to Z list of Quickstarts, How-to guides, Tutorials using Azure CLI reference commands.
| [List of Azure CLI samples](./samples-index.md) | A to Z list of Samples, including those in Azure-samples/azure-cli-samples GitHub repository.
| [Troubleshooting](./use-azure-cli-successfully-troubleshooting.md) | Find error output cause and remediation tips.


## Pass values to another command

If the value is used more than once, assign it to a variable. Variables allow you to use values more than once or to create more general scripts.  This example assigns an ID found by the [az vm list](/cli/azure/vm#az-vm-list) command to a variable.

  ```azurecli
  # assign the list of running VMs to a variable
  running_vm_ids=$(az vm list --resource-group MyResourceGroup --show-details \
      --query "[?powerState=='VM running'].id" --output tsv)

  # verify the value of the variable
  echo $running_vm_ids
  ```

If the value is used only once, consider piping. (Piping passes the output of one command as input to a second command.)

  ```azurecli
  az vm list --query "[?powerState=='VM running'].name" --output tsv | grep my_vm
  ```

For multi-value lists, consider the following options:

1. If you need more controls on the result, use a "for" loop:

  ```azurecli
  #!/usr/bin/env bash
  for vmList in $(az vm list --resource-group MyResourceGroup --show-details --query "[?powerState=='VM running'].id"   -output tsv); do
      echo stopping $vmList
      az vm stop --ids $vmList
      if [ $? -ne 0 ]; then
          echo "Failed to stop $vmList"
          exit 1
      fi
      echo $vmList stopped
  done
  ```

1. Alternatively, use `xargs` and consider using the `-P` flag to run the operations in parallel for improved performance:

  ```azurecli
  az vm list --resource-group MyResourceGroup --show-details \
      --query "[?powerState=='VM stopped'].id" \
      --output tsv | xargs -I {} -P 10 az vm start --ids "{}"
  ```

1. Finally, Azure CLI has built-in support to process commands with multiple `--ids` in parallel to achieve the same effect of xargs. `@-` is used to get values from the pipe:

  ```azurecli
  az vm list --resource-group MyResourceGroup --show-details \
      --query "[?powerState=='VM stopped'].id" \
      --output tsv | az vm start --ids @-
  ```

For more information on using Bash constructs with the Azure CLI including loops, case statements, if..then..else, and error handling, see [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md).

## Common update parameters

Azure CLI command groups often feature an update command. For instance, [Azure Virtual Machines](/cli/azure/vm) includes the [az vm update](/cli/azure/vm#az-vm-update) command. Most update commands offer the three common parameters: `--add`, `--set`, and `--remove`.

The `--set` and `--add` parameters take a list of space-separated key-value pairs: `key1=value1 key2=value2`. To see what properties you can update, use a show command, such as [az vm show](/cli/azure/vm#az-vm-show).

```azurecli
az vm show --resource-group VMResources --name virtual-machine-01
```

To simplify the command, consider using a JSON string. For example, to attach a new data disk to a virtual machine, use the following value:

```azurecli
az vm update --resource-group VMResources --name virtual-machine-01 \
--add storageProfile.dataDisks "{\"createOption\": \"Attach\", \"managedDisk\":
   {\"id\":
   \"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/yg/providers/Microsoft.Compute/disks/yg-disk\"},
   \"lun\": 1}"
```

## Generic resource commands

A service you want to work with may not have Azure CLI support. You can use the [az resource](../latest/docs-ref-autogen/resource.yml) or [az rest](/cli/azure/reference-index#az-rest) commands to work with these resources.

## Script examples

Here are examples for using variables and looping through a list when working with Azure Virtual Machines. For in-depth examples on using Bash constructs with the Azure CLI including loops, case statements, if..then..else, and error handling, see [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md).

Use these scripts to save IDs to variables:

### [Bash](#tab/bash2)

```azurecli
ECHO OFF
SETLOCAL
FOR /F "tokens=* USEBACKQ" %%F IN (
   `az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv`
) DO (
    SET "vm_ids=%%F %vm_ids%"  :: construct the id list
)
az vm stop --ids %vm_ids% :: CLI stops all VMs in parallel
```

### [PowerShell](#tab/powershell2)

```azurecli
$vm_ids=(az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv)
az vm stop --ids $vm_ids # CLI stops all VMs in parallel
```

---

Use these scripts to loop through a list:

### [Bash](#tab/bash2)

```azurecli
ECHO OFF
SETLOCAL
FOR /F "tokens=* USEBACKQ" %%F IN (
    `az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv`
) DO (
    ECHO Stopping %%F
    az vm stop --ids %%F
)
```

### [PowerShell](#tab/powershell2)

```azurecli
$vm_ids=(az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv)
foreach ($vm_id in $vm_ids) {
    Write-Output "Stopping $vm_id"
    az vm stop --ids $vm_id
}
```

---

## See also

- [Configure the Azure CLI](./azure-cli-configuration.md)
- [Learn to use Bash with Azure CLI](./azure-cli-learn-bash.md)
- [Query Azure CLI command output](./query-azure-cli.md)
- [Use variables in Azure CLI commands](./azure-cli-variables.md)
- Find Azure CLI [samples](./samples-index.md) and [published articles](./reference-docs-index.md)
