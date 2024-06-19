---
title: Troubleshoot Azure CLI | Microsoft Docs
description: Learn to troubleshoot common Azure CLI errors.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 06/14/2025
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
---

# Troubleshooting Azure CLI

Errors returned by the Azure CLI usually fall into one of these groups:

|-|-|
|Error type | General error description |
|Unrecognized argument | A parameter is misspelled or not recognized by Azure CLI.
|Required argument missing | A required parameter is not specified.
|Mutually exclusive argument | Two or more parameters cannot be specified together.
|Invalid argument value | Parameter value is not valid.
|Bad request | **need more information here**
|Resource not found | An Azure resource cannot be found.
|Authentication | 





## The `--debug` parameter

One of the best ways to see what the Azure CLI is executing for each Azure CLI reference command is to use the `--debug` parameter. Look at all this great information!

```azurecli
-- Error example: Create a resource group, but omit the quotes around the resource group name.
az group create --location eastus2 --name msdocs-rg-test --debug
```

Here's a portion of the debug output. Notice the log location and unrecognized argument.

```output
cli.knack.cli: Command arguments: ['group', 'create', '-l', 'eastus2', '-name', 'msdocs-rg-test', '--debug']
...
cli.azure.cli.core.azlogging: metadata file logging enabled - writing logs to '/home/myName/.azure/commands/YYYY-MM-DD.HH-MM-SS.group_create.8912.log'.
...
cli.azure.cli.core.azclierror: unrecognized arguments: msdocs-rg-2
...
```

Compare the error `--debug` output to a successful execution:

```azurecli
-- Correct example: Because the resource group name contains special characters, enclose it in quotes
az group create --location eastus2 --name "msdocs-rg-test" --debug
```

Here's a portion of the debug output. Notice the log location, API call, and run time.

```output
cli.knack.cli: Command arguments: ['group', 'create', '-l', 'eastus2', '-n', 'msdocs-rg-test', '--debug']
...
cli.azure.cli.core.azlogging: metadata file logging enabled - writing logs to '/home/myName/.azure/commands/YYYY-MM-DD.HH-MM-SS.group_create.8912.log'.
...
cli.azure.cli.core.sdk.policies: Request URL: 'https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/msdocs-rg-test?api-version=YYYY-MM-DD'
cli.azure.cli.core.sdk.policies: Request method: 'PUT'
cli.azure.cli.core.sdk.policies: Request headers:
cli.azure.cli.core.sdk.policies:     'Content-Type': 'application/json'
cli.azure.cli.core.sdk.policies:     'Content-Length': '23'
cli.azure.cli.core.sdk.policies:     'Accept': 'application/json'
cli.azure.cli.core.sdk.policies:     'x-ms-client-request-id': 'ba7ee6f4-2dcc-11ef-81ce-00155dadc5c8'
cli.azure.cli.core.sdk.policies:     'CommandName': 'group create'
cli.azure.cli.core.sdk.policies:     'ParameterSetName': '-l -n --debug'
cli.azure.cli.core.sdk.policies:     'User-Agent': 'AZURECLI/2.61.0 (RPM) azsdk-python-core/1.28.0 Python/3.9.19 (Linux-5.10.102.2-microsoft-standard-x86_64-with-glibc2.35) cloud-shell/1.0'
cli.azure.cli.core.sdk.policies:     'Authorization': '*****'
cli.azure.cli.core.sdk.policies: Request body:
cli.azure.cli.core.sdk.policies: {"location": "eastus2"}
urllib3.connectionpool: Starting new HTTPS connection (1): management.azure.com:443
urllib3.connectionpool: https://management.azure.com:443 "PUT /subscriptions/3618afcd-ea52-4ceb-bb46-53bb962d4e0b/resourcegroups/msdocs-rg-test?api-version=2022-09-01 HTTP/1.1" 201 226
cli.azure.cli.core.sdk.policies: Response status: 201
...
cli.azure.cli.core.sdk.policies:     'Date': 'Tue, 18 Jun 2024 23:44:41 GMT'
cli.azure.cli.core.sdk.policies: Response content:
cli.azure.cli.core.sdk.policies: {"id":"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/msdocs-rg-test","name":"msdocs-rg-test","type":"Microsoft.Resources/resourceGroups","location":"eastus2","properties":{"provisioningState":"Succeeded"}}
...
cli.__main__: Command ran in 1.829 seconds (init: 0.111, invoke: 1.718)
```

## Common syntax errors

Although the Azure CLI can run in both Bash, PowerShell and Windows Cmd, there are syntax differences between environments. This challenge reveals itself most often in parameter values. Azure CLI scripts containing single quotes, double quotes and escape characters are not easily copied between environments with successful execution. Here are some common error messages:

* "**Bad request ...{something} is invalid**" might be caused by a space, single or double quotation mark, or lack of a quote.

