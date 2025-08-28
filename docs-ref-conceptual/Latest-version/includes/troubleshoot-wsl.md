---
ms.topic: include
ms.custom: devx-track-azurecli
---

### CLI fails to install or run on Windows Subsystem for Linux

Since [Windows Subsystem for Linux (WSL)][03] is a system call translation layer on top of the
Windows platform, you might experience an error when trying to install or run the Azure CLI. The CLI
relies on some features that may have a bug in WSL. If you experience an error no matter how you
install the CLI, there's a good chance it's an issue with WSL and not with the CLI install process.

To troubleshoot your WSL installation and possibly resolve issues:

- If you can, run an identical install process on a Linux machine or VM to see if it succeeds. If it does,
  your issue is likely related to WSL. To start a Linux VM in Azure, see the
  [create a Linux VM in the Azure portal][02] documentation.
- Make sure that you're running the latest version of WSL. To get the latest version,
  [update your Windows 10 installation][06].
- Check for any [open issues][04] with WSL that might address your problem.
  Often there are suggestions on how to work around the problem, or information about a release where 
  the issue is fixed.
- If there are no existing issues for your problem, [file a new issue with WSL][05]
  and make sure that you include as much information as possible.

If you continue to have issues installing or running on WSL, consider
[installing the CLI for Windows][01].

<!-- link references -->

[01]: ../install-azure-cli-windows.md
[02]: /azure/virtual-machines/linux/quick-create-portal
[03]: /windows/wsl/about
[04]: https://github.com/Microsoft/WSL/issues
[05]: https://github.com/Microsoft/WSL/issues/new
[06]: https://support.microsoft.com/help/4027667/windows-10-update
