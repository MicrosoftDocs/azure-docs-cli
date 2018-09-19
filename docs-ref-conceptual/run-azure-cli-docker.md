---
title: Run Azure CLI 2.0 in a Docker Container
description: How to run a Docker container hosting the Azure CLI 2.0
author: sptramer
ms.author: sttramer
manager: carmonm
ms.date: 01/29/2018
ms.topic: conceptual
ms.prod: azure
ms.technology: azure-cli
ms.devlang: azure-cli
---

# Run Azure CLI 2.0 in a Docker container

You can use Docker to run a standalone Linux container with the Azure CLI 2.0 pre-installed. Docker gets you started quickly
with an isolated environment to run the CLI in. The image can also be used as a base for your own deployments.

## Run in a Docker container

Install the CLI using `docker run`.

   ```bash
   docker run -it microsoft/azure-cli
   ```

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> use `-v ${HOME}/.ssh:/root/.ssh` to mount your SSH keys in the environment.
>
> ```bash
> docker run -it -v ${HOME}/.ssh:/root/.ssh microsoft/azure-cli
> ```

The CLI is installed on the image as the `az` command in `/usr/local/bin`. To sign in, run the [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI 2.0](authenticate-azure-cli.md).

## Update Docker image

Updating with Docker requires both pulling the new image and re-creating any existing containers. For this reason, you should
try to avoid using a container that hosts the CLI as a data store.

Update your local image with `docker pull`.

```bash
docker pull microsoft/azure-cli
```

## Uninstall Docker image

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

After halting any containers running the CLI image, remove it.

```bash
docker rmi microsoft/azure-cli
```

## Next Steps

Now that you're ready to use the Azure CLI, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
