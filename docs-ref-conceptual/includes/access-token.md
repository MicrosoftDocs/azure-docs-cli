---
author: daphnemamsft
ms.author: daphnemamsft
ms.date: 01/09/2024
ms.topic: include
ms.custom: devx-track-azurecli
---

Starting from Azure CLI 2.54.0, `az account get-access-token` returns the `expires_on` property alongside the `expiresOn` property for the token expiration time. The `expires_on` property represents a Portable Operating System Interface (POSIX) timestamp while the`expiresOn` property represents a local datetime. We recommend for downstream applications to use the `expires_on` property, because it uses the Universal Time Code (UTC). 

The `expiresOn` property doesn't express "fold" when Daylight Saving Time ends. This can cause problems in countries or regions where Daylight Saving Time is adopted. For more information on "fold", see [PEP 495 – Local Time Disambiguation](https://peps.python.org/pep-0495/).