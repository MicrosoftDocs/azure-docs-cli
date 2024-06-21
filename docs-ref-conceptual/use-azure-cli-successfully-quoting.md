---
title: Quoting differences in CLI scripting languages | Microsoft Docs
description: Learn about quoting difference between Bash, PowerShell, and Cmd. Find examples for escape characters, single and double quotes.
ms.date: 06/21/2024
ms.topic: concept-article
ms.custom: devx-track-azurecli, seo-azure-cli, linux-related-content
---

# Quoting differences between scripting languages

When you work with Azure CLI commands, be aware of how your shell uses quotation marks and escapes characters. If you support scripts used in different shells, understand how they differ.

## Scripting language rules

Here are quick links to scripting language rules:

* Bash scripting language: [Bash quoting rules](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
* PowerShell scripting language: [PowerShell Quoting Rules](/powershell/module/microsoft.powershell.core/about/about_quoting_rules)
* Windows Command Prompt: [How-to: Escape Characters, Delimiters, and Quotes at the Windows command line](https://ss64.com/nt/syntax-esc.html)

> [!NOTE]
> Due to a known issue in PowerShell, some extra escaping rules apply. For more information, see [Quoting issues with PowerShell](https://github.com/Azure/azure-cli/blob/dev/doc/quoting-issues-with-powershell.md).

## Tips for parameter values containing quotes

To avoid unanticipated results with parameters containing single or double quotes, or escape characters, here are a few suggestions:

* If you provide a parameter that contains whitespace, wrap it in quotation marks.

* In Bash or PowerShell, both single and double quotes are interpreted correctly. In Windows Command Prompt, only double quotes are interpreted correctly. Single quotes are treated in Cmd.exe as part of the value.

* If your command is only going to run on Bash (or Zsh), use single quotes to preserve the content inside the JSON string. Single quotes are necessary when supplying inline JSON values. For example, this JSON is correct in Bash: `'{"key": "value"}'`.

* If your command runs at a Windows Command Prompt, you must use double quotes. If the value contains double quotes, you must escape it. The equivalent of the above JSON string is `"{\"key\": \"value\"}"`

* In PowerShell, if your value is an empty string, use `'""'`.

* In Bash or PowerShell, if your value is an empty quotes string `''`, use `"''"`.

* Use Azure CLI's `@<file>` convention to load from a file and bypass the shell's interpretation mechanisms.

  ```azurecli
  az ad app create --display-name myName --native-app --required-resource-accesses @manifest.json
  ```

* Bash evaluates double quotes in exported variables. If this behavior isn't what you want, escape the variable: `"\$variable"`.

* Some Azure CLI commands take a list of space separated values.
  * If the key name or value contains spaces, wrap the whole pair: `"my key=my value"`. For example:

    ```azurecli
    az web app config app settings set --resource-group myResourceGroup --name myWebAppName --settings "client id=id1" "my name=john"
    ```

  * When a CLI parameter states that it accepts a space-separated list, one of two formats is expected:
    1. Unquoted, space-separated list
       `--parameterName firstValue secondValue`
    1. Quoted space-separated list
       `--parameterName "firstValue" "secondValue"`

    This example is a string with a space in it. It isn't a space-separated list:
       `--parameterName "firstValue secondValue"`

* There are special characters of PowerShell, such as at `@`. To run Azure CLI in PowerShell, add `` ` `` before the special character to escape it. You can also enclose the value in single or double quotes `"`/`"`.

  ```powershell
  # The following three examples will work in PowerShell
  --parameterName `@parameters.json
  --parameterName '@parameters.json'
  --parameterName "@parameters.json"

  # This example will not work in PowerShell
  --parameterName @parameters.json
  ```

* When you use the `--query` parameter with a command, some characters of [JMESPath](https://jmespath.org/specification.html) need to be escaped in the shell.

  ### [Bash](#tab/bash)

  These three commands are correct and equivalent in Bash:

  ```azurecli
  az version --query '"azure-cli"'
  az version --query \"azure-cli\"
  az version --query "\"azure-cli\""
  ```

  Here are two examples of _incorrect commands_ in Bash:

  ```azurecli
  # Wrong, as the dash needs to be quoted in a JMESPath query
  az version --query azure-cli
  az version: error: argument --query: invalid jmespath_type value: 'azure-cli'

  # Wrong, as the dash needs to be quoted in a JMESPath query, but quotes are interpreted by Bash
  az version --query "azure-cli"
  az version: error: argument --query: invalid jmespath_type value: 'azure-cli'
  ```

  For more example comparisons between Bash, PowerShell, and Cmd, see [Query Azure CLI command output](./query-azure-cli.md)

  ### [PowerShell](#tab/powershell)

  These five commands work correctly in PowerShell:

  ```azurecli
  az version --query '\"azure-cli\"'
  az version --query "\`"azure-cli\`""
  az version --query "\""azure-cli\"""
  az --% version --query "\"azure-cli\""
  az --% version --query \"azure-cli\"
  ```

  For more example comparisons between Bash, PowerShell, and Cmd, see [Query Azure CLI command output](./query-azure-cli.md)

  ### [Cmd](#tab/cmd)

  These two commands work correctly in Windows Command Prompt:

  ```azurecli
  az version --query "\"azure-cli\""
  az version --query \"azure-cli\"
  ```

  For more `--query` example comparisons between Bash, PowerShell, and Cmd, see [Query Azure CLI command output](./use-azure-cli-successfully-query.md)

  ---

* The best way to troubleshoot a quoting issue is to run the command with the `--debug` flag. This flag reveals the actual arguments received by the Azure CLI in [Python's syntax](https://docs.python.org/3/tutorial/introduction.html#strings). For more information on debugging Azure CLI commands, see the [Troubleshooting Azure CLI](./use-azure-cli-successfully-troubleshooting.md#the---debug-parameter)

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

## See also

Find many more scripting language comparisons in these articles:

* [Syntax differences in Bash, PowerShell, and Cmd](./get-started-tutorial-2-environment-syntax.md) tutorial
* [How to query Azure CLI command output using a JMESPath query](./use-azure-cli-successfully-query.md)
* [How-to use the Azure CLI in a Bash scripting language](./use-azure-cli-successfully-bash.md)
* [Considerations for running the Azure CLI in a PowerShell scripting language](./use-azure-cli-successfully-powershell.md)
