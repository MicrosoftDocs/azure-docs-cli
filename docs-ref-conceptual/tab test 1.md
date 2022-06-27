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

Azure CLI is ...

## Output formatting

Three common output formats are used with Azure CLI commands:

## Use quotation marks in parameters

When you work with Azure CLI commands, be aware of how your shell uses quotation marks and escapes characters. If you support scripts used in different shells, you need to understand how they differ.

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

## Asynchronous operations

## See also

- [Configure the Azure CLI](./azure-cli-configuration.md)
- [Learn to use Bash with Azure CLI](./azure-cli-learn-bash.md)
- [Query Azure CLI command output](./query-azure-cli.md)
- [Use variables in Azure CLI commands](./azure-cli-variables.md)
