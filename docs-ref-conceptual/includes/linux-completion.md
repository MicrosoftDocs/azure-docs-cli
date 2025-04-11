---
author: bebound
ms.author: hanglei
ms.date: 11/29/2024
ms.topic: include
---
### Completion isn't working

For Bash users, the completion script is installed in `/etc/bash_completion.d/azure-cli`. If it is not automatically executed, add the following line to your `~/.bashrc` file, then save and reload your Bash profile:

```bash
source /etc/bash_completion.d/azure-cli
```

For Zsh users, add the following two lines in your `~/.zshrc` file, then save and reload your Zsh profile:

```zsh
autoload -U +X bashcompinit && bashcompinit
source /etc/bash_completion.d/azure-cli
```
