---
title: Quoting differences in CLI environments | Microsoft Docs
description: Learn about quoting difference between Bash, PowerShell and Cmd. Find examples for escape characters, single and double quotes.
ms.date: 06/21/2024
ms.topic: concept-article
ms.service: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli, linux-related-content
---

# Learn quoting differences between environments

> [!CAUTION]
> This article references CentOS, a Linux distribution that is nearing End Of Life (EOL) status. Please consider your use and plan accordingly. For more information, see the [CentOS End Of Life guidance](/azure/virtual-machines/workloads/centos/centos-end-of-life).

Azure CLI is a command-line tool that allows you to configure and manage Azure resources from many shell environments. After you [choose your preferred shell environment](./choose-the-right-azure-command-line-tool.md#different-shell-environments) and [install the Azure CLI](./install-azure-cli.md), use this article to discover useful tips on how to avoid common pitfalls and use the Azure CLI successfully.

To learn more about specific Azure CLI commands, see the [Azure CLI Reference list](../latest/docs-ref-autogen/reference-index.yml).

## Output formatting

Three common output formats are used with Azure CLI commands:

1. The `json` format shows information as a JSON string.
   - JSON gives you the most comprehensive information.
   - This format is the default but you can use the `--output` parameter to specify a different option.
   - Change the global default format to one of your personal preferences by using [az config](../latest/docs-ref-autogen/config.yml) such as `az config set core.output=table`.
   - JSON format preserves the double quotes, generally making it unsuitable for scripting purposes.

2. The `table` format presents output as a readable table. You can specify which values appear in the table and use queries to customize the output as shown here:

    ```azurecli
    # command
    az vm show --resource-group myResourceGroup --name myVMname --query "{name: name, os:storageProfile.imageReference.offer}" --output table

    # output
    Name    Os
    ------  ------------
    myVMname   UbuntuServer
    ```

3. The `tsv` format returns tab-separated and newline-separated values without extra formatting, keys, or other symbols.
   - The TSV format is useful for concise output and scripting purposes.
   - The TSV strips double quotes that the JSON format preserves.
   - To specify the format you want for TSV, use the `--query` parameter.

    ```azurecli
    export vm_ids=$(az vm list --show-details --resource-group myResourceGroup --query "[?powerState=='VM running'].id" --output tsv)
    az vm stop --ids $vm_ids
    ```

For more information about these and other formats, see [Output formats for Azure CLI commands](./format-output-azure-cli.md).

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
    for vmList in $(az vm list --resource-group MyResourceGroup --show-details --query "[?powerState=='VM running'].id"   --output tsv); do
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

## Use quotation marks in parameters

When you work with Azure CLI commands, be aware of how your shell uses quotation marks and escapes characters. If you support scripts used in different shells, understand how they differ.

- Bash. [Quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
- PowerShell. [About Quoting Rules](/powershell/module/microsoft.powershell.core/about/about_quoting_rules)
- Windows Command Prompt. [How-to: Escape Characters, Delimiters and Quotes at the Windows command line](https://ss64.com/nt/syntax-esc.html)

> [!NOTE]
> Due to a known issue in PowerShell, some extra escaping rules apply. For more information, see [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md).

To avoid unanticipated results, here are a few suggestions:

- If you provide a parameter that contains whitespace, wrap it in quotation marks.

- In Bash or PowerShell, both single and double quotes are interpreted correctly. In Windows Command Prompt, only double quotes are interpreted correctly -- single quotes are treated as part of the value.

- If your command is only going to run on Bash (or Zsh), use single quotes to preserve the content inside the JSON string. Single quotes are necessary when supplying inline JSON values. For example, this JSON is correct in Bash: `'{"key": "value"}'`.

- If your command runs at a Windows Command Prompt, you must use double quotes. If the value contains double quotes, you must escape it. The equivalent of the above JSON string is `"{\"key\": \"value\"}"`

- In PowerShell, if your value is an empty string, use `'""'`.

- In Bash or PowerShell, if your value is an empty quotes string `''`, use `"''"`.

- Use Azure CLI's `@<file>` convention to load from a file and bypass the shell's interpretation mechanisms.

  ```azurecli
  az ad app create --display-name myName --native-app --required-resource-accesses @manifest.json
  ```

- Bash evaluates double quotes in exported variables. If this behavior isn't what you want, escape the variable: `"\$variable"`.

- Some Azure CLI commands take a list of space separated values.
  - If the key name or value contains spaces, wrap the whole pair: `"my key=my value"`.  For example:

    ```azurecli
    az web app config app settings set --resource-group myResourceGroup --name myWebAppName --settings "client id=id1" "my name=john"
    ```

  - When a CLI parameter states that it accepts a space-separated list, one of two formats is expected:
    1. Unquoted, space-separated list
       `--parameterName firstValue secondValue`
    1. Quoted space-separated list
       `--parameterName "firstValue" "secondValue"`

    This example is a string with a space in it. It isn't a space-separated list:
       `--parameterName "firstValue secondValue"`

- There are special characters of PowerShell, such as at `@`. To run Azure CLI in PowerShell, add `` ` `` before the special character to escape it. You can also enclose the value in single or double quotes `"`/`"`.

  ```powershell
  # The following three examples will work in PowerShell
  --parameterName `@parameters.json
  --parameterName '@parameters.json'
  --parameterName "@parameters.json"

  # This example will not work in PowerShell
  --parameterName @parameters.json
  ```

- When you use the `--query` parameter with a command, some characters of [JMESPath](https://jmespath.org/specification.html) need to be escaped in the shell.

  ### [Bash](#tab/bash)

  These three commands are correct and equivalent in Bash:

  ```azurecli
  az version --query '"azure-cli"'
  az version --query \"azure-cli\"
  az version --query "\"azure-cli\""
  ```

  Here are two examples of incorrect commands in Bash:

  ```azurecli
  # Wrong, as the dash needs to be quoted in a JMESPath query
  az version --query azure-cli
  az version: error: argument --query: invalid jmespath_type value: 'azure-cli'

  # Wrong, as the dash needs to be quoted in a JMESPath query, but quotes are interpreted by Bash
  az version --query "azure-cli"
  az version: error: argument --query: invalid jmespath_type value: 'azure-cli'
  ```

  For more example comparisons between Bash, PowerShell and Cmd, see [Query Azure CLI command output](./query-azure-cli.md)

  ### [PowerShell](#tab/powershell)

  These five commands work correctly in PowerShell:

  ```azurecli
  az version --query '\"azure-cli\"'
  az version --query "\`"azure-cli\`""
  az version --query "\""azure-cli\"""
  az --% version --query "\"azure-cli\""
  az --% version --query \"azure-cli\"
  ```

  For more example comparisons between Bash, PowerShell and Cmd, see [Query Azure CLI command output](./query-azure-cli.md)

  ### [Cmd](#tab/cmd)

  These two commands work correctly in Windows Command Prompt:

  ```azurecli
  az version --query "\"azure-cli\""
  az version --query \"azure-cli\"
  ```

  For more example comparisons between Bash, PowerShell and Cmd, see [Query Azure CLI command output](./query-azure-cli.md)

  ---

- The best way to troubleshoot a quoting issue is to run the command with the `--debug` flag. This flag reveals the actual arguments received by the Azure CLI in [Python's syntax](https://docs.python.org/3/tutorial/introduction.html#strings).

  ```azurecli
  # Correct
  $ az '{"key":"value"}' --debug
  Command arguments: ['{"key":"value"}', '--debug']

  # Correct
  $ az "{\"key\":\"value\"}" --debug
  Command arguments: ['{"key":"value"}', '--debug']

  # Wrong, as quotes and spaces are interpreted by Bash
  $ az {"key": "value"} --debug
  Command arguments: ['{key:', 'value}', '--debug']

  # Wrong, as quotes are interpreted by Bash
  $ az {"key":"value"} --debug
  Command arguments: ['{key:value}', '--debug']
  ```

## Use hyphen characters in parameters

If a parameter's value begins with a hyphen, Azure CLI tries to parse it as a parameter name. To parse it as value, use `=` to concatenate the parameter name and value: `--password="-VerySecret"`.

## Generic update parameters

Azure CLI command groups often feature an update command. For instance, [Azure Virtual Machines](/cli/azure/vm) includes the [az vm update](/cli/azure/vm#az-vm-update) command. Most update commands offer the three generic parameters: `--add`, `--set`, and `--remove`.

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

## Generic resource commands (az resource)

A service you want to work with may not have Azure CLI support. You can use the [az resource](../latest/docs-ref-autogen/resource.yml) commands to work with these resources.

If you only need create or update commands, use the [az deployment group create](/cli/azure/deployment/group#az-deployment-group-create). For working examples, see [Azure Quickstart Templates](https://azure.microsoft.com/resources/templates/).

## REST API commands (az rest)

If generic update parameters and [az resource](../latest/docs-ref-autogen/resource.yml) don't meet your needs, you can use the [az rest](/cli/azure/reference-index#az-rest) command to call the REST API. The command automatically authenticates using the logged-in credential and sets header `Content-Type: application/json`. For more information, see [Azure REST API reference](/rest/api/azure/).

This example works with the [Microsoft Graph API](/graph/api/overview?toc=./ref/toc.json). To update redirect URIs for an [Application](/graph/api/resources/application), call the [Update application](/graph/api/application-update?tabs=http) REST API, as in this code:

```azurecli
# Get the application
az rest --method GET \
    --uri 'https://graph.microsoft.com/v1.0/applications/b4e4d2ab-e2cb-45d5-a31a-98eb3f364001'

# Update `redirectUris` for `web` property
az rest --method PATCH \
    --uri 'https://graph.microsoft.com/v1.0/applications/b4e4d2ab-e2cb-45d5-a31a-98eb3f364001' \
    --body '{"web":{"redirectUris":["https://myapp.com"]}}'
```

When using `--uri-parameters` for requests in the form of OData, make sure to escape `$` in different environments: in `Bash`, escape `$` as `\$` and in `PowerShell`, escape `$` as `` `$``

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
