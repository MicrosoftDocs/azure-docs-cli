---
ms.topic: include
ms.custom: devx-track-azurecli
---
Tab completion, also known as "Azure CLI completers", provides completion on inputs to provide hints, enable discovery and speed up input entry. Command names, command group names, parameters and certain parameter values can be automatically inserted into the command line by pressing the <kbd>Tab</kbd> key.

Tab completion is enabled by default in Azure Cloud Shell and in most Linux distributions. Starting in Azure CLI version 2.49, you can enable tab completion for the Azure CLI in PowerShell. Follow these steps:

1. Create or edit the profile stored in the variable `$PROFILE`. The simplest way is to run `notepad $PROFILE` in PowerShell. For more information, see [How to create your profile](/powershell/module/microsoft.powershell.core/about/about_profiles#how-to-create-a-profile) and [Profiles and execution policy](/powershell/module/microsoft.powershell.core/about/about_profiles#profiles-and-execution-policy).

1. Add the following code to your PowerShell profile:

      ```powershell
      Register-ArgumentCompleter -Native -CommandName az -ScriptBlock {
          param($commandName, $wordToComplete, $cursorPosition)
          $completion_file = New-TemporaryFile
          $env:ARGCOMPLETE_USE_TEMPFILES = 1
          $env:_ARGCOMPLETE_STDOUT_FILENAME = $completion_file
          $env:COMP_LINE = $wordToComplete
          $env:COMP_POINT = $cursorPosition
          $env:_ARGCOMPLETE = 1
          $env:_ARGCOMPLETE_SUPPRESS_SPACE = 0
          $env:_ARGCOMPLETE_IFS = "`n"
          $env:_ARGCOMPLETE_SHELL = 'powershell'
          az 2>&1 | Out-Null
          Get-Content $completion_file | Sort-Object | ForEach-Object {
              [System.Management.Automation.CompletionResult]::new($_, $_, "ParameterValue", $_)
          }
          Remove-Item $completion_file, Env:\_ARGCOMPLETE_STDOUT_FILENAME, Env:\ARGCOMPLETE_USE_TEMPFILES, Env:\COMP_LINE, Env:\COMP_POINT, Env:\_ARGCOMPLETE, Env:\_ARGCOMPLETE_SUPPRESS_SPACE, Env:\_ARGCOMPLETE_IFS, Env:\_ARGCOMPLETE_SHELL
      }
      ```
1. To display all available options in the menu, add `Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete` to your PowerShell profile.
