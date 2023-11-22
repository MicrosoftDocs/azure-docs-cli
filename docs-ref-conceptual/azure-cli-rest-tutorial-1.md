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

# Use Azure Rest with Azure CLI

Representational State Transfer (REST) APIs are service endpoints that support sets of HTTP operations (or methods). These HTTP methods allow you to access the service's resources. To learn more about the specifics of Azure REST API and its components, see [Azure REST API Reference](/rest/api/azure/).

This tutorial will show you how to use Azure Rest with Azure CLI in order to perform different operations when accessing your service's resources. 

In this tutorial, you learn how to:

> [!div class="checklist"]
>
> * Overview of Azure Rest 
> * The different HTTP methods: delete, get, head, options, patch, post, put
> * Azure Rest Azure CLI examples 

## Prerequisites 

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]


Your client application must make its identity configuration known to Azure Active Directory (AD) before run-time. You can do so by registering it in with an Azure AD tenant. Before you register your client with Azure AD, make sure you have the necessary prerequisites for [registering your client application](/rest/api/azure/#prerequisites).

# Invoke a custom request with Azure Rest using Azure CLI

Invoke a custom request.

This command automatically authenticates using the logged-in credential: If Authorization header is not set, it attaches header Authorization: Bearer <token>, where <token> is retrieved from AAD. The target resource of the token is derived from --url if --url starts with an endpoint from az cloud show --query endpoints. You may also use --resource for a custom resource.

If Content-Type header is not set and --body is a valid JSON string, Content-Type header will default to application/json.

```azurecli-interactive
az rest --uri
```

## Next Steps

Now that you've learned the fundamentals of how Azure Rest works while using Azure CLI, proceed to the next step to learn how to use Azure Rest with its many different methods to invoke custom requests. 

> [!div class="nextstepaction"]
> [Learn how to use different Azure Rest methods with Azure CLI](./azure-cli-rest-tutorial-2.md)