---
title: Install the Azure CLI preview manually or offline
description: Learn how to install the Azure CLI preview manually or offline when the one-command installer isn't available.
---

# Install the Azure CLI preview manually or offline

> **Most users should use the [one-command installer](../README.md).** Use this guide for offline installs, as a fallback when `gh` isn't available, when you already have the archive, or to understand the steps the installer performs.

Get from a downloaded azcli archive to a working `az` command: pick the file for your OS and CPU, extract it, and run `az` from that folder. Adding it to `PATH` is optional and manual.

## Pick your download

First choose a package type:

| Package | File name starts with | Use when |
| --- | --- | --- |
| Lean | `azcli-lean` | Smallest package; built-in extensions only. Add more later from the extensions bundle. |
| Full | `azcli` | CLI plus the add-on extensions bundled in the archive. |

Then choose the archive for your machine and package type:

Use the `linux-musl` archives on musl-based distributions such as Alpine Linux. Use the standard
`linux` archives on glibc-based distributions such as Ubuntu, Debian, Fedora, and Azure Linux.

| Your machine | Lean package | Full package |
| --- | --- | --- |
| Windows on Intel/AMD 64-bit | `azcli-lean-<version>-win-x64.zip` | `azcli-<version>-win-x64.zip` |
| Windows on Arm64 | `azcli-lean-<version>-win-arm64.zip` | `azcli-<version>-win-arm64.zip` |
| Linux with glibc on Intel/AMD 64-bit | `azcli-lean-<version>-linux-x64.tar.gz` | `azcli-<version>-linux-x64.tar.gz` |
| Linux with glibc on Arm64 | `azcli-lean-<version>-linux-arm64.tar.gz` | `azcli-<version>-linux-arm64.tar.gz` |
| Linux with musl on Intel/AMD 64-bit | `azcli-lean-<version>-linux-musl-x64.tar.gz` | `azcli-<version>-linux-musl-x64.tar.gz` |
| Linux with musl on Arm64 | `azcli-lean-<version>-linux-musl-arm64.tar.gz` | `azcli-<version>-linux-musl-arm64.tar.gz` |
| macOS on Apple Silicon | `azcli-lean-<version>-macos-arm64.tar.gz` | `azcli-<version>-macos-arm64.tar.gz` |

Both packages are self-contained — you do not need the .NET SDK to run them.

## Extract and run

Extract the archive anywhere you like, then run `az` straight from that folder — the CLI is self-contained. Replace `<version>` and the platform suffix with your downloaded file.

**Linux / macOS** (`.tar.gz`):

```bash
mkdir -p ~/.local/share/azcli
tar -xzf ./azcli-<version>-linux-x64.tar.gz -C ~/.local/share/azcli
chmod +x ~/.local/share/azcli/az
~/.local/share/azcli/az --help
```

**Windows** (`.zip`):

```powershell
Expand-Archive -Path ".\azcli-<version>-win-x64.zip" -DestinationPath "$env:LOCALAPPDATA\Programs\azcli" -Force
& "$env:LOCALAPPDATA\Programs\azcli\az.exe" --help
```

On macOS, if the binary is blocked after download, validate the source, then run `xattr -dr com.apple.quarantine ~/.local/share/azcli`.

## Adding `az` to PATH (optional, manual)

The archive is not registered on your `PATH`, so `az` isn't found automatically — run it by full path, or add its folder to `PATH` yourself. For the current shell only:

```bash
export PATH="$HOME/.local/share/azcli:$PATH"               # Linux / macOS
```

```powershell
$env:Path = "$env:LOCALAPPDATA\Programs\azcli;$env:Path"    # Windows
```

To make it permanent, add that line to your shell profile (`~/.zshrc` / `~/.bashrc`, or your PowerShell `$PROFILE`). Putting azcli on `PATH` makes `az` resolve to it and **shadows** the classic `azure-cli`.

## Verify

| Check | Command |
| --- | --- |
| CLI starts | `az --help` |
| Extensions visible | `az extension list` |

Commands that contact Azure require sign-in and a subscription. If `az` is found but asks you to authenticate, the install itself is working.

## Troubleshooting

| Symptom | Fix |
| --- | --- |
| `az` is not found | Run `az` by its full path, or add its folder to `PATH` (see [Adding `az` to PATH](#adding-az-to-path-optional-manual)). |
| Permission denied (Linux/macOS) | Run `chmod +x <install-root>/az`. |
| macOS blocks the binary | Validate the source, then `xattr -dr com.apple.quarantine <install-root>`. |
| File name doesn't match examples | Use the platform suffix from your downloaded file (e.g. `linux-arm64`, `win-arm64`). |
| A command says an extension is missing | On lean installs, add it from the extensions bundle (see [Install Azure CLI preview extensions](./install-cli-extensions.md)) or use the full package. |
