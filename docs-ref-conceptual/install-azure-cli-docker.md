---
title: Install the Azure CLI with Docker
description: How to install a Docker container with the Azure CLI 2.0
keywords: Azure CLI,Install Azure CLI,azure docker,azure docker image,
author: sptramer
ms.author: sttramer
manager: routlaw
ms.date: 10/30/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: azurecli
ms.service: multiple
---

# Install Azure CLI 2.0 with Docker

You can use Docker to install a standalone Linux container with the Azure CLI 2.0 pre-installed. This lets you get started quickly
with an environment where you can try out the CLI to decide if it's right for you, or allows you to use this as a base image.

## Install with Docker

Install the CLI using `docker run`.

   ```bash
   docker run -it microsoft/azure-cli:<version>
   ```

See our [Docker tags](https://hub.docker.com/r/microsoft/azure-cli/tags/) for available versions.

The CLI is installed on the image as the `az` command in `/usr/local/bin`.

> [!NOTE]
> If you want to pick up the SSH keys from your user environment,
> you can use `-v ${HOME}:/root` to mount $HOME as `/root`.

> ```bash
> docker run -it -v ${HOME}:/root microsoft/azure-cli:<version>
> ```

### Update with Docker

Updating with Docker requires both pulling the new image and re-creating any existing containers. For this reason you should
try and avoid using a container which hosts the CLI as a data store.

1. Update your local image with `docker pull`.

   ```bash
   docker pull microsoft/azure-cli
   ```

2. Get the containers currently using the CLI image.

   ```bash
   docker container ls -a --filter 'ancestor=microsoft/azure-cli'
   ```

   ```output
   CONTAINER ID        IMAGE                              COMMAND             CREATED             STATUS                        PORTS               NAMES
   34a868beb2ab        microsoft/azure-cli:latest      "/bin/sh -c bash"   8 minutes ago       Exited (0) 8 minutes ago                       inspiring_benz
   ```

  > [!NOTE]
  > If you installed a specific version of the image, you will need to add `:<version>` to the end of the image name.

3. Halt and recreate the containers.

   ```bash
   docker stop inspiring_benz
   docker rm inspiring_benz
   docker run microsoft/azure-cli
   ```

### Uninstall with Docker

If you ever decide to uninstall the Azure CLI, we're sorry to see you go. Before you uninstall, use the `az feedback` command to give us
some reasons why you chose to uninstall and how we could improve the CLI experience. We want to make sure that the Azure
CLI is as bug-free and user-friendly as we can make it. You can also [file a github issue](https://github.com/Azure/azure-cli/issues).

To properly uninstall the CLI Docker image you need to remove any containers running it, and then delete the local image.

1. Get the containers running the azure-cli image.

   ```bash
   docker container ls -a --filter 'ancestor=microsoft/azure-cli'
   ```

   ```output
   CONTAINER ID        IMAGE                              COMMAND             CREATED             STATUS                        PORTS               NAMES
   34a868beb2ab        microsoft/azure-cli:latest      "/bin/sh -c bash"   8 minutes ago       Exited (0) 8 minutes ago                       inspiring_benz
   ```
  > [!NOTE]
  > If you installed a specific version of the image, you will need to add `:<version>` to the end of the image name.

2. Delete any containers with the CLI image.

   ```bash
   docker rm 34a868beb2ab
   ```

3. Remove the locally installed CLI image.

   ```bash
   docker rmi microsoft/azure-cli
   ```

