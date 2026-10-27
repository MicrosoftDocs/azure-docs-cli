---
title: Troubleshoot Azure CLI issues (preview)
description: Learn what to do if you encounter issues while using Azure CLI during the preview and how to report problems to the development team.
ms.topic: troubleshooting
ms.date: 10/27/2026
ai-usage: ai-assisted
---

# Troubleshoot Azure CLI issues (preview)

This article helps you troubleshoot the Azure CLI preview and report issues.

## Browser launch issues in WSL (Linux)

If the Azure CLI preview can't open links in your browser when running inside Windows Subsystem for Linux (WSL), verify your `wslu` setup:

1. Check your installed `wslu` version:

   ```bash
   apt-cache policy wslu
   ```

2. Add the official `wslu` PPA:

   ```bash
   sudo add-apt-repository ppa:wslutilities/wslu
   ```

3. Update packages and install `wslu`:

   ```bash
   sudo apt update && sudo apt install wslu
   ```

4. Verify `wslview`:

   ```bash
   wslview --version
   wslview https://wslu.wedotstud.io/wslu/install.html#ubuntu
   ```

5. Ensure the `BROWSER` environment variable points to `wslview`:

   ```bash
   export BROWSER=/usr/bin/wslview
   ```

   Add this line to your `~/.bashrc` to persist it.

6. Confirm WSL interop is enabled in `/etc/wsl.conf`:

   ```bash
   cat /etc/wsl.conf
   ```

   The `[interop]` section should have `enabled=true`:

   ```text
   [interop]
   enabled=true
   ```

   If interop is disabled, enable it and restart WSL.

- For more information, see [Install wslu](https://wslu.wedotstud.io/wslu/install.html).
- For more information, see [wslu on GitHub](https://github.com/wslutilities/wslu).
- For more information, see [wslu packages for Ubuntu](https://launchpad.net/~wslutilities/+archive/ubuntu/wslu).
- For more information, see [Windows Subsystem for Linux documentation](/windows/wsl/).

## Report an issue

If you encounter a problem that you can't resolve, report it in [the AzCLIPS GitHub repository][01].
Include:

- A description of the issue
- The command you ran
- Any relevant error messages or output
- Your operating system and shell version
- The Azure CLI preview version
- Steps to reproduce the issue
- Expected and actual behavior

Before sharing commands, logs, or output, remove credentials, access tokens, and sensitive information.

<!-- link references -->

[01]: https://github.com/Azure/azclips/issues
