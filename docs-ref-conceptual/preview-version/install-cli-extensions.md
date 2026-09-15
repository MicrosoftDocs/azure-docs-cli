---
title: Install Azure CLI private preview extensions
description: Learn how to install add-on extensions for the Azure CLI private preview.
---

# Install Azure CLI private preview extensions

> **Most users should start with the [install guide](install-overview.md).** This page covers add-on extensions, which you only need on **lean** installs or to pin a specific extension version.

Add-on extensions ship as NuGet packages named `azcli.extensions.<name>.<version>.nupkg`. You need a working azcli before you can add extensions — follow the [install guide](install-overview.md) to install the **lean** or **full** package first, then use the steps below.

> The **full** azcli package already bundles the add-on extensions — you only need this guide if you installed the **lean** package or want a specific extension version from a package file.

> **First, make sure `az` points at azcli in this shell.** Because azcli installs in isolation (PATH is not modified by default), add it to `PATH` for the session before running the `az extension` commands below — otherwise `az` may resolve to the classic azure-cli:
>
> ```bash
> export PATH="$HOME/.local/share/azcli:$PATH"     # Linux / macOS — current shell only
> ```
>
> ```powershell
> $env:Path = "$env:LOCALAPPDATA\Programs\azcli;$env:Path"   # Windows — current session only
> ```
>
> Or skip this and call azcli by its full path (e.g. `~/.local/share/azcli/az extension add …`).

## Install from the extensions bundle

Each release includes a single `azcli-extensions-<version>.tar.gz` containing every extension package plus `NOTICE`/`LICENSE`. This bundle is how add-on extensions are distributed.

Download the bundle from the latest release using your authenticated GitHub CLI (`gh`) — the same session the installer uses, which works on the private repo. (Or download `azcli-extensions-<version>.tar.gz` manually from the repo's [GitHub Releases](https://github.com/Azure/azclips/releases) page, the same release you installed azcli from.)

```bash
gh release download --repo Azure/azclips --pattern 'azcli-extensions-*.tar.gz' --dir . --clobber
```

The bundle unpacks as loose `.nupkg` files, so extract it into a folder and install from there. Extension package versions are independent of the release version, so the commands below don't hardcode a version — follow the set for your shell.

### Linux / macOS (bash)

```bash
mkdir -p azcli-extensions
tar -xzf ./azcli-extensions-*.tar.gz -C azcli-extensions

# Install one extension (e.g. compute)
az extension add --path ./azcli-extensions/azcli.extensions.compute.*.nupkg

# Or install every bundled extension
for pkg in ./azcli-extensions/azcli.extensions.*.nupkg; do
  az extension add --path "$pkg"
done

az extension list
```

### Windows (PowerShell)

PowerShell doesn't expand `*` for external commands, so resolve the paths explicitly with `Get-ChildItem`:

```powershell
New-Item -ItemType Directory -Force -Path azcli-extensions | Out-Null
$bundle = Get-ChildItem azcli-extensions-*.tar.gz | Sort-Object LastWriteTime -Descending | Select-Object -First 1
tar -xzf $bundle.FullName -C azcli-extensions

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
| List installed extensions | `az extension list` |

## Troubleshooting

| Symptom | Fix |
| --- | --- |
| `az` is not found | Install azcli first — see the [install guide](install-overview.md). |
| A command says an extension is missing | Install the add-on from the extensions bundle with `az extension add --path <pkg>` (see above). |
| `--path` package not found | Confirm the file name and version match your download, e.g. `azcli.extensions.compute.0.1.0.nupkg`. |
| Extension already installed | Use `az extension update --name <name>` or remove then re-add it. |
