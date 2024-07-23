---
title: How to run Azure CLI in a Docker Container | Microsoft Docs
description: Learn how to run a Docker container hosting the Azure CLI. Docker gets you started quickly with an isolated environment in which to run the Azure CLI.
author: jiasli
ms.author: jiasli
ms.date: 03/14/2024
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure cli docker, docker azure cli
---

# How to run the Azure CLI in a Docker container

You can use Docker to run a standalone Linux container with the Azure CLI preinstalled. Docker gets you started quickly with an isolated environment to run the CLI in. The image can also be used as a base for your own deployments.

With the release of Azure CLI [version 2.54.0](./release-notes-azure-cli.md#november-14-2023), the size of the Docker image of `azure-cli` is reduced from 1.1 GB to 700 MB! This reduction is a 36.3% decrease resulting in improved download speed and faster startup.

> [!NOTE]
> The Azure CLI has migrated to [Microsoft Container Registry](https://azure.microsoft.com/services/container-registry).
> Existing tags on Docker Hub are still supported, but new releases will only be available as mcr.microsoft.com/azure-cli.

## Start the Docker container with Azure CLI preinstalled

Open a command prompt and then start the Docker container with Azure CLI preinstalled using the following command. When no tag is give in the command line, `latest` is used by default. Prior to the release of Azure CLI 2.73, this is Alpine 10.

**Discussion point #1:** Let's get customer accustomed to using a tag now and no longer relying on the default.
**Discussion point #2:** need link from engineering

```bash
docker run -it mcr.microsoft.com/azure-cli/alpine:10.0
```

[!INCLUDE [docker container image announcement](includes/docker-container-images.md)]

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> use `-v ${HOME}/.ssh:/root/.ssh` to mount your SSH keys in the environment.
>
> ```bash
> docker run -it -v ${HOME}/.ssh:/root/.ssh mcr.microsoft.com/azure-cli:<alpine10 -- is this correct?>
> ```

The CLI is installed on the image as the `az` command in `/usr/local/bin`.

## Run the Docker container with a specific version of the Azure CLI

Available versions can be found at [Azure CLI release notes](./release-notes-azure-cli.md).

To run a specific version of the Azure CLI in the Docker container, use this command:

**Discussion point #3:** Need link from engineering. How does the customer combine a tag with a specific azCLI version?

```bash
docker run -it mcr.microsoft.com/azure-cli/:<version>
```

## Update Docker image

Updating with Docker requires both pulling the new image and re-creating any existing containers. For this reason, you should
try to avoid using a container that hosts the CLI as a data store.

Update your local image with `docker pull`.

**Discussion point #4:** Verify link with engineering

```bash
docker pull mcr.microsoft.com/azure-cli/alpine:10.0
```

## Uninstall Docker image

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

After halting any containers running the CLI image, remove it.

```bash
docker rmi mcr.microsoft.com/azure-cli
```

## Next Steps

Now that you're ready to use the Azure CLI in a Docker container, take a short tour of its features and common commands.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI](get-started-with-azure-cli.md)
