---
ms.topic: include
ms.custom: devx-track-azurecli, linux-related-content
---

## Before you begin

It's strongly recommended to install the Azure CLI with a package manager. A package manager makes
sure you always get the latest updates, and guarantees the stability of Azure CLI components. Check
and see if there's a package for your distribution before installing manually.

## Requirements

- [Python 3.8 or higher][06] - For more information, see
  [Support lifecycle - Python dependency][01].
- [libffi][04]
- [OpenSSL 1.0.2][05]
- `python3-venv` and `pip` packages for your distro

Azure CLI has dropped support for Python 2.7 since version [2.1.0][02].

## Install or update Azure CLI

> [!IMPORTANT]
> These steps install Azure CLI into a **virtual environment** under your home directory and add a
> symlink to `~/bin/az`. This keeps Azure CLI isolated from system Python and makes updates
> straightforward.

```bash
# Create and activate a virtual environment
python3 -m venv ~/lib/azure-cli
source ~/lib/azure-cli/bin/activate

# Upgrade pip and install (or update) Azure CLI
python -m pip install --upgrade pip
pip install --upgrade azure-cli

# Expose 'az' on your PATH via a user bin folder
mkdir -p ~/bin
ln -sf ~/lib/azure-cli/bin/az ~/bin/az

# Ensure ~/bin is on PATH for future shells
grep -q 'export PATH="$HOME/bin:$PATH"' ~/.bashrc || echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc

# Refresh shell command cache (bash/zsh)
hash -r
```

> [!NOTE]
> If you're using zsh, replace `.bashrc` with `.zshrc` in the PATH update command so the change
applies to future zsh sessions.

- To update later:

  ```bash
  source ~/lib/azure-cli/bin/activate
  pip install --upgrade azure-cli
  hash -r
  ```

## Uninstall Azure CLI

1. Remove the virtual environment and symlink.

   ```bash
   rm -rf ~/lib/azure-cli
   rm -f ~/bin/az
   ```

1. (Optional) Remove the PATH line from your shell profile if you added it:

   ```text
   export PATH="$HOME/bin:$PATH"
   ```

1. Refresh the shell command cache:

   ```bash
   hash -r
   ```

### Remove data

[!INCLUDE [remove-data-boilerplate.md](remove-data-boilerplate.md)]

## Troubleshooting

Here are some common problems seen during a manual installation. If you experience a problem not
covered here, [file an issue on GitHub][03].

- **`az: command not found`**

  - Make sure `~/bin` is on your `PATH` (`echo $PATH`), the symlink exists (`ls -l ~/bin/az`), then
    `hash -r` and reopen your shell.

- **SSL/crypto errors**

  - Ensure OpenSSL and libffi are installed for your distro and that your Python build links against
    them.

- **Proxy issues**

  - Configure pip or environment variables (for example, `HTTPS_PROXY`) and allow access to:

    - `https://pypi.org/`
    - `https://files.pythonhosted.org/`
    - Any endpoints used by your distro's package manager (for Python/venv prerequisites)

[!INCLUDE[troubleshoot-wsl.md](troubleshoot-wsl.md)]

<!-- link references -->

[01]: ../azure-cli-support-lifecycle.md#python-dependency
[02]: /cli/azure/release-notes-azure-cli#february-18-2020
[03]: https://github.com/Azure/azure-cli/issues
[04]: https://sourceware.org/libffi/
[05]: https://www.openssl.org/source/
[06]: https://www.python.org/downloads/
