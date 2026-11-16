---
title: Install Azure CLI public preview extensions
description: Learn how to install add-on extensions for the Azure CLI public preview.
ms.date: 11/13/2026
---

# Install Azure CLI public preview extensions

> **Most users should start with the [install guide](install-overview.md).** This page covers add-on extensions, which you only need on **lean** installs or to pin a specific extension version.

Add-on extensions ship as NuGet packages named `azcli.extensions.<name>.<version>.nupkg`. You need a working azcli before you can add extensions — follow the [install guide](install-overview.md) to install the **lean** or **full** package first, then use the steps below.

> The **full** azcli package already bundles the add-on extensions — you only need this guide if you installed the **lean** package or want a specific extension version from a package file.

> **First, make sure `az` points at azcli in this shell.** Because azcli installs in isolation (PATH is not modified by default), add it to `PATH` for the session before running the `az extension` commands below — otherwise `az` may resolve to the classic azure-cli:
>
> ```bash
> export PATH="$HOME/.local/share/azcli:$PATH"     # Linux / macOS / WSL — current shell only
> ```
>
> ```powershell
> $env:Path = "$env:LOCALAPPDATA\Programs\azcli;$env:Path"   # Windows — current session only
> ```
>
> Or skip this and call azcli by its full path (e.g. `~/.local/share/azcli/az extension add …`).

## Install from the extensions bundle

Each release includes a single `azcli-extensions-<version>.tar.gz` containing every extension package plus `NOTICE`/`LICENSE`. This bundle is how add-on extensions are distributed.

Download `azcli-extensions-<version>.tar.gz` from the public [GitHub Releases](https://github.com/Azure/azclips/releases) page, choosing the same release you installed azcli from. You don't need the GitHub CLI or GitHub sign-in.

The download-only helpers below fetch the latest bundle and save it as `azcli-extensions.tar.gz` in the current directory. They don't extract or install extensions. If your CLI is from an older release, use the release-pinned examples below or download its bundle manually. For an offline machine, transfer the downloaded bundle before extracting it.

The bundle unpacks as loose `.nupkg` files, so extract it into a folder and install from there. The bundle is the list of available add-on extensions: each `azcli.extensions.<name>.<version>.nupkg` file is one extension. To see what's available before you install, list the extracted files, as shown in the next section. Extension package versions are independent of the release version, so the commands below don't hardcode a version — follow the set for your shell.

### Linux / macOS / WSL (bash)

Requires Bash, `curl`, `tar`, and standard system text utilities. Run each command only after the previous one succeeds:

```bash
curl -fsSL https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-extensions-download.sh | bash
mkdir -p azcli-extensions
tar -xzf ./azcli-extensions.tar.gz -C azcli-extensions
```

For a specific release, replace the download command with the following. Use the GitHub release tag, not the extension package version:

```bash
curl -fsSL https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-extensions-download.sh | bash -s -- --release '<release-tag>'
```

List the available extensions, then choose either the single-extension command or the loop to install every bundled extension:

```bash
# See which extensions are available
ls azcli-extensions/azcli.extensions.*.nupkg

# Install one extension (e.g. compute)
az extension add --path ./azcli-extensions/azcli.extensions.compute.*.nupkg

# Or install every bundled extension
for pkg in ./azcli-extensions/azcli.extensions.*.nupkg; do
  az extension add --path "$pkg"
done

az extension list
```

### Windows (PowerShell 7+)

Requires `tar` for extraction. Run each command only after the previous one succeeds:

```powershell
irm https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-extensions-download.ps1 -ErrorAction Stop | iex
New-Item -ItemType Directory -Force -Path azcli-extensions | Out-Null
tar -xzf ./azcli-extensions.tar.gz -C azcli-extensions
if ($LASTEXITCODE -ne 0) { throw 'Extensions bundle extraction failed.' }
```

For a specific release, download the helper and pass the GitHub release tag explicitly:

```powershell
Invoke-WebRequest https://raw.githubusercontent.com/Azure/azclips/main/install/azcli-extensions-download.ps1 -OutFile ./azcli-extensions-download.ps1 -ErrorAction Stop
./azcli-extensions-download.ps1 -Release '<release-tag>'
```

PowerShell doesn't expand `*` for external commands, so resolve the paths explicitly with `Get-ChildItem`. Choose either the single-extension command or the loop to install every bundled extension:

```powershell
# See which extensions are available
Get-ChildItem azcli-extensions/azcli.extensions.*.nupkg | Select-Object -ExpandProperty Name

# Install one extension (e.g. compute)
$compute = Get-ChildItem azcli-extensions/azcli.extensions.compute.*.nupkg | Select-Object -First 1
az extension add --path $compute.FullName

# Or install every bundled extension
Get-ChildItem azcli-extensions/azcli.extensions.*.nupkg | ForEach-Object { az extension add --path $_.FullName }

az extension list
```

## Verify

```bash
az extension list
```

The extension you added should appear in the list. If the command it provides now runs, the extension is installed.

## Manage extensions

| Task | Command |
| --- | --- |
| List available extensions | List the `azcli.extensions.*.nupkg` files in the extracted bundle |
| List installed extensions | `az extension list` |
| Show details for an installed extension | `az extension show --name <name>` |
| Update an extension | `az extension update --name <name>` |
| Remove an extension | `az extension remove --name <name>` |

## Troubleshooting

| Symptom | Fix |
| --- | --- |
| Release lookup returns HTTP 403 or 429 | Check GitHub's response and retry after the API rate limit resets, or download the matching bundle manually from [GitHub Releases](https://github.com/Azure/azclips/releases). |
| Bootstrap download fails | Check the download error before extracting or installing. Piped Bash execution may not report the downloader's exit status. Download the bundle manually if needed. |
| Pinned release isn't found | Confirm `<release-tag>` matches a tag on the [GitHub Releases](https://github.com/Azure/azclips/releases) page, rather than an extension package version. |
| `az` is not found | Install the Azure CLI preview first. For more information, see the [install guide](install-overview.md). |
| A command says an extension is missing | Install the add-on from the extensions bundle with `az extension add --path <pkg>` (see above). |
| `--path` package not found | Confirm the file name and version match your download, for example `azcli.extensions.compute.<version>.nupkg`. |
| Extension already installed | Use `az extension update --name <name>` or remove then re-add it. |
