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

> [!WARNING]
> Azure CLI 2.63.0 (released in August 2024) is the last version supported on the Alpine docker image. Microsoft will not be providing additional updates or bug fixes for this image. Consider migrating to the Azure Linux-based image (cbl-mariner) for the Azure CLI, which is fully supported. See examples for `cbl-mariner2.0` below.
>
> To disable warning messages, run `az config set core.only_show_errors=yes`. For more information on Azure CLI configuration settings, see [CLI configuration values and environment variables](./azure-cli-configuration.md#cli-configuration-values-and-environment-variables).

## Start the Docker container with Azure CLI preinstalled

Open a command prompt and start the Docker container with Azure CLI preinstalled using the following command. When used in a pipeline, it is recommended to use a deterministic tag name (for example `cbl-mariner2.0`)

```bash
docker run -it mcr.microsoft.com/azure-cli:cbl-mariner2.0
```

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> use `-v ${HOME}/.ssh:/root/.ssh` to mount your SSH keys in the environment.
>
> ```bash
> docker run -it -v ${HOME}/.ssh:/root/.ssh mcr.microsoft.com/azure-cli:cbl-mariner2.0
> ```

The CLI is installed on the image as the `az` command in `/usr/local/bin`.

## Run the Docker container with a specific version of the Azure CLI

Available versions can be found at [Azure CLI release notes](./release-notes-azure-cli.md).

To run a specific version of the Azure CLI in the Docker container, use this command. Change `2.62.0` with your desired version.

```bash
docker run -it mcr.microsoft.com/azure-cli:2.62.0-cbl-mariner2.0
```

## Update Docker image

Updating with Docker requires both pulling the new image and re-creating any existing containers. For this reason, you should
try to avoid using a container that hosts the CLI as a data store.

Update your local image with `docker pull`.

```bash
docker pull mcr.microsoft.com/azure-cli:cbl-mariner2.0
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
