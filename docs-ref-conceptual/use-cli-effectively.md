---
title: Use Azure CLI effectively
description: This article provides tips for using Azure CLI effectively, such as output formats, passing parameter values, and quoting rules for different shells.
author: dbradish-microsoft
ms.author: dbradish
manager: barbkess
ms.date: 03/19/2021
ms.topic: conceptual
ms.service: azure-cli
ms.devlang: azurecli
ms.custom: devx-track-azurecli
---

# Use Azure CLI effectively

Azure CLI allows you to configure and manage Azure from Bash, PowerShell, or a Command Prompt window. Azure CLI supports command reuse, both on an ad-hoc basis and through scripts. You'll need to be aware of the capabilities of the shell that you run.

This article discusses tips useful for Azure CLI and how to avoid pitfalls.

[!INCLUDE [azure-cli-prepare-your-environment.md](includes/azure-cli-prepare-your-environment.md)]

If you have questions about any Azure CLI command, search in [Azure CLI Reference](/cli/azure/reference-index).

## Output formatting (json, table, or tsv)

Many Azure CLI commands show you data in the console. This information can be the point of a command, as in this example:

```azurecli
az account show
```

The [az account show](/cli/azure/account#az_account_show) command shows your current subscription. Sometimes, the information reflects the changes you've made. This example creates a resource group by using the [az group create](/cli/azure/group#az_group_create) command:

```azurecli
az group create --name MyResourceGroup --location eastus
```

The result of this command is a new resource group. The Azure CLI console shows you the resource group you just created.

You can select the format for a command by specifying the `--output` parameter. In this example, the [az account list](/cli/azure/account#az_account_list) command lists all subscriptions that you can access as a table:

```azurecli
az account list --output table
```

Here are three common formats:

* The `json` format shows information in as a JSON string. This format gives you the most comprehensive information. This format is the default.
* The `table` format presents output as a human readable table. You can specify which values appear in the table and use queries to customize the output.
* The `tsv` format returns tab-separated and newline-separated values without extra formatting, keys, or other symbols.

For more information about these and other formats, see [Output formats for Azure CLI commands](format-output-azure-cli.md).

## Pass values from one command to another

Azure CLI commands run in a shell. In this article, we use Bash, but there are other options. You can use standard shell syntax to simplify Azure CLI usage.

You can save a value as a variable. Variables allow you to use values more than once or to create more general scripts. This example assigns an ID found by the [az vm list](/cli/azure/vm#az_vm_list) command to a variable.

```azurecli
running_vm_ids=$(az vm list --resource-group MyResourceGroup --show-details --query "[?powerState=='VM running'].id" --output tsv)
```

> [!TIP]
> Be sure to use the `tsv` output type. Other output types may contain unwanted symbols such as quotation marks.

Use the value in later commands. You can verify the value by echoing the variable:

```azurecli
echo $running_vm_ids
```

You could also pipe a value from one command to another. This example uses standard Bash syntax to search for a value:

```azurecli
az vm list --query "[?powerState=='VM running'].name" --output tsv | grep my_vm
```

Be aware of the output type and what later commands expect.

## Async operations

Many operations in Azure take a noticeable amount of time. For instance, configuring a virtual machine at a datacenter somewhere in the world isn't instantaneous. Azure CLI waits until the command has finished to accept other commands.

Many commands offer a `--no-wait` parameter, which allows new commands to run. This example removes a resource group. When you remove a resource group, you also remove all the resources that belong to it. Reclaiming these resources can take a long time.

```azurecli
az group delete --name MyResourceGroup --no-wait
```

When this command runs, the console can accept commands immediately, even though it's still working on the command.

Many commands offer a wait option, pausing the console until some condition is met. The following example uses the [az vm wait](/cli/azure/vm#az_vm_wait) command to support creating independent resources in parallel:

```azurecli
az vm create --resource-group VMResources --name virtual-machine-01 --image centos --no-wait
az vm create --resource-group VMResources --name virtual-machine-02 --image centos --no-wait

subscription=$(az account show --query "id" -o tsv)
vm1_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/virtual-machine-01"
vm2_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/virtual-machine-02"
az vm wait --created --ids $vm1_id $vm2_id
```

After both IDs are created, you can use the console again.

## Pass arguments

When you work with Azure CLI commands, be aware of how your shell uses quotation marks and escapes characters. If you support scripts used in different shells, you need to understand how they differ. Here are some resources:

* Bash. [Quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
* PowerShell. [About Quoting Rules](/powershell/module/microsoft.powershell.core/about/about_quoting_rules)
* Windows Command Prompt. [How-to: Escape Characters, Delimiters and Quotes at the Windows command line](https://ss64.com/nt/syntax-esc.html)

> [!NOTE]
> Due to a known issue in PowerShell, some extra escaping rules apply. For more information, see [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md).

### Using hyphen characters in values

If a value begins with a hyphen, Azure CLI tries to parse it as a parameter name. To parse it as value, use quotation marks: `--password="-VerySecret"`.

### Using quotation marks in values

If you provide a parameter a value that contains whitespace, wrap it in quotation marks. Keep the following tips in mind:

* In Bash or PowerShell, both single and double quotes are interpreted. In Windows Command Prompt, only double quotes are interpreted. Single quotes are interpreted as a part of the value.

* Commands that you intend only for Bash that use single quotes simplify inline JSON. For example, this JSON is correct in Bash: `'{"key": "value"}'`. In Windows Command Prompt, the equivalent is: `"{\"key\": \"value\"}"`

* Some Azure CLI commands take a list of space separated values. If the key name or value contains spaces, wrap the whole pair: `"my key=my value"`.

* Bash evaluates double quotes in exported variables. If this behavior isn't what you want, escape the variable: `"\$variable"`.

* There are special characters of PowerShell, such as at `@`. To run Azure CLI in PowerShell, add `` ` `` before the special character to escape it. Instead, you can enclose the value single or double quotes `"`/`"`.

  ```azurecli
  `@parameters.json
  '@parameters.json'
  ```

* When using the `--query` parameter with a command, some characters of [JMESPath](https://jmespath.org/specification.html) need to be escaped in the shell. For example, in Bash:

  ```azurecli
  $ az version --query '"azure-cli"'
  "2.5.1"

  $ az version --query \"azure-cli\"
  "2.5.1"

  $ az version --query "\"azure-cli\""
  "2.5.1"
   ```

  In Windows Command Prompt:

  ```azurecli
  > az version --query "\"azure-cli\""
  "2.5.1"

  > az version --query \"azure-cli\"
  "2.5.1"
  ```

  In PowerShell:

  ```azurecli
  > az version --query '\"azure-cli\"'
  "2.5.1"

  > az version --query "\`"azure-cli\`""
  "2.5.1"

  > az version --query "\""azure-cli\"""
  "2.5.1"

  > az --% version --query "\"azure-cli\""
  "2.5.1"

  > az --% version --query \"azure-cli\"
  "2.5.1"
  ```

## Work behind a proxy

If you're using Azure CLI over a proxy server, it may cause the following error: `SSLError("bad handshake: Error([('SSL routines', 'tls_process_server_certificate', 'certificate verify failed')],)",)`. To address this error, set the environment variable `REQUESTS_CA_BUNDLE` to the path of CA bundle certificate file in PEM format.

The default CA bundle which CLI uses is located at `C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\Lib\site-packages\certifi\cacert.pem` on Windows and ` /opt/az/lib/python3.6/site-packages/certifi/cacert.pem` on Ubuntu/Debian or `/usr/lib64/az/lib/python3.6/site-packages/certifi/cacert.pem` on CentOS/RHEL/SUSE on Linux.

Append the proxy server's certificate to this file or copy the contents to another certificate file, then set `REQUESTS_CA_BUNDLE` to it. For example:

```console
<Original cacert.pem>

-----BEGIN CERTIFICATE-----
<Your proxy's certificate here>
-----END CERTIFICATE-----
```

You might also need to set the `HTTP_PROXY` or `HTTPS_PROXY` environment variables.

Some proxies require authentication. The format of the `HTTP_PROXY` or `HTTPS_PROXY` environment variables should include the authentication, such as `HTTPS_PROXY="https://username:password@proxy-server:port"`. For details, see [How to configure proxies for the Azure libraries](/azure/developer/python/azure-sdk-configure-proxy?tabs=bash).

## Concurrent builds

If you run Azure CLI on a build machine where multiple jobs can be run in parallel, there's a risk that the login tokens are shared between two build jobs run as the same OS user.  To avoid mix ups, set AZURE_CONFIG_DIR to a directory where the login tokens should be stored.

## Generic update arguments

Azure CLI command groups often feature an update command. For instance, [Azure Virtual Machines](/cli/azure/vm) includes the [az vm update](/cli/azure/vm#az_vm_update) command. Most update commands offer the three generic parameters: `--add`, `--set`, and `--remove`.

The `--set` and `--add` parameters take a list of space separated key-value pairs: `<key1>=<value1> <key2>=<value2>`. To see what properties you can update, use a show command, such as [az vm show](/cli/azure/vm#az_vm_show).

```azurecli
az vm show --resource-group VMResources --name virtual-machine-01
```

To simplify the command, consider using a JSON string. For example, to attach a new data disk to a virtual machine, use the following value:

```azurecli
az vm update --resource-group VMResources --name virtual-machine-01 --add storageProfile.dataDisks "{\"createOption\": \"Attach\", \"managedDisk\": {\"id\": \"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/yg/providers/Microsoft.Compute/disks/yg-disk\"}, \"lun\": 1}"
```

## Generic resource commands - `az resource`

A service you want to work with might not have Azure CLI support yet. You can use the [az resource](/cli/azure/resource) commands to work with these resources.

If you only need create or update commands, use the [az deployment group create](/cli/azure/deployment/group#az_deployment_group_create). For working examples, see [Azure Quickstart Templates](https://github.com/Azure/azure-quickstart-templates).

## REST API command - `az rest`

If generic update arguments and `az resource` don't meet your needs, you can use `az rest` command to call the REST API. It automatically authenticates using the logged-in credential and sets header `Content-Type: application/json`. For more information, see [Azure REST API reference](/rest/api/azure/).

This example works with the [Microsoft Graph API](/graph/api/overview?toc=./ref/toc.json). To update redirect URIs for an [Application](/graph/api/resources/application), we call the [Update application](/graph/api/application-update?tabs=http) REST API, as in this code:

```azurecli
# Get the application
az rest --method GET \
    --uri 'https://graph.microsoft.com/v1.0/applications/b4e4d2ab-e2cb-45d5-a31a-98eb3f364001'

# Update `redirectUris` for `web` property
az rest --method PATCH \
    --uri 'https://graph.microsoft.com/v1.0/applications/b4e4d2ab-e2cb-45d5-a31a-98eb3f364001' \
    --body '{"web":{"redirectUris":["https://myapp.com"]}}'
```

## Appendix

### Windows batch scripts for saving to variables and using it later

```batch
ECHO OFF
SETLOCAL
FOR /F "tokens=* USEBACKQ" %%F IN (`az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" -o tsv`) DO (
    SET "vm_ids=%%F %vm_ids%"  :: construct the id list
)
az vm stop --ids %vm_ids% :: CLI stops all VMs in parallel
```

### Windows PowerShell scripts for saving to variables and using it later

```powershell
$vm_ids=(az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" -o tsv)
az vm stop --ids $vm_ids # CLI stops all VMs in parallel
```

### Windows batch scripts to loop through a list

```batch
ECHO OFF
SETLOCAL
FOR /F "tokens=* USEBACKQ" %%F IN (`az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" -o tsv`) DO (
    ECHO Stopping %%F
    az vm stop --ids %%F
)
```

### Windows PowerShell scripts to loop through a list

```powershell
$vm_ids=(az vm list --resource-group VMResources --show-details --query "[?powerState=='VM running'].id" -o tsv)
foreach ($vm_id in $vm_ids) {
    Write-Output "Stopping $vm_id"
    az vm stop --ids $vm_id
}
```

### CLI Environment Variables

|  Environment Variable          | Description            |
|--------------------------------|------------------------|
| **AZURE_CONFIG_DIR**           | Global config directory for config files, logs, and telemetry. If unspecified, defaults to `~/.azure`. |
| **AZURE_EXTENSION_DIR**        | Extensions' installation directory. If unspecified, defaults to `cliextensions` directory within the global config directory. |
