---
title: Azure command line tools survey guidance
description: This article contains guidance about the Azure command line tools survey.
author: dbradish-microsoft
ms.author: dbradish
ms.date: 06/19/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
---

# Azure command line tools survey guidance

When using the Azure CLI, you may be invited to participate in a survey to tell us about your
experience. By responding to the survey, you help to identify common issues and areas for
improvement. Understanding your experiences and opinions helps to make future releases of Azure
command line tools better for you and others.

## What data is collected

The survey collects anonymized feedback about your satisfaction with Azure command line tools and
doesn't collect any private or personal data.

While we appreciate the insights this data provides, we understand not everyone wants to be prompted
to complete a survey. You can disable being prompted to participate in surveys with the `az config`
command or via an environment variable.

## Disable the survey

In the following example, the `az config` command is used to disable the survey message.

```azurecli
az config set core.survey_message=false
```

You can also use the `AZURE_CORE_SURVEY_MESSAGE` environment variable to disable the survey message.

## Privacy statement

Your privacy is important to us.
[Microsoft's Privacy Statement](https://privacy.microsoft.com/privacystatement) explains the
personal data Microsoft processes, how Microsoft processes it, and for what purposes.
