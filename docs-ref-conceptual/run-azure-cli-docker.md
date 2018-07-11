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

You can use Docker to run a standalone Linux container with the Azure CLI 2.0 pre-installed. Docker lets you get started quickly
with an environment where you can try out the CLI to decide if it's right for you, or use our image as a base for your own deployment.

## Run in a Docker container

Install the CLI using `docker run`.

   ```bash
   docker run -it microsoft/azure-cli
   ```

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> you can use `-v ${HOME}:/root` to mount $HOME as `/root`.
>
> ```bash
> docker run -it -v ${HOME}:/root microsoft/azure-cli
> ```

The CLI is installed on the image as the `az` command in `/usr/local/bin`. To sign in, run the [az login](/cli/azure/reference-index#az-login) command.

[!INCLUDE [interactive-login](includes/interactive-login.md)]

To learn more about different authentication methods, see [Sign in with Azure CLI 2.0](authenticate-azure-cli.md).

## Update Docker image

Updating with Docker requires both pulling the new image and re-creating any existing containers. For this reason you should
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
