---
title: Use Azure CLI effectively | Microsoft Docs
description: Learn tips for using Azure CLI effectively, such as output formats, passing parameter values, and quoting rules for different shells.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 10/01/2021
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
---

# How to use Azure CLI effectively

Azure CLI is a command-line tool that allows you to configure and manage Azure resources from many shell environments.  First learn how to [choose the right environment](/cli/azure/choose-the-right-azure-command-line-tool#different-shell-environments) and [install](/cli/azure/install-azure-cli) the Azure CLI.  Then use this article to discover useful tips on how to avoid common pitfalls and effectively use the Azure CLI.  [Script](#scripts) examples for Windows batch and PowerShell are provided at the end of the article.

To learn more about specific Azure CLI commands, see the [Azure CLI Reference list](../latest/docs-ref-autogen/reference-index.yml).

## Output formatting

Three common output formats are used with Azure CLI commands:

1. The `json` format shows information as a JSON string.
   - JSON gives you the most comprehensive information.
   - This format is the default but you can use the `--output` parameter to specify a different option.
   - Change the global default format to one of your personal preference by using [az config](../latest/docs-ref-autogen/config.yml) such as `az config set core.output=table`.
   - Note that JSON format preserves the double quotes, generally making in unsuitable for scripting purposes.

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
   - The TSV will strip double quotes that the JSON format preserves.
   - To specify the format you want for TSV, use the `--query` parameter.

    ```bash
    export vm_ids=$(az vm list --show-details --resource-group myResourceGroup --query "[?powerState=='VM running'].id" --output tsv)
    az vm stop --ids $vm_ids
    ```

For more information about these and other formats, see [Output formats for Azure CLI commands](./format-output-azure-cli.md).

## Pass values to another command

If the value will be used more than once, assign it to a variable. Variables allow you to use values more than once or to create more general scripts.  This example assigns an ID found by the [az vm list](/cli/azure/vm#az-vm-list) command to a variable.

  ```bash
  # assign the list of running VMs to a variable
  running_vm_ids=$(az vm list --resource-group MyResourceGroup --show-details \
      --query "[?powerState=='VM running'].id" --output tsv)

  # verify the value of the variable
  echo $running_vm_ids
  ```

If the value is used only once, consider piping.  

  ```azurecli
  az vm list --query "[?powerState=='VM running'].name" --output tsv | grep my_vm
  ```

For multi-value lists, consider the following options:

1. If you need more controls on the result, use a "for" loop:

    ```bash
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

1. Finally, Azure CLI has built-in support to process commands with multiple `--ids` in parallel to achieve the same effect of xargs. Note that `@-` is used to get values from the pipe:

    ```azurecli
    az vm list --resource-group MyResourceGroup --show-details \
      --query "[?powerState=='VM stopped'].id" \
      --output tsv | az vm start --ids @-
    ```

For more information on using Bash constructs with the Azure CLI including loops, case statements, if..then..else, and error handling, see [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md).

## Use quotation marks in parameters

When you work with Azure CLI commands, be aware of how your shell uses quotation marks and escapes characters. If you support scripts used in different shells, you need to understand how they differ.

- Bash. [Quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
- PowerShell. [About Quoting Rules](/powershell/module/microsoft.powershell.core/about/about_quoting_rules)
- Windows Command Prompt. [How-to: Escape Characters, Delimiters and Quotes at the Windows command line](https://ss64.com/nt/syntax-esc.html)

> [!NOTE]
> Due to a known issue in PowerShell, some extra escaping rules apply. For more information, see [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md).

To avoid unanticipated results, here are a few suggestions:

- If you provide a parameter that contains whitespace, wrap it in quotation marks.

- In Bash or PowerShell, both single and double quotes are interpreted correctly. In Windows Command Prompt, only double quotes are interpreted correctly -- single quotes are treated as part of the value.

- If your command is only going to run on Bash (or Zsh), use single quotes to preserve the content inside the JSON string. This is necessary when supplying inline JSON values.  For example, this JSON is correct in Bash: `'{"key": "value"}'`.

- If your command will be run at a Windows Command Prompt, you must use double quotes.  If the value contains double quotes, you must escape it.  The equivalent of the above JSON string is `"{\"key\": \"value\"}"`

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

    This example is a string with a space in it.  It is not a space-separated list:
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

  ### [PowerShell](#tab/powershell)

  These five commands will work correctly in PowerShell:

  ```azurecli
  az version --query '\"azure-cli\"'
  az version --query "\`"azure-cli\`""
  az version --query "\""azure-cli\"""
  az --% version --query "\"azure-cli\""
  az --% version --query \"azure-cli\"
  ```

  ### [Cmd](#tab/cmd)

  These two commands will work correctly in Windows Command Prompt:

  ```azurecli
  az version --query "\"azure-cli\""
  az version --query \"azure-cli\"
  ```
  
  ---
  
  For more example comparisons of Bash, PowerShell and Cmd, see [Query Azure CLI command output](./query-azure-cli.md)

- The best way to troubleshoot a quoting issue is to run the command with the `--debug` flag.  This flag reveals the actual arguments received by the Azure CLI in [Python's syntax](https://docs.python.org/3/tutorial/introduction.html#strings).

  ```bash
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

## Asynchronous operations

Operations in Azure can take a noticeable amount of time. For instance, configuring a virtual machine at a data center isn't instantaneous. Azure CLI waits until the command has finished to accept other commands.  Many commands therefore offer a `--no-wait` parameter as shown here:

```azurecli
az group delete --name MyResourceGroup --no-wait
```

When deleting a resource group, all the resources that belong to it are also removed. Removing these resources can take a long time. Running the command with the `--no-wait` parameter, allows the console to accept new commands without interrupting the removal.

Many commands offer a wait option, pausing the console until some condition is met. The following example uses the [az vm wait](/cli/azure/vm#az-vm-wait) command to support creating independent resources in parallel:

```azurecli
az vm create --resource-group VMResources --name virtual-machine-01 --image centos --no-wait
az vm create --resource-group VMResources --name virtual-machine-02 --image centos --no-wait

subscription=$(az account show --query "id" -o tsv)
vm1_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/virtual-machine-01"
vm2_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/virtual-machine-02"
az vm wait --created --ids $vm1_id $vm2_id
```

After both IDs are created, you can use the console again.

## Work behind a proxy

If you're using Azure CLI over a proxy server, it may cause the following error: `SSLError("bad handshake: Error([('SSL routines', 'tls_process_server_certificate', 'certificate verify failed')],)",)`. To address this error, set the environment variable `REQUESTS_CA_BUNDLE` to the path of certificate authority bundle certificate file in PEM format.

| OS                     | Default certificate authority bundle                                                  |
|----------------------- |-------------------------------------------------------------------------------------- |
| Windows                | C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\Lib\site-packages\certifi\cacert.pem |
| Ubuntu/Debian Linux    | /opt/az/lib/python<version>/site-packages/certifi/cacert.pem                                |
| CentOS/RHEL/SUSE Linux | /usr/lib64/az/lib/python<version>/site-packages/certifi/cacert.pem                          |
| macOS                  | /usr/local/Cellar/azure-cli/\<cliversion\>/libexec/lib/python<version>/site-packages/certifi/cacert.pem|

Append the proxy server's certificate to this file or copy the contents to another certificate file, then set `REQUESTS_CA_BUNDLE` to it. You might also need to set the `HTTP_PROXY` or `HTTPS_PROXY` environment variables.

Some proxies require authentication. The format of the `HTTP_PROXY` or `HTTPS_PROXY` environment variables should include the authentication, such as `HTTPS_PROXY="https://username:password@proxy-server:port"`. For details, see [How to configure proxies for the Azure libraries](/azure/developer/python/sdk/azure-sdk-configure-proxy?tabs=bash).

## Concurrent builds

If you run Azure CLI on a build machine where multiple jobs can be run in parallel, access tokens might be shared between two build jobs run as the same OS user.  To avoid mix ups, set `AZURE_CONFIG_DIR` to a directory where the access tokens are stored.
