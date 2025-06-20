---
title: How to run Azure CLI in a Docker Container
description: Learn how to run the Azure CLI in a Docker container for a fast, isolated setup. Use Docker to simplify Azure CLI usage in any environment.
ms.date: 06/20/2025
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cli docker, docker azure cli
---

# How to run Azure CLI in a Docker container

You can use Docker to run a standalone Linux container with Azure CLI preinstalled, providing a
quick and isolated environment for using Azure CLI. This container image can also serve as a base
for your own custom deployments.

> [!WARNING]
> Azure CLI 2.63.0 (released August 2024) is the final version supported on the Alpine-based Docker
> image. Microsoft no longer provides updates or bug fixes for this image. To ensure continued
> support, migrate to the Azure Linux-based image (Azure Linux 3.0), which is fully maintained. See
> the following examples for using Azure Linux 3.0.
>
> To suppress warning messages, run: `az config set core.only_show_errors=yes`. For details on
> configuration options, see [Azure CLI configuration values and environment variables][01].

## Start the Docker container with Azure CLI preinstalled

Open a command prompt and start a Docker container with the Azure CLI preinstalled using the
following command. When using this command in a pipeline, use a deterministic tag (such as
`azurelinux3.0`) to ensure consistent behavior.

```bash
docker run -it mcr.microsoft.com/azure-cli:azurelinux3.0
```

> [!NOTE]
> To use your local SSH keys within the container, mount your .ssh directory by including the
> following option: `--mount type=bind,src="$HOME"/.ssh,dst=/root/.ssh`. This option allows the
> container to access your SSH keys from your user environment.
>
> ```bash
> docker run -it --mount type=bind,src="$HOME"/.ssh,dst=/root/.ssh mcr.microsoft.com/azure-cli:azurelinux3.0
> ```

The Azure CLI is available in the image as the `az` command, located at `/usr/local/bin/az`.

## Run the Docker container with a specific version of the Azure CLI

You can find available versions in the [Azure CLI release notes][02].

To run a specific version of the Azure CLI in a Docker container, use the following command,
replacing `2.74.0` with your desired version.

```bash
docker run -it mcr.microsoft.com/azure-cli:2.74.0-azurelinux3.0
```

## Update Docker image

To update the Azure CLI when using Docker, you must pull the latest image and recreate any existing
containers. Because of this update process, avoid using Azure CLI containers as persistent data
stores.

Update your local image using the following command:

```bash
docker pull mcr.microsoft.com/azure-cli:latest
```

## Uninstall Docker image

[!INCLUDE [uninstall-boilerplate.md](includes/uninstall-boilerplate.md)]

To remove the Docker image, first stop any running containers, then run:

```bash
docker rmi mcr.microsoft.com/azure-cli
```

## Next Steps

Now that you're ready to use the Azure CLI in a Docker container take a quick tour of its key
features and commonly used commands to get started.

> [!div class="nextstepaction"]
> [Get started with the Azure CLI][03]

<!-- link references -->

[01]: ./azure-cli-configuration.md#cli-configuration-values-and-environment-variables
[02]: ./release-notes-azure-cli.md
[03]: get-started-with-azure-cli.md
