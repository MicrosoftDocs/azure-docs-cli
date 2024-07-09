---
title: Troubleshoot Azure CLI | Microsoft Docs
description: Learn to use the Azure CLI successfully by understanding common Azure CLI errors and how to fix them.
ms.date: 06/26/2024
ms.topic: concept-article
ms.custom: devx-track-azurecli
#customer intent: As an Azure CLI customer, I want to be able to search for Azure CLI errors and receive more explanation than what is available from the in-line error message. Just don't tell me what an error is, also tell me how to fix it.
---

# Troubleshooting Azure CLI

## Error categories

Most errors returned by the Azure CLI fall into one of these categories:

|Error category | General error cause |
|-|-|
|Unrecognized argument | A parameter is misspelled or doesn't exist.
|[Required argument missing](#error-arguments-are-expected-or-required) | A required parameter isn't specified or only one of two "parameter pairs" is specified. A parameter might also be misspelled.
|Mutually exclusive argument | Two or more parameters can't be specified together.
|[Invalid argument value](#error-invalid-value-or-doesnt-exist) | Parameter _value_ isn't valid. This error is often due to quoting, an escape character or spacing.
|Bad request | An HTTP status code of 400 returns this error. Check for a missing space, missing parameter dash, or an extra or missing single or double quotation mark. This error also happens when a parameter value doesn't contain an allowed value.
|[Resource not found](#error-resource-not-found) | An Azure resource referenced in a parameter value can't be found.
|Authentication | Microsoft Entra authentication failed.

## The `--debug` parameter

One of the best ways to see what the Azure CLI is executing for each Azure CLI reference command is to use the `--debug` parameter. Here's examples of `--debug` for both a failed and successful command:

```azurecli
# Error example: Create a resource group, but omit the quotes around the resource group name.
az group create --location eastus2 --name msdocs-rg-test --debug
```

Here's a portion of the debug output. Notice the log location and unrecognized argument.

```output
cli.knack.cli: Command arguments: ['group', 'create', '-l', 'eastus2', '-name', 'msdocs-rg-test', '--debug']
...
cli.azure.cli.core.azlogging: metadata file logging enabled - writing logs to '/home/myName/.azure/commands/YYYY-MM-DD.HH-MM-SS.group_create.8912.log'.
...
cli.azure.cli.core.azclierror: unrecognized arguments: msdocs-rg-test
...
```

Compare the error `--debug` output given above to a successful execution:

```azurecli
# Correct example: Because the resource group name contains special characters, enclose it in quotes
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

For examples of `--debug` for JSON formatting, see [Quoting differences between scripting languages - JSON strings](./use-azure-cli-successfully-quoting.md#json-strings).

## Common syntax errors

Although the Azure CLI can run in both Bash, PowerShell and Windows Cmd, there are syntax differences between scripting languages. Azure CLI scripts containing single quotes, double quotes, and escape characters usually must be modified when copied between languages. This challenge reveals itself most often in parameter values, especially in values assigned to the `--query` parameter. Here are some common error messages:

* "**Bad request ...{something} is invalid**" might be caused by a space, single or double quotation mark, or lack of a quote.

* "**Unexpected token...**" is seen when there's an extra space or quote.

* "**Invalid jmespath_type value**" error often comes from incorrect quoting in the `--query` parameter.

* "**Variable reference is not valid**" is received when a string isn't formatted properly often due to concatenation or a missing escape character.

* "**Unrecognized arguments**" is often caused by an incorrect line continuation character or misspelled parameter name.

* "**Missing expression after unary operator**" is seen when a line continuation character is missing.

There are several Azure CLI articles dedicated to explaining syntax errors and providing working examples:

* [Quoting differences between scripting languages](./use-azure-cli-successfully-quoting.md)
* [Syntax differences in Bash, PowerShell, and Cmd](./get-started-tutorial-2-environment-syntax.md) tutorial
* Find many `--query` parameter examples in [How-to query Azure CLI command output using a JMESPath query](./use-azure-cli-successfully-query.md)
* [How-to use the Azure CLI in a Bash scripting language](./use-azure-cli-successfully-bash.md)
* [Considerations for running the Azure CLI in a PowerShell scripting language](./use-azure-cli-successfully-powershell.md)

> [!TIP]
> If you can't resolve a command error, try using a different scripting language. **Most Azure CLI documentation is written and tested in Azure Cloud Shell (ACS) with a Bash scripting language.** If you can get an article example to execute in ACS Bash, but it won't execute in Windows PowerShell, review your use of single and double quotes, and escape characters.

## Error: Invalid value or doesn't exist

These errors often occur when trying to use a variable value that contains an incorrect format. The default output for Azure CLI is JSON, so if you're trying to store an ID for an Azure resource in a variable, you must specify `--output tsv`. Here's an example:

```azurecli
# Get a subscription that contains a name or phrase
subscriptionID=$(az account list --query "[?contains(name,'my case sensitive search phrase')].id")
echo $subscriptionID

# output as JSON
[ "00000000-0000-0000-0000-000000000000" ]

# Try to set your subscription to the new ID
az account set --subscription $subscriptionID

# error output
The subscription of '"00000000-0000-0000-0000-000000000000"' doesn't exist in cloud 'AzureCloud'.
```

Now use the `tsv` output type.

```azurecli
# Get the active subscription
subscriptionID=$(az account list --query "[?contains(name,'my case sensitive search phrase')].id" --output tsv)
echo $subscriptionID

# output as TSV
00000000-0000-0000-0000-000000000000

# Successfully set your subscription to the new ID
az account set --subscription $subscriptionID
```

## Error: Arguments are expected or required

You receive this error when an Azure CLI command is missing a required parameter, or _there's a typographical error that causes the Azure CLI to incorrectly parse the reference command_. When working with a script, you also receive this error when one or more conditions are true:

* A line continuation character is missing or incorrect.
* A trailing space exists on the right side of a line continuation character when working in the PowerShell scripting language. At this time, [splatting](/powershell/module/microsoft.powershell.core/about/about_splatting) isn't supported with Azure CLI commands.
* A variable name contains a special character, such as a dash (-).

## Error: Resource not found

When the Azure CLI can't find the resource name or ID passed in a parameter value, it's usually because of one of these reasons:

* The resource name or ID is spelled incorrectly.
* The resource name contains special characters and isn't surrounded by single or double quotes.
* The value being passed to a variable has unseen leading or trailing spaces.
* The resource exists, but is in a different subscription.

## Error: Failed to parse string as JSON

There are quoting differences between Bash, PowerShell in Linux, and PowerShell in Windows. Furthermore, different versions of PowerShell can produce different results. For complex parameters, like a JSON string, the best practice is to use Azure CLI's `@<file>` convention to bypass a shell's interpretation. For more information, see one of these articles:

For JSON syntax examples for Bash, PowerShell and Cmd.exe, see [Quoting differences between scripting languages - JSON strings](./use-azure-cli-successfully-quoting.md#json-strings) tutorial.

## Error: InvalidTemplateDeployment

When you try to create an Azure resource in a location that doesn't offer that resource, you receive an error similar to this message: "Following SKUs have failed for Capacity Restrictions: myDesiredSkuName' is currently not available in location 'mySpecifiedLocation'."

Here's a full error example for a VM that can't be created in the `westus` location:

```azurecli
{"error":{"code":"InvalidTemplateDeployment","message":"The template deployment 'vm_deploy_<32 character ID>'
is not valid according to the validation procedure. The tracking id is '<36 character ID>'.
See inner errors for details.","details":[{"code":"SkuNotAvailable","message":"The requested VM size for resource
'Following SKUs have failed for Capacity Restrictions: Standard_DS1_v2' is currently not available
in location 'westus'. Please try another size or deploy to a different location
or different zone. See https://aka.ms/azureskunotavailable for details."}]}}
```

The solution is to change a property of your requested Azure resource, or try a different location.

## Error: Subscription not found

Assuming that you have not incorrectly typed a subscription name or ID, this error occurs when a resource provider is not registered in the active subscription. For example, if you want to execute `az storage account create`, the `Microsoft.Storage` provider must be registered. To register a resource provider, see [Azure resource providers and types](/azure/azure-resource-manager/management/resource-providers-and-types).

## Error: Bad handshake...certificate verify failed

See [Work behind a proxy](#work-behind-a-proxy) for information on how to resolve this error.

## Work behind a proxy

If you're using Azure CLI over a proxy server that uses self-signed certificates, the Python [requests library](https://github.com/kennethreitz/requests) used by the Azure CLI might cause the following error: `SSLError("bad handshake: Error([('SSL routines', 'tls_process_server_certificate', 'certificate verify failed')],)",)`. To address this error, set the environment variable `REQUESTS_CA_BUNDLE` to the path of CA bundle certificate file in PEM format.

| OS | Default certificate authority bundle |
|---|---|
| Windows 32-bit | `C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\Lib\site-packages\certifi\cacert.pem` |
| Windows 64-bit | `C:\Program Files\Microsoft SDKs\Azure\CLI2\Lib\site-packages\certifi\cacert.pem` |
| Ubuntu/Debian Linux | `/opt/az/lib/python<version>/site-packages/certifi/cacert.pem` |
| CentOS Stream/RHEL/SUSE Linux | `/usr/lib64/az/lib/python<version>/site-packages/certifi/cacert.pem` |
| macOS | `/usr/local/Cellar/azure-cli/<cliversion>/libexec/lib/python<version>/site-packages/certifi/cacert.pem` |

Append the proxy server's certificate to the CA bundle certificate file, or copy the contents to another certificate file. Then set `REQUESTS_CA_BUNDLE` to the new file location. Here's an example:

```console
<Original cacert.pem>

-----BEGIN CERTIFICATE-----
<Your proxy's certificate here>
-----END CERTIFICATE-----
```

Some proxies require authentication. The format of the `HTTP_PROXY` or `HTTPS_PROXY` environment variables should include the authentication, such as `HTTPS_PROXY="https://username:password@proxy-server:port"`. For details, see [How to configure proxies for the Azure SDK for Python](/azure/developer/python/sdk/azure-sdk-configure-proxy?tabs=bash).

## Service principals

For information on troubleshooting service principals, see [Cleanup and Troubleshooting](./azure-cli-sp-tutorial-8.md#troubleshoot-service-principals) in the [Work with service principals](./azure-cli-sp-tutorial-1.md) tutorial.

## Other issues

If you experience a product issue with Azure CLI not listed in this article, [file an issue on GitHub](https://github.com/Azure/azure-cli/issues/new/choose).

## See also

* [Tips for using the Azure CLI successfully](./use-azure-cli-successfully-tips.md)
