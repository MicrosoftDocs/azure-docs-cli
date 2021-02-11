---
title: Create an Azure support request in Azure CLI
description: Learn how to use the Azure CLI az support commands to create, update, and manage Azure support requests.
author: dbradish-microsoft
ms.author: dbradish
ms.service: azure-supportability
ms.topic: how-to
ms.date: 02/12/2021
ms.custom: template-how-to
---

# Create an Azure support request in Azure CLI

The Azure CLI enables you to create and manage Azure support tickets.

- Open a technical, billing, subscription management, or subscription and service limits (quota) support ticket.
- Get a list of support tickets and detailed information about each ticket. Narrow your search for support tickets by status or created date.
- Update severity, ticket status, and contact information for a support ticket.
- Add a new communication to a support ticket or get a list of all communications for a support ticket. Narrow your search of communication lists by created date or communication type.

To create a support request, you must be an [Owner](/azure/role-based-access-control/built-in-roles#owner) or [Contributor](/azure/role-based-access-control/built-in-roles#contributor), or be assigned to the [Support Request Contributor](/azure/role-based-access-control/built-in-roles#support-request-contributor) role at the subscription level. To create a support request without a subscription, such as an Azure Active Directory scenario, you must be an [Admin](/azure/active-directory/roles/permissions-reference).

[!INCLUDE [azure-cli-prepare-your-environment.md](includes/azure-cli-prepare-your-environment.md)]

## Create a support ticket

1. To obtain a list of services, use the [az support services list](/cli/azure/ext/support/support/services#ext_support_az_support_services_list) command:

   ```azurecli
   az support services list --output table
   ```

   For this example, find the value for **Virtual Machine running Windows**, which is **6f16735c-b0ae-b275-ad3a-03479cfa1396**.

1. To get the problem type and problem subtype that describes your problem, run the [az support services problem-classifications list](/cli/azure/ext/support/support/services/problem-classifications#ext_support_az_support_services_problem_classifications_list) command:

   ```azurecli
   az support services problem-classifications list --service-name 6f16735c-b0ae-b275-ad3a-03479cfa1396 --output table
   ```

   For this example, find **Cannot connect to my VM / I have an issue with my public IP**. That type has a value of **e5c307e3-50ff-5dc9-c8ae-7d35051f88c9**.

1. Create a ticket by using the [az support tickets create](/cli/azure/ext/support/support/tickets#ext_support_az_support_tickets_create) command:

   ```azurecli
   az support tickets create --ticket-name "VM012" --title "Issue with public IP" \
      --description "This ticket involves a public IP address of a VM." \
      --problem-classification e5c307e3-50ff-5dc9-c8ae-7d35051f88c9 \
      --severity minimal --contact-first-name Kenneth --contact-last-name Liew \
      --contact-method email --contact-email Kenneth.Liew@Contoso.com \
      --contact-country US --contact-language English --contact-timezone "Pacific Standard Time"
   ```

A support engineer will contact you using the method you indicated. For information about initial response times, see [Support scope and responsiveness](/support/plans/response/).

## Manage support tickets

To see your support tickets for your current subscription, run the [az support tickets list](/cli/azure/ext/support/support/tickets#ext_support_az_support_tickets_list) command:

```azurecli
az support tickets list
```

To see support tickets in another subscription, run the [az account set](/cli/azure/account#az_account_set) command to change your current subscription, and then run the command.

You can also update a ticket by using the [az support tickets update](/cli/azure/ext/support/support/tickets#ext_support_az_support_tickets_update) command:

```azurecli
az support tickets update --ticket-name VM012 --severity moderate
```

## Communicate about your ticket

You can't delete a support ticket created by using Azure CLI. Instead, send a message to close a ticket. If you need to reopen a closed support request, create a new message, which automatically reopens the request.

To communicate about your ticket, run the [az support tickets communications create](/cli/azure/ext/support/support/tickets/communications#ext_support_az_support_tickets_communications_create) command:

```azurecli
az support tickets communications create --ticket-name VM012 \
    --communication-name "VM Delay" \
    --communication-body "Delaying VM fixes due to scheduling on our end." \
    --communication-subject "Delaying VM fixes due to scheduling on our end."
```

To see all the communications for a ticket, use the [az support tickets communications list](/cli/azure/ext/support/support/tickets/communications#ext_support_az_support_tickets_communications_list) command:

```azurecli
az support tickets communications list --ticket-name VM012
```

This command offers a `--filters` parameter to narrow your responses.

```azurecli
az support tickets communications list --ticket-name VM012 \
    --filters "communicationType eq 'Web'"
```

## Next steps

- [Azure Support FAQs](/support/faq/)
- [Azure severity and levels](/support/plans/response/)
- [How to create a support ticket via Azure portal](/azure/azure-portal/supportability/how-to-create-azure-support-request)
