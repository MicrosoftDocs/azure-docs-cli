---
title: Quoting differences in scripting languages | Microsoft Docs
description: Learn about quoting difference between Bash, PowerShell, and Cmd. Find examples for escape characters, single and double quotes.
ms.date: 06/26/2024
ms.topic: concept-article
ms.custom: devx-track-azurecli
#customer intent: As a manager of Azure resources, I want to quickly find solutions to quoting errors in Azure CLI commands. I want all tips and techniques for quoting to be in one place so I don't have to review multiple how-to guides and tutorials.
---

# Quoting differences between scripting languages

When you work with Azure CLI commands, be aware of how your scripting language uses quotation marks
and escapes characters. If you support scripts used in different shells, understanding quoting
differences saves you valuable development hours.

To avoid unanticipated results with parameter values containing single or double quotes, or escape
characters, here are a few suggestions:

## White spaces and quotation marks

* If you provide a parameter value that contains white space, wrap the value in quotation marks.

* In Bash and PowerShell, if your variable value contains single quotes, wrap the value in double
  quotes, and vice-versa.

* In Bash, double quotes that are escaped, are treated as part of the string.

* In Windows Command Prompt, quotes inside variable values are treated as part of the value.

Here are a few examples:

### [Bash](#tab/bash1)

```azurecli
# Correct
myVariable="my string ' ' wrapped in double quotes"
myVariable='my string " " wrapped in single quotes'
myVariable="my string with escaped \" \" double quotes wrapped in double quotes"

# Wrong, escaped single quotes in Bash are not treated as part of the string
myVariable='my value with escaped \' \' single quotes wrapped in single quotes'

# after each example ...
echo $myVariable
```

Bash output for the correct examples is as follows:

```output
my string ' ' wrapped in double quotes
my string " " wrapped in single quotes
my string with escaped " " double quotes wrapped in double quotes
```

If you want the quotes included in the output, escape the variable like this: `echo \"$myVariable\"`.

```output
echo \"$myVariable\"
"my string ' ' wrapped in double quotes"

echo \'$myVariable\'
'my string " " wrapped in single quotes'

echo \"$myVariable\"
"my string with escaped " " double quotes wrapped in double quotes"
```

### [PowerShell](#tab/powershell1)

```azurecli
# Correct
$myVariable = "my string ' ' wrapped in single quotes"
$myVariable = 'my string " " wrapped in double quotes'

# Wrong
$myVariable = "my value with escaped `" `" double quotes"
$myVariable = 'my value with escaped `' `' single quotes'

# after each example ...
echo $myVariable
```

PowerShell output for the correct examples is as follows:

```output
my string ' ' wrapped in double quotes
my string " " wrapped in single quotes
```

For more quoting considerations and examples when working in a PowerShell scripting language, see [Considerations for running the Azure CLI in a PowerShell scripting language](./use-azure-cli-successfully-powershell.md).

### [Cmd](#tab/cmd1)

```azurecli
set myVariable="my value with ' ' single quotes"
set myVariable='my value with " " double quotes'

set myVariable="my second value with " " double quotes"
set myVariable='my second value with ' ' single quotes'

# after each example ...
echo %myVariable%
```

Cmd.exe is the only scripting language in our examples that allow embedded quotes that are the same
as the string wrapper. However, also note that Cmd.exe returns the outer quotation marks. Bash and
PowerShell don't.

```output
"my value with ' ' single quotes"
'my value with " " double quotes'

"my second value with " " double quotes"
'my second value with ' ' single quotes'
```

---

## JSON strings

* Use single quotes to preserve the content inside a JSON string. Single quotes are necessary when supplying inline JSON values. For example, this JSON is correct in both Bash and PowerShell: `'{"key": "value"}'`.

* If your command runs at a Windows Command Prompt, you must use double quotes. The equivalent of the above JSON string in Cmd.exe is `"{"key":"value"}" `.

* If the JSON value contains double quotes, you must escape them.
  
* When working with JSON parameter values, consider using Azure CLI's `@<file>` convention and
  bypass the shell's interpretation mechanisms.
  
  ```azurecli
  az ad app create --display-name myName --native-app --required-resource-accesses @manifest.json
  ```

Here are the accepted JSON format patterns for Bash, PowerShell and Cmd:

### [Bash](#tab/bash2)

Use Bash's `clear` command to remove console output between tests.

```azurecli
# Correct in Bash
az '{"key":"value"}' --debug
>> Command arguments: ['{"key":"value"}', '--debug']

az "{\"key\":\"value\"}" --debug
>> Command arguments: ['{"key":"value"}', '--debug']
```

These next two examples are **incorrect** as quotes and spaces are interpreted by Bash.

|Incorrect format|Problem|Console output|
|-|-|-|
|az {"key":"value"} --debug |Missing single quotes or escape characters| Command arguments: ['{key:value}', '--debug']
|az {"key": "value"} --debug |Missing single quotes or escape characters, and contains extra space | Command arguments: ['{key:', 'value}', '--debug']

### [Powershell](#tab/powershell2)

Use PowerShell's `cls` or `clear` command to remove console output between tests.

```azurecli
# Correct in PowerShell
az '{"key": "value"}' --debug
>> Command arguments: ['{key: value}', '--debug']

az "{`"key`": `"value`"}" --debug
>> Command arguments: ['{key: value}', '--debug']

