---
title: Install the Azure CLI preview
description: Learn how to install the Azure CLI preview.
---

# Install the Azure CLI preview

The Azure CLI preview ships as **azcli** — the `az` command-line tool (self-contained; no .NET SDK needed). It ships in two flavours:

- **full** — built-in + add-on extensions bundled.
- **lean** — built-in extensions only.

> [!NOTE]
> For the Az PowerShell modules, see the [Azure PowerShell preview install overview](../../azure-powershell/docs-conceptual/install-overview.md).

## Install azcli (one command)

Preview artifacts live in a **private** GitHub repo; your account has **read** access. The installer uses your authenticated GitHub CLI (`gh`) session — no personal access tokens or manual asset URLs.

**Prerequisites** — install the [GitHub CLI](https://cli.github.com/) and sign in once:

```bash
gh auth login    # verify with: gh auth status
```

**Linux / macOS (Apple Silicon):**

```bash
gh api repos/Azure/azclips/contents/install/azcli-install.sh -H 'Accept: application/vnd.github.raw' | bash
```

**Windows (PowerShell 7+):**

```powershell
gh api repos/Azure/azclips/contents/install/azcli-install.ps1 -H 'Accept: application/vnd.github.raw' > azcli-install.ps1 && ./azcli-install.ps1
```

Pass installer options after `--` (bash) or as parameters (PowerShell) — for example the lean package:

```bash
gh api repos/Azure/azclips/contents/install/azcli-install.sh -H 'Accept: application/vnd.github.raw' | bash -s -- --package lean
```

```powershell
gh api repos/Azure/azclips/contents/install/azcli-install.ps1 -H 'Accept: application/vnd.github.raw' > azcli-install.ps1 && ./azcli-install.ps1 -Package lean
```

### Installer options

| Option (bash) | Option (PowerShell) | Default | Purpose |
| --- | --- | --- | --- |
| `--package lean\|full` | `-Package lean\|full` | `full` | Full = built-in + add-on extensions bundled; lean = built-in extensions only. |

Environment variable equivalent (bash and PowerShell): `AZCLI_PACKAGE`.

## Run azcli

By default the installer does **not** modify your `PATH`, so azcli (`az`) installs in isolation and coexists with the classic `azure-cli` (`az`). It lands at `~/.local/share/azcli/az` (Windows: `%LOCALAPPDATA%\Programs\azcli\az.exe`).

- **Run by full path** (no setup):

  ```bash
  ~/.local/share/azcli/az --help
  ```

- **Add to `PATH` for this session** (recommended during preview; does not persist or shadow classic `az` in new shells):

  ```bash
  export PATH="$HOME/.local/share/azcli:$PATH"     # Linux / macOS — current shell only
  ```

  ```powershell
  $env:Path = "$env:LOCALAPPDATA\Programs\azcli;$env:Path"   # Windows — current session only
  ```

- **Make it permanent** (optional) — add the same line to your shell profile (`~/.zshrc` / `~/.bashrc`, or your PowerShell `$PROFILE`). Note that putting the folder on `PATH` makes `az` resolve to azcli and **shadows** the classic `azure-cli`.

> [!TIP]
> Want to keep both installed and switch between the classic Azure CLI and the preview build in the same session? See [Switch between the classic Azure CLI and the preview build](./switch-cli-versions.md).

## Uninstall

```bash
# Linux / macOS
gh api repos/Azure/azclips/contents/install/azcli-uninstall.sh -H 'Accept: application/vnd.github.raw' | bash
```

```powershell
# Windows
gh api repos/Azure/azclips/contents/install/azcli-uninstall.ps1 -H 'Accept: application/vnd.github.raw' > azcli-uninstall.ps1 && ./azcli-uninstall.ps1
```

Removes the install directory. Pass `--force` / `-Force` to remove a folder that doesn't look like an azcli install.

## Other install scenarios

| You want to… | Guide |
| --- | --- |
| Install azcli manually / offline (no `gh`, or you already have the archive) | [install-cli-manual.md](./install-cli-manual.md) |
| Add an add-on azcli extension (lean installs, or a specific version) | [install-cli-extensions.md](./install-cli-extensions.md) |
| Enable `az` tab completion (bash / zsh / PowerShell) | [install-cli-completions.md](./install-cli-completions.md) |
| Enable AI-based error recovery in Azure CLI | [ai-based-error-recovery.md](./ai-based-error-recovery.md) |

## What's in a release

| Category | Files | Platforms | Notes |
| --- | --- | --- | --- |
| CLI archives | `azcli-lean-…` and `azcli-…` | 7 platform variants | Windows x64/Arm64, Linux glibc x64/Arm64, Linux musl x64/Arm64, and macOS Arm64. Lean = built-in extensions only; Full = built-in + add-on extensions bundled. Self-contained, no .NET SDK needed. |
| Extension roll-up | `azcli-extensions-<version>.tar.gz` | agnostic | Convenience bundle of all extension packages. |
| CLI extension packages | `azcli.extensions.*.nupkg` | agnostic | Install into an existing CLI with `az extension add`. |

## Supported platforms

| OS and C library | x64 / Intel | Arm64 / Apple Silicon |
| --- | --- | --- |
| Windows | `win-x64` | `win-arm64` |
| Linux with glibc (Ubuntu, Debian, Fedora, Azure Linux) | `linux-x64` | `linux-arm64` |
| Linux with musl (Alpine Linux) | `linux-musl-x64` | `linux-musl-arm64` |
| macOS | — (not supported) | `macos-arm64` |

Throughout these guides, replace `<version>` with the version in your downloaded file name (for example `0.1.0`). Preview and beta builds may include a `-preview` suffix in the file name.
