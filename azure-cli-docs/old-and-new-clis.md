---
title: Old and new Azure CLIs
description: There is a new CLI for Azure - Azure CLI 2.0 (Preview). How do the old and new CLIs compare?
keywords: Azure CLI 2.0, Linux, Mac, Windows, OS X, Ubuntu, Debian, CentOS, RHEL, SUSE, CoreOS, Docker, Windows, Python, PIP
author: allclark
manager: douge
ms.date: 11/14/2016
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.assetid: 80ae9f6c-adb7-483c-bfb4-fbb958e075ba
---

# Old and new Azure CLIs

With the continued growth of Azure, we’ve seen a lot of customers using our command-line tools,
particularly the Windows PowerShell tools and our Azure command-line interface (CLI).
We’ve received a lot of feedback on the great productivity provided by command-line tools,
but have also heard, especially from customers working with Linux,
about our current CLI and its poor integration with popular Linux command-line tools
and difficulties with installing and maintaining the Node environment (on which it was based).

Based on this feedback - along with the growth in the Azure Resource Manager-based configuration model -
we improved the CLI experience and now provide a great experience for Azure.
We’re calling it the Azure CLI 2.0 (Preview), now available as a beta on [GitHub](http://github.com/azure/azure-cli).

As we set out to develop our next generation of command-line tools, we quickly settled on some guiding principles:
- **It must be natural and easy to install:**
  Regardless of your platform, our CLI should be installed from where you expect it,
  be it from “brew install azure-cli” on a MacBook, or from “apt-get install azure-cli” for BASH on Windows (coming soon).
- **It must be consistent with POSIX tools:**
  Success with command-line tools is the result of the ease and predictability
  that comes with the implementation of well-understood standards.
- **It must be part of the open source ecosystem:**
  The value of open source comes from the community and the amazing features and integrations they develop,
  from DevOps (Chef, Ansible) solutions to query languages (JMESPath).
- **It must be evergreen and current with Azure:**
  In an age of continuous delivery, it's not enough to simply deploy a service.
  We must have up-to-date tools that let our customers immediately take advantage of that service.

As we applied these principles, we realized that the scope of improvements went beyond a few breaking changes,
and when combined with the feedback we’ve received about our old CLI,
it made sense to start from the ground up.
This choice allowed us to focus exclusively on the resource manager [deployment model](https://docs.microsoft.com/azure/resource-manager-deployment-model).

So Azure CLI 2.0 (Preview) (az) is applicable when you use the resource manager deployment model.
When you use the service management deployment model, you need to contiunue to use Azure CLI (azure).
You can, of course, continue to use Azure CLI (azure) with the resource manager deployment model as you do today,
but we recommend you plan to switch to Azure CLI 2.0 (Preview) when you're able to do that.

[Get started](get-started-with-az-cli2.md) with Azure CLI 2.0 (Preview) now.

