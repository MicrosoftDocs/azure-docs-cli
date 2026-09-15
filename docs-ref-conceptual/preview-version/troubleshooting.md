---
title: Troubleshoot Azure CLI issues (Private preview)
description: Learn what to do if you encounter issues while using Azure CLI during the private preview and how to report problems to the development team.
ms.topic: troubleshooting
---

# Troubleshoot Azure CLI issues (Private preview)

This article provides general guidance for troubleshooting issues encountered while using Azure CLI
during the private preview.

Because Azure CLI is under active development, you may encounter unexpected behavior, incomplete
functionality, or other issues.

## Report an issue

If you encounter a problem that you can't resolve, report it in [the AzCLIPS GitHub repository][01].

When creating an issue, include as much information as possible, such as:

- A description of the issue
- The command you ran
- Any error messages or output
- Your operating system and shell
- The Azure CLI version
- Steps to reproduce the issue, if known

Providing detailed information helps the development team investigate and resolve issues more
quickly.

## Known issues

Known issues and workarounds will be added to this article as they become available.

### Browser launch issues in WSL (Linux)

If Azure CLI can't open links in your browser when running inside WSL, verify your `wslu` setup:

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

For more details, see:

- <https://wslu.wedotstud.io/wslu/install.html>
- <https://github.com/wslutilities/wslu>
- <https://launchpad.net/~wslutilities/+archive/ubuntu/wslu>
- <https://learn.microsoft.com/windows/wsl/>

## Next steps

If you continue to experience problems, submit an issue in [the AzCLIPS GitHub
repository][01] so the development team can investigate.

<!-- link references -->

[01]: https://github.com/Azure/azclips/issues