az "{""key"": ""value""}" --debug
>> Command arguments: ['{key: value}', '--debug']
```

These next three examples are all **incorrect** in PowerShell.

|Incorrect format|Problem |Console output|
|-|-|-|
|az "{\\"key\\":\\"value\\"}" --debug | Contains Bash escape characters | Command arguments: ['{\\', 'key\\:\\value\\}', '--debug']
|az {"key":"value"} --debug | Missing single quotes | Unexpected token ':"value"' in expression or statement.
|az {"key": "value"} --debug | Missing single quotes and contains an extra space | Error: Unexpected token ':' in expression or statement.

### [Cmd](#tab/cmd2)

Use the Cmd's `cls` command to remove console output between tests.

```azurecli
# Correct in Windows Command 
az "{"key":"value"}" --debug
>> Command arguments: ['{key:value}', '--debug']
```

These next three examples are all **incorrect** in Windows Command. 

|Incorrect format|Problem |Console output|
|-|-|-|
|az "{"key":"value"}" --debug | Missing escape characters | Command arguments: ['{key:value}', '--debug']
|az '{"key":"value"}' --debug |Missing escape characters and is using single quotes where double quotes are expected.| Command arguments: ["'{key:value}'", '--debug']
|az {"key":"value"} --debug | Missing escape characters and double quotes | Command arguments: ['{key:value}', '--debug']

---

## Empty strings

* In PowerShell, if your value is an empty quotes string (`''`), use `'""'`.

* In Bash or PowerShell, if your value is an empty quotes string (`''`), use `"''"`.
  
  ```azurecli
  # Correct in Bash
  myVariable="''"
  
  # Correct in PowerShell
  $myVariable = "''"
  $myVariable = '""'
  ```

## Space-separated values

Some Azure CLI commands take a list of space separated values. If the key name or value contains
spaces, wrap the whole pair: `"my key=my value"`. For example:

```azurecli
az web app config app settings set --resource-group myResourceGroup --name myWebAppName --settings "client id=id1" "my name=john"
```

When a CLI parameter states that it accepts a space-separated list, one of two formats is expected:

* Example of unquoted, space-separated list: `--parameterName firstValue secondValue`

* Example of quoted space-separated list: `--parameterName "firstValue" "secondValue"`

**This example is a string with a space in it. It isn't a space-separated list**: `--parameterName "firstValue secondValue"`

## Special characters

There are special characters in the PowerShell scripting language, such as at `@`. To run Azure CLI
in PowerShell, add `` ` `` before the special character to escape it. You can also enclose the value
in single or double quotes `"`/`"`.

  ```powershell
  # The following three examples will work in PowerShell
  --parameterName `@parameters.json
  --parameterName '@parameters.json'
  --parameterName "@parameters.json"

  # This example will not work in PowerShell
  --parameterName @parameters.json
  ```

## Hyphen characters

If a parameter's value begins with a hyphen, Azure CLI tries to parse it as a parameter name. To
parse it as value, use `=` to concatenate the parameter name and value: `--password="-VerySecret"`.

## The `--query` parameter

When you use the `--query` parameter with a command, some characters of [JMESPath](https://jmespath.org/specification.html) need to be escaped in the shell.

### [Bash](#tab/bash3)

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

### [PowerShell](#tab/powershell3)

These five commands work correctly in PowerShell:

```azurecli
az version --query '\"azure-cli\"'
az version --query "\`"azure-cli\`""
az version --query "\""azure-cli\"""
az --% version --query "\"azure-cli\""
az --% version --query \"azure-cli\"
```

### [Cmd](#tab/cmd3)

These two commands work correctly in Windows Command Prompt:

```azurecli
az version --query "\"azure-cli\""
az version --query \"azure-cli\"
```

---

For more example comparisons between Bash, PowerShell, and Cmd, see [Query Azure CLI command output](./use-azure-cli-successfully-query.md).

## The `--debug` parameter

The best way to troubleshoot a quoting issue is to run the command with the `--debug` flag. This
flag reveals the actual arguments received by the Azure CLI in [Python's syntax](https://docs.python.org/3/tutorial/introduction.html#strings).



For more information on troubleshooting Azure CLI commands with `--debug`, see [Troubleshooting Azure CLI](./use-azure-cli-successfully-troubleshooting.md#the---debug-parameter).

## Scripting language rules

Here are quick links to scripting language rules as published by their respective organizations:

* Bash scripting language: [Bash quoting rules](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
* PowerShell scripting language: [PowerShell Quoting Rules](/powershell/module/microsoft.powershell.core/about/about_quoting_rules)
* Windows Command Prompt: [How-to: Escape Characters, Delimiters, and Quotes at the Windows command line](https://ss64.com/nt/syntax-esc.html)

> [!NOTE]
> Due to a known issue in PowerShell, some extra escaping rules apply. For more information, see [Considerations for running the Azure CLI in a PowerShell scripting language](./use-azure-cli-successfully-powershell.md).

## See also

Find many more scripting language comparisons in these articles:

* [Learn syntax differences in Bash, PowerShell, and Cmd](./get-started-tutorial-2-environment-syntax.md) tutorial
* [Query Azure CLI command output using a JMESPath query](./use-azure-cli-successfully-query.md)
* [Considerations for running the Azure CLI in a PowerShell scripting language](./use-azure-cli-successfully-powershell.md)
