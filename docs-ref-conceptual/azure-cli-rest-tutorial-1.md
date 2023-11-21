---
title: Learn how to use Azure Rest with Azure CLI - Prerequisites | Microsoft Docs
description: Learn how to use Azure rest and its capabilties with Azure Command Line (CLI) 
manager: jasongroce
author: daphnemamsft
ms.author: dbradish
ms.date: 11/21/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# Invoke a custom request through Azure Rest by using Azure CLI

Representational State Transfer (REST) APIs are service endpoints that support sets of HTTP operations (or methods). These HTTP methods allow you to access the service's resources. To learn more about the specifics of Azure REST API and its components, see [Azure REST API Reference](/rest/api/azure/).

This tutorial will show you how to use Azure Rest with Azure CLI in order to perform different operations when accessing your service's resources. 

In this tutorial, you learn how to:

> [!div class="checklist"]
>
> * Overview of Azure Rest 
> * The different HTTP methods: delete, get, head, options, patch, post, put
> * Azure Rest Azure CLI examples 

# Prerequisites 

Invoke a custom request.

This command automatically authenticates using the logged-in credential: If Authorization header is not set, it attaches header Authorization: Bearer <token>, where <token> is retrieved from AAD. The target resource of the token is derived from --url if --url starts with an endpoint from az cloud show --query endpoints. You may also use --resource for a custom resource.

If Content-Type header is not set and --body is a valid JSON string, Content-Type header will default to application/json.