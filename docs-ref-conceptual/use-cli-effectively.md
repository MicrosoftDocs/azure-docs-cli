---
title: Tips for using the Azure CLI | Microsoft Docs
description: Learn tips for using Azure CLI successfully, such as output formats, passing parameter values, and quoting rules for different shells.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 12/04/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
---

# Tips for using the Azure CLI successfully

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

    ```bash
    export vm_ids=$(az vm list --show-details --resource-group myResourceGroup --query "[?powerState=='VM running'].id" --output tsv)
    az vm stop --ids $vm_ids
    ```

For more information about these and other formats, see [Output formats for Azure CLI commands](./format-output-azure-cli.md).

## Pass values to another command

If the value is used more than once, assign it to a variable. Variables allow you to use values more than once or to create more general scripts.  This example assigns an ID found by the [az vm list](/cli/azure/vm#az-vm-list) command to a variable.

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

1. Finally, Azure CLI has built-in support to process commands with multiple `--ids` in parallel to achieve the same effect of xargs. `@-` is used to get values from the pipe:

    ```azurecli
    az vm list --resource-group MyResourceGroup --show-details \
      --query "[?powerState=='VM stopped'].id" \
      --output tsv | az vm start --ids @-
    ```

For more information on using Bash constructs with the Azure CLI including loops, case statements, if..then..else, and error handling, see [Learn to use Bash with the Azure CLI](./azure-cli-learn-bash.md).

## Asynchronous operations

Operations in Azure can take a noticeable amount of time. For instance, configuring a virtual machine at a data center isn't instantaneous. Azure CLI waits until the command has finished to accept other commands. Many commands therefore offer a `--no-wait` parameter as shown here:

```azurecli
az group delete --name MyResourceGroup --no-wait
```

When you delete a resource group, all the resources that belong to it are also removed. Removing these resources can take a long time. When you run the command with the `--no-wait` parameter, the console accepts new commands without interrupting the removal.

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

If you're using Azure CLI over a proxy server that uses self-signed certificates, the Python [requests library](https://github.com/kennethreitz/requests) used by the Azure CLI may cause the following error: `SSLError("bad handshake: Error([('SSL routines', 'tls_process_server_certificate', 'certificate verify failed')],)",)`. To address this error, set the environment variable `REQUESTS_CA_BUNDLE` to the path of CA bundle certificate file in PEM format.

| OS                     | Default certificate authority bundle                                                                      |
|----------------------- |-----------------------------------------------------------------------------------------------------------|
| Windows 32-bit         | `C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\Lib\site-packages\certifi\cacert.pem`                   |
| Windows 64-bit         | `C:\Program Files\Microsoft SDKs\Azure\CLI2\Lib\site-packages\certifi\cacert.pem`                         |
| Ubuntu/Debian Linux    | `/opt/az/lib/python<version>/site-packages/certifi/cacert.pem`                                            |
| CentOS/RHEL/SUSE Linux | `/usr/lib64/az/lib/python<version>/site-packages/certifi/cacert.pem`                                      |
| macOS                  | `/usr/local/Cellar/azure-cli/<cliversion>/libexec/lib/python<version>/site-packages/certifi/cacert.pem`   |

Append the proxy server's certificate to the CA bundle certificate file, or copy the contents to another certificate file.  Then set `REQUESTS_CA_BUNDLE` to the new file location. Here's an example:

```console
<Original cacert.pem>

-----BEGIN CERTIFICATE-----
<Your proxy's certificate here>
-----END CERTIFICATE-----
```

Some proxies require authentication. The format of the `HTTP_PROXY` or `HTTPS_PROXY` environment variables should include the authentication, such as `HTTPS_PROXY="https://username:password@proxy-server:port"`. For details, see [How to configure proxies for the Azure libraries](/azure/developer/python/sdk/azure-sdk-configure-proxy?tabs=bash).

## Concurrent execution

If you run Azure CLI commands concurrently on the same machine, write conflicts can happen if multiple Azure CLI commands write to the same MSAL token cache.

To avoid potential failures, you may isolate the Azure CLI configuration folder for each script by setting environment variable `AZURE_CONFIG_DIR` for each script to a separate directory. Azure CLI commands in that script save the configuration and token cache to the configured location instead of the default `~/.azure` folder.

  ### [Bash](#tab/bash)

  ```bash
  export AZURE_CONFIG_DIR=/my/config/dir
  ```

  ### [PowerShell](#tab/powershell)

  ```powershell
  $env:AZURE_CONFIG_DIR='D:\my\config\dir'
  ```

  ### [Cmd](#tab/cmd)

  ```azurecli
  set AZURE_CONFIG_DIR=D:\my\config\dir
  ```

  ---

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

```console
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

```powershell
$vm_ids=(az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv)
az vm stop --ids $vm_ids # CLI stops all VMs in parallel
```

---

Use these scripts to loop through a list:

### [Bash](#tab/bash2)

```console
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

```powershell
$vm_ids=(az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" --output tsv)
foreach ($vm_id in $vm_ids) {
    Write-Output "Stopping $vm_id"
    az vm stop --ids $vm_id
}
```

---

## Enable Tab Completion in PowerShell

[!INCLUDE [tab-completion](includes/tab-completion.md)]

## Error handling for Azure CLI in PowerShell

You can run Azure CLI commands in PowerShell, as described in [Choose the right Azure command-line tool](choose-the-right-azure-command-line-tool.md). If you do, be sure you understand Azure CLI error handling in PowerShell. In particular, Azure CLI doesn't create exceptions for PowerShell to catch.

An alternative is to use the `$?` automatic variable. This variable contains the status of the most recent command. If the previous command fails, `$?` has the value of `$False`. For more information, see [about_Automatic_Variables](/powershell/module/microsoft.powershell.core/about/about_automatic_variables).

The following example shows how this automatic variable can work for error handling:

```powershell
az group create --name MyResourceGroup
if ($? -eq $false) {
    Write-Error "Error creating resource group."
}
```

The `az` command fails because it's missing the required `--location` parameter. The conditional statement finds that `$?` is false and writes an error.

If you want to use the `try` and `catch` keywords, you can use `throw` to create an exception for the `try` block to catch:

```powershell
$ErrorActionPreference = "Stop"
try {
    az group create --name MyResourceGroup
    if ($? -eq $false) {
        throw 'Group create failed.'
    }
}
catch {
    Write-Error "Error creating the resource group."
}
$ErrorActionPreference = "Continue"
```

By default, PowerShell catches only terminating errors. This example sets the `$ErrorActionPreference` global variable to `Stop` so PowerShell can handle the error.

The conditional statement tests the `$?` variable to see if the previous command failed. If so, the `throw` keyword creates an exception to catch. The `catch` block can be used to write an error message or handle the error.

The example restores `$ErrorActionPreference` to its default value.

For more information about PowerShell error handling, see [Everything you wanted to know about exceptions](/powershell/scripting/learn/deep-dives/everything-about-exceptions).

## See also

- [Configure the Azure CLI](./azure-cli-configuration.md)
- [Learn to use Bash with Azure CLI](./azure-cli-learn-bash.md)
- [Query Azure CLI command output](./query-azure-cli.md)
- [Use variables in Azure CLI commands](./azure-cli-variables.md)
- Find Azure CLI [samples](./samples-index.md) and [published articles](./reference-docs-index.md)