* "**Unexpected token...**" is seen when there's an extra space or quote.

* "**Invalid jmespath_type value**" error often comes from incorrect quoting in the `--query` parameter.

* "**Variable reference is not valid**" is received when a string isn't formatted properly often due to concatenation or a missing escape character.

* "**Unrecognized arguments**" is often caused by an incorrect line continuation character or incorrectly formatted parameter value.

* "**Missing expression after unary operator**" is seen when a line continuation character is missing.

There are several Azure CLI articles dedicated to explaining syntax errors and providing working examples:

* [Learn Azure CLI syntax differences in Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md)
* [How to query Azure CLI command output using a JMESPath query](./query-azure-cli.md)
* [How-to use the Azure CLI in a Bash environment](./azure-cli-learn-bash.md)
* [Considerations for running the Azure CLI in a PowerShell environment](./use-azure-cli-successfully-in-powershell.md)

## Service principals

For information on troubleshooting service principals, see [Cleanup and Troubleshooting](./azure-cli-sp-tutorial-8.md#troubleshoot-service-principals) in the [Work with service principals](./azure-cli-sp-tutorial-1.md) tutorial.

## Error: Invalid value found or unrecognized arguments

These errors often occur when trying to use a variable value that contains an incorrect format. The default output for Azure CLI is JSON, so if you are trying to store an ID for an Azure resource in a variable, you must specify `--output tsv`. Here's an example:

```azurecli
--Get a subscription that contains a name or phrase
subscriptionID=$(az account list --query "[?contains(name,'my case sensitive search phrase')].id")
echo $subscriptionID

--output as JSON
[ "00000000-0000-0000-0000-000000000000" ]

--Try to set your subscription to the new ID
az account set --subscription $subscriptionID

--error output
The subscription of '"00000000-0000-0000-0000-000000000000"' doesn't exist in cloud 'AzureCloud'.
```

Now use the `tsv` output type.

```azurecli
--Get the active subscription
subscriptionID=$(az account list --query "[?contains(name,'my case sensitive search phrase')].id" --output tsv)
echo $subscriptionID

--output as TSV
00000000-0000-0000-0000-000000000000

--Successfully set your subscription to the new ID
az account set --subscription $subscriptionID
```

## az self-help

You will be prompted to install the `az self-help` extension upon first use.


## Error: Failed to parse string as JSON

There are quoting differences between Bash, PowerShell in Linux, and PowerShell in Windows. Furthermore, different versions of PowerShell can produce different results. For complex parameters, like a JSON string, the best practice is to use Azure CLI's @<file> convention to bypass a shell's interpretation. See [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md#best-practice-use-file-input-for-json) for more information, or [Considerations for running the Azure CLI in a PowerShell environment](./use-azure-cli-successfully-in-powershell.md). [Learn Azure CLI syntax differences in Bash, PowerShell and Cmd](./get-started-tutorial-2-environment-syntax.md) provides more examples.

## Error: Arguments are expected or required

You receive this error when an Azure CLI command is missing a required parameter, or there is a typographical error that causes the Azure CLI to incorrectly parse the reference command. When working with a script, you also receive this error when one of more of the following is true:

* There is a missing or incorrect line continuation character.
* There are trailing spaces on the right side of a line continuation character.
* Your variable name contains a special character, such as a dash (-).

## Error: InvalidTemplateDeployment

When you try to create an Azure resource in a location that does not offer that resource you receive an error similar to the following: "Following SKUs have failed for Capacity Restrictions: Standard_DS1_v2' is currently not available in location 'westus'."

Here's a full error example for a VM that cannot be created in the specified location:

```azurecli
{"error":{"code":"InvalidTemplateDeployment","message":"The template deployment 'vm_deploy_<32 character ID>'
is not valid according to the validation procedure. The tracking id is '<36 character ID>'.
See inner errors for details.","details":[{"code":"SkuNotAvailable","message":"The requested VM size for resource
'Following SKUs have failed for Capacity Restrictions: Standard_DS1_v2' is currently not available
in location '<your specified location>'. Please try another size or deploy to a different location
or different zone. See https://aka.ms/azureskunotavailable for details."}]}}
```

## Error: Resource not found

When the Azure CLI cannot find the resource name or ID passed in a parameter value, it is usually due to one of these reasons:

* The resource name is spelled incorrectly.
* The resource name contains special characters and is not surrounded by single or double quotes.
* If using variables, the variable value has unseen leading or trailing spaces.
* The resource is in a different subscription.

## Error: SSLError "bad handshake...certificate verify failed" (Proxy blocks connection)

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

```cmd
set AZURE_CONFIG_DIR=D:\my\config\dir
```

---

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

## Other issues

If you experience a product issue with Azure CLI not listed in this article or require further assistance, file an issue on GitHub.
