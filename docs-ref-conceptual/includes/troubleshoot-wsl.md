---
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 11/26/2018
ms.topic: include
---
### CLI fails to install or run on Windows Subsystem for Linux

Since [Windows Subsystem for Linux (WSL)](/windows/wsl/about) is a system call translation layer on top of the
Windows platform, you might experience an error when trying to install or run the Azure CLI. The CLI relies on
some features that may have a bug in WSL. If you experience an error no matter how you install the CLI,
there's a good chance it's an issue with WSL and not with the CLI install process.

To troubleshoot your WSL installation and possibly resolve issues:

* If you can, run an identical install process on a Linux machine or VM to see if it succeeds. If it does,
  your issue is almost certainly related to WSL. To start a Linux VM in Azure, see the
  [create a Linux VM in the Azure Portal](/azure/virtual-machines/linux/quick-create-portal) documentation.
* Make sure that you're running the latest version of WSL. To get the latest version,
  [update your Windows 10 installation](https://support.microsoft.com/help/4027667/windows-10-update).
* Check for any [open issues](https://github.com/Microsoft/WSL/issues) with WSL which might address your problem.
  Often there will be suggestions on how to work around the problem, or information about a release where 
  the issue will be fixed.
* If there are no existing issues for your problem, [file a new issue with WSL](https://github.com/Microsoft/WSL/issues/new)
  and make sure that you include as much information as possible.

If you continue to have issues installing or running on WSL, consider [installing the CLI for Windows](../install-azure-cli-windows.md).
