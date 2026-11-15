---
title: Switch between the classic Azure CLI and the preview build
description: Learn how to switch between the classic Azure CLI and the Azure CLI public preview without reinstalling either version.
ms.date: 11/13/2026
---

# Switch between the classic Azure CLI and the preview build

Learn how to switch between the classic Azure CLI and the preview build within the same shell session while keeping both installed.

> [!NOTE]
> Throughout this article, classic Azure CLI refers to the generally available Azure CLI installed through the standard installation methods.

By default the installer keeps preview `az` isolated and off your `PATH`, so it coexists with the **classic** `azure-cli`. Adding preview `az` to `PATH` permanently makes it **shadow** the classic `azure-cli` in every new shell.

If you want to keep both installed and switch between them **within the same session** — for example to compare behavior or fall back to the classic CLI — add one of the helper functions below to your shell profile. Calling `switch-az` (bash / zsh) or `Switch-Az` (PowerShell) toggles the azcli directory on and off the front of `PATH` and prints the active CLI (classic or preview) and its executable path.

These functions assume the default install locations:

| Platform | azcli (preview) location |
| --- | --- |
| Linux / macOS / WSL | `~/.local/share/azcli/` |
| Windows | `%LOCALAPPDATA%\Programs\azcli\` |

If you installed azcli to a custom location, update the path in the function accordingly.

## bash / zsh

Add only the following function to your shell profile (`~/.bashrc` or `~/.zshrc`) and save the file:

```bash
# Toggle az between the classic CLI and the azcli preview build (current shell only)
switch-az() {
  local preview_dir="$HOME/.local/share/azcli"
  local current
  current=$(command -v az)

  if [[ "$current" == "$preview_dir/az" ]]; then
    # Preview is active -> drop it from PATH so the classic CLI takes over
    export PATH="${PATH#$preview_dir:}"
  else
    # Classic (or nothing) is active -> put the preview at the front of PATH
    export PATH="$preview_dir:$PATH"
  fi

  local active cli
  if active=$(command -v az); then
    if [[ "$active" == "$preview_dir/az" ]]; then
      cli="Azure CLI (preview)"
    else
      cli="Azure CLI (classic)"
    fi
    printf 'Active CLI: %s\nExecutable: %s\n' "$cli" "$active"
  else
    printf '%s\n' 'switch-az: No Azure CLI found on PATH. Install the classic Azure CLI or switch back to the preview.' >&2
    return 1
  fi
}
```

Then run the following command in your terminal, not inside the profile:

```bash
source ~/.bashrc   # or: source ~/.zshrc
```

## PowerShell

### 1. Create the profile if needed

Run this command in your PowerShell terminal. It creates the profile only if it doesn't already exist:

```powershell
if (-not (Test-Path -Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force | Out-Null }
```

### 2. Add the function to the profile

Run `$PROFILE` in the terminal to display its path, then open that file in your text editor. Add only the following function and save the file:

```powershell
# Toggle az between the classic CLI and the azcli preview build (current session only)
function Switch-Az {
    if ($IsWindows) {
        $previewDir = Join-Path -Path $env:LOCALAPPDATA -ChildPath 'Programs\azcli'
        $previewAz = Join-Path -Path $previewDir -ChildPath 'az.exe'
    }
    else {
        $previewDir = Join-Path -Path $HOME -ChildPath '.local/share/azcli'
        $previewAz = Join-Path -Path $previewDir -ChildPath 'az'
    }
    $sep        = [IO.Path]::PathSeparator

    $current = Get-Command -Name az -CommandType Application -ErrorAction SilentlyContinue |
        Select-Object -First 1 -ExpandProperty Source

    if ($current -and (Split-Path -Parent $current) -eq $previewDir) {
        # Preview is active -> drop it from PATH so the classic CLI takes over
        $env:PATH = ($env:PATH -split [regex]::Escape($sep) |
            Where-Object { $_ -and $_ -ne $previewDir }) -join $sep
    }
    else {
        # Classic (or nothing) is active -> put the preview at the front of PATH
        if (-not (Test-Path -Path $previewAz)) {
            Write-Error -Message "Switch-Az: preview az not found at '$previewAz'"
            return
        }
        $env:PATH = "$previewDir$sep$env:PATH"
    }

    $active = Get-Command -Name az -CommandType Application -ErrorAction SilentlyContinue |
        Select-Object -First 1 -ExpandProperty Source
    if ($active) {
        $cli = if ((Split-Path -Parent $active) -eq $previewDir) {
            'Azure CLI (preview)'
        }
        else {
            'Azure CLI (classic)'
        }
        "Active CLI: $cli"
        "Executable: $active"
    }
    else {
        Write-Warning -Message 'Switch-Az: No Azure CLI found on PATH. Install the classic Azure CLI or switch back to the preview.'
    }
}
```

### 3. Reload the profile

After saving, run this command in your PowerShell terminal to make `Switch-Az` available in the current session:

```powershell
. $PROFILE
```

Don't add `. $PROFILE` to the profile itself: it would repeatedly load itself. Defining the function doesn't switch CLIs; call `Switch-Az` when you want to toggle.

## Try it

Run the toggle and confirm which `az` is active:

```bash
switch-az       # bash / zsh
which az        # -> ~/.local/share/azcli/az when the preview is active
```

```powershell
Switch-Az               # PowerShell
Get-Command -Name az     # Preview: ...\Programs\azcli\az.exe on Windows; ~/.local/share/azcli/az on Linux/macOS
```

For example, switching to the preview on Linux or macOS prints:

```text
Active CLI: Azure CLI (preview)
Executable: /home/your-user/.local/share/azcli/az
```

Switching back displays `Azure CLI (classic)` and the classic executable's path. If no `az` is found after switching, the helper displays a message explaining how to recover.

Each call switches to the other CLI for the **current shell only** — open a new shell (or call the function again) to return to your default.

## Related

| You want to… | Guide |
| --- | --- |
| Install the Azure CLI preview build | [Install the Azure CLI preview](./install-overview.md) |
| Install the Azure PowerShell preview modules | [Install the Azure PowerShell preview modules](/powershell/azure/install-powershell-modules?view=azps-preview&preserve-view=true) |
| Report a problem or share feedback | [Log an issue on GitHub](https://github.com/Azure/azclips/issues) |
