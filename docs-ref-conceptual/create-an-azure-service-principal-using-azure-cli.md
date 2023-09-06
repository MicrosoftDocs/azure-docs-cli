---
title: Work with Azure service principals – Azure CLI | Microsoft Docs
description: Learn how to create and use service principals with the Azure CLI. Use service principals to gain control over which Azure resources can be accessed.
manager: jasongroce
author: dbradish-microsoft
ms.author: dbradish
ms.date: 08/16/2023
ms.topic: conceptual
ms.service: azure-cli
ms.tool: azure-cli
ms.custom: devx-track-azurecli, seo-azure-cli
keywords: azure service principal, create service principal azure, create service principal azure cli
---

# 1 - Work with Azure service principal using the Azure CLI

It's important that automated tools that use Azure services always have restricted permissions. Instead of having applications sign in as a fully privileged user, Azure instead offers service principals.

## What is an Azure service principal?

An Azure service principal is an identity created to use with applications, hosted services, and automated tools. You can assign roles to the service principal in order to restrict its access. This gives you control over which resources can be accessed and at what level.
For security reasons, it's always recommended to use service principals with automated
tools rather than allowing them to sign in with a user identity.

This article shows you the steps for creating, getting information about, and resetting an Azure service principal with the Azure CLI.

## Create a service principal

Create an Azure service principal with the [az ad sp create-for-rbac](/cli/azure/ad/sp#az_ad_sp_create_for_rbac) command.

The `appId` and `tenant` keys appear in the output of `az ad sp create-for-rbac` and are used in service principal authentication. Record their values, but they can be retrieved at any point with [az ad sp list](/cli/azure/ad/sp#az-ad-sp-list).

When creating a service principal, you choose the type of sign-in authentication it uses. There are two types of authentication available for Azure service principals: [password-based authentication](./service-principal-password.md), and [certificate-based authentication](./service-principal-certificate.md) 

> [!WARNING]
> When you create an Azure service principal using the `az ad sp create-for-rbac` command, the output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. As an alternative, consider using [managed identities](/azure/active-directory/managed-identities-azure-resources/overview) if available to avoid the need to use credentials.
>
> To reduce your risk of a compromised service principal, assign a more specific role and narrow the scopes to a resource or resource group. For more information, see [Steps to add a role assignment](/azure/role-based-access-control/role-assignments-steps).