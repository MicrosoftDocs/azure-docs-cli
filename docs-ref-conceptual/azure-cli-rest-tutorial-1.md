---
title: Learn how to use the Azure REST API with Azure CLI| Microsoft Docs
description: Learn how to use Azure rest with Azure Command Line (CLI) 
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

# Use the Azure REST API with Azure CLI

Representational State Transfer (REST) APIs are service endpoints that support different sets of HTTP operations (or methods). These HTTP methods allow you to perform create/retrieve/update/delete actions for your service's resources. This tutorial will show you how to use Azure Rest specifically with Azure CLI when accessing your service's resources. 

A REST API request/response pair is made up of five basic components:

1. The request URI, which is the URL in your request. The URL consists of the URI-scheme, URI-hot, resource-path, and query-string. 
2. HTTP request message header fields.
3. Optional HTTP request message body fields, to support the URI and HTTP operation. 
4. HTTP response message header fields.
5. Optional HTTP response message body fields.

To learn more about the definitions of Azure REST API components, see [Azure REST API Reference](/rest/api/gettingstarted/#components-of-a-rest-api-requestresponse).

In this tutorial, you learn how to construct a REST API response using different methods with Azure CLI:

> [!div class="checklist"]
>
> * Overview and Prerequisites of Azure REST API
> * Creating an Azure REST API request with Azure CLI
> * Sending an Azure REST API request with Azure CLI
> * Reviewing the Azure REST API response message 


## Prerequisites 

[!INCLUDE [include](~/articles/reusable-content/azure-cli/azure-cli-prepare-your-environment-no-header.md)]

Azure Active Directory (AD) must be able to identify your client application's configuration before running it. Therefore, you must register your application with an Azure AD tenant. In order to do so, make sure you have the necessary [prerequisites](/rest/api/gettingstarted/#prerequisites) for [registering your client application](rest/api/gettingstarted/#register-your-client-application-with-azure-ad). 


## Next Steps

Now that you've learned the prerequisites needed to create an Azure REST API response, proceed to the next step to learn how to create an Azure REST API response with Azure CLI. 

> [!div class="nextstepaction"]
> [Learn how to create an Azure REST API response with Azure CLI](./azure-cli-rest-tutorial-2.md)