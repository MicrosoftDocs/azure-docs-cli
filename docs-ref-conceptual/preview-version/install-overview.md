---
title: Install the Azure CLI public preview
description: Learn how to install the Azure CLI public preview.
ms.date: 11/13/2026
---

# Install the Azure CLI public preview

The Azure CLI public preview ships as **azcli** — the `az` command-line tool (self-contained; no .NET SDK needed). It ships in two flavours:

- **full** — built-in + add-on extensions bundled.
- **lean** — built-in extensions only.

> [!NOTE]
> For more information about installing the Az PowerShell modules, see the [Azure PowerShell preview install overview](/powershell/azure/install-azure-powershell?view=azps-preview&preserve-view=true).

## Install azcli (one command)

The installer downloads the latest release from the public [GitHub Releases](https://github.com/Azure/azclips/releases) page. You don't need the GitHub CLI (`gh`), `gh auth login`, or a personal access token.

**Prerequisites:**

- **Linux / macOS / WSL:** Bash, `curl`, `tar`, and standard system text utilities.
- **Windows:** PowerShell 7+.

**Linux / macOS / WSL:**

```bash
curl -fsSL https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-install.sh | bash
```

**Windows (PowerShell 7+):**

```powershell
irm https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-install.ps1 -ErrorAction Stop | iex
```

### Install the lean package

To install only the built-in extensions, use:

```bash
curl -fsSL https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-install.sh | AZCLI_PACKAGE=lean bash
```

```powershell
$env:AZCLI_PACKAGE='lean'
irm https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-install.ps1 -ErrorAction Stop | iex
```

The Bash assignment applies only to the installer process. The PowerShell variable persists for the current session; run `Remove-Item Env:AZCLI_PACKAGE` afterward to restore the default full-package selection. If you previously set this variable, restore its previous value instead.

You can also pass `--package lean` with `bash -s -- --package lean`, or download the PowerShell installer and run `./azcli-install.ps1 -Package lean`.

## Run azcli

By default the installer does **not** modify your `PATH`, so azcli (`az`) installs in isolation and coexists with the classic `azure-cli` (`az`). It lands at `~/.local/share/azcli/az` (Windows: `%LOCALAPPDATA%\Programs\azcli\az.exe`).

- **Run by full path** (no setup):

  ```bash
  ~/.local/share/azcli/az --help
  ```

- **Add to `PATH` for this session** (recommended during preview; does not persist or shadow classic `az` in new shells):

  ```bash
  export PATH="$HOME/.local/share/azcli:$PATH"     # Linux / macOS / WSL — current shell only
  ```

  ```powershell
  $env:Path = "$env:LOCALAPPDATA\Programs\azcli;$env:Path"   # Windows — current session only
  ```

- **Make it permanent** (optional) — add the same line to your shell profile (`~/.zshrc` / `~/.bashrc`, or your PowerShell `$PROFILE`). Note that putting the folder on `PATH` makes `az` resolve to azcli and **shadows** the classic `azure-cli`.

> [!TIP]
> For more information about switching between the two installations in the same session, see [Switch between the classic Azure CLI and the preview build](switch-cli-versions.md).

## Uninstall

```bash
# Linux / macOS / WSL
curl -fsSL https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-uninstall.sh | bash
```

```powershell
# Windows
irm https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-uninstall.ps1 -ErrorAction Stop | iex
```

Removes the preview install directory, not the classic Azure CLI. Download and review the uninstall script first if preferred. To remove a folder that doesn't look like an azcli install, pass `--force` with `bash -s -- --force`, or download the PowerShell script and run `./azcli-uninstall.ps1 -Force`. Use force only after verifying that the folder contains nothing you need to keep.

## Download troubleshooting

The installer reports failed downloads and missing or ambiguous release assets. GitHub's API is rate-limited; if a release lookup returns HTTP 403 or 429, check GitHub's response and retry after the rate limit resets. You can also download the archive from [GitHub Releases](https://github.com/Azure/azclips/releases) and follow the [manual guide](install-cli-manual.md).

Piped Bash execution may not report the downloader's exit status. If the bootstrap download fails, don't assume installation succeeded; check the error output or use the [manual guide](install-cli-manual.md).

## Other install scenarios

| You want to… | Guide |
| --- | --- |
| Install azcli manually / offline (you already have the archive, or prefer not to use the installer) | [Install the Azure CLI preview manually or offline](./install-cli-manual.md) |
| Add an add-on azcli extension (lean installs, or a specific version) | [Install Azure CLI preview extensions](./install-cli-extensions.md) |
| Enable `az` tab completion (bash / zsh / PowerShell) | [Enable Azure CLI preview tab completion](./install-cli-completions.md) |
| Enable AI-based error recovery in Azure CLI | [AI-based error recovery in Azure CLI](./how-to-command-recovery.md) |

## What's in a release

| Category | Files | Platforms | Notes |
| --- | --- | --- | --- |
| CLI archives | `azcli-lean-…` and `azcli-…` | 8 platform variants | Windows x64/Arm64, Linux glibc x64/Arm64, Linux musl x64/Arm64, and macOS x64/Arm64. Lean = built-in extensions only; Full = built-in + add-on extensions bundled. Self-contained, no .NET SDK needed. |
| Extension roll-up | `azcli-extensions-<version>.tar.gz` | agnostic | Convenience bundle of all extension packages. |
| CLI extension packages | `azcli.extensions.*.nupkg` | agnostic | Install into an existing CLI with `az extension add`. |

## Supported platforms

| OS and C library | x64 / Intel | Arm64 / Apple Silicon |
| --- | --- | --- |
| Windows | `win-x64` | `win-arm64` |
| Linux with glibc (Ubuntu, Debian, Fedora, Azure Linux) | `linux-x64` | `linux-arm64` |
| Linux with musl (Alpine Linux) | `linux-musl-x64` | `linux-musl-arm64` |
| macOS | `macos-x86_64` | `macos-arm64` |

Throughout these guides, replace `<version>` with the version in your downloaded file name. Preview and beta builds may include a `-preview` suffix in the file name.
