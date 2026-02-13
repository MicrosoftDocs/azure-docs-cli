---
title: Azure CLI lifecycle and support | Microsoft Docs
description: Learn the details about the support lifecycle of the Azure CLI reference commands.
ms.service: azure-cli
ms.custom: devx-track-azurecli
keywords: azure cli support, azure cli lifecycle
---

# Azure CLI support lifecycle

Every Microsoft product has a lifecycle. The lifecycle begins when a product is released and ends
when it's no longer supported. Knowing key dates in this lifecycle helps you make informed decisions
about when to upgrade or make other changes to your software.

The Azure CLI support lifecycle is designed to provide clarity and predictability for customers
regarding support for each release. The length of time and degree of support vary based on a few
qualifications. The Azure CLI support lifecycle follows Microsoft's [Modern lifecycle policy][09]
unless specified otherwise in this article.

## Reference types

There are two Azure CLI reference types.

- **Core:** Azure CLI references that are published as a permanent part of the CLI are called "core"
  references. All core references install with the Azure CLI and you can't choose a subset of
  references. If you run the CLI through Azure Cloud Shell, core references are always up to date.

- **Extensions:** Extensions aren't shipped as part of the CLI but run as CLI commands. Some
  extensions are a permanent part of the Azure CLI, but often, an extension gives you access to more
  capabilities and preview features.

A single reference group can have both core and extension commands. For example, in the [az vm][06]
reference group, [az vm nic add][07] is a core reference command while [az vm repair create][08] is
an extension.

To learn more about Azure CLI extensions, see [Use and manage Azure CLI extensions][05].

## Versioning

### Core

Azure CLI core version is composed of three numbers: `major.minor.patch`.

- **Major versions:** Major changes, including architectural and fundamental design changes. We
  provide critical security fixes to the last minor version of the previous major version for three
  years.
- **Minor versions:** Updated for feature updates and improved Azure service coverage.
- **Patch versions:** Backward compatible fixes without new features or functionality changes.

### Extensions

Azure CLI extensions follow [Semantic Versioning][10] for version numbering. Semantic versioning is
a system that uses a three-part number format: `major.minor.patch`.

- **Major versions:** Breaking changes, often due to an incompatible API change.
- **Minor versions:** Backward compatible feature updates, or added functionality.
- **Patch versions:** Backward compatible fixes without new features or functionality changes.

## Release cadence

The Azure CLI release cadence is designed to provide customers with predictable release dates,
empowering businesses, developers, and the community to make strategic decisions when planning their
roadmaps.

Azure CLI **Core** is updated monthly with a maximum of two releases introducing breaking changes.
Breaking change releases occur during the second and fourth quarters of each year.

Azure CLI **extensions** don't have a specific release cadence and need to be upgraded manually.

Breaking changes might not affect existing scripts, but it's a good practice to verify your scripts
in a test environment before performing an upgrade.

> [!NOTE]
> The release cadence might be slightly adjusted to be aligned with major announcements relevant to
> Azure.

## Support of releases

Azure CLI currently ships only one type of generally available release: Standard Term Support (STS).
All major versions are considered STS releases and are supported until the next major version is
released, approximately every six months.

The STS versions of Azure CLI core give you the most recent capabilities. STS releases don't
experience breaking changes for six months. Breaking changes are released in the second and fourth
quarters of the calendar year, and usually align with Microsoft Build and Microsoft Ignite.

STS releases have the following characteristics:

- STS releases are released monthly and receive feature updates, bug fixes, and security fixes.
- For a STS version to be supported, you need to be on the latest minor version of the STS release.
- STS releases don't have a specific marker when running the `az version` command. This ensures
  backward compatibility with tools or scripts that might utilize the information.

> [!IMPORTANT]
> Azure CLI version **2.66.2** is supported **only for use with Azure Stack Hub**.

**Examples:**

- To qualify for support, you must update to 2.63.0 when released if you have Azure CLI 2.62.0
  installed.
- If Azure CLI 2.66.0 is the last release before a breaking change in the fourth quarter, it's
  supported until the release of Azure CLI 2.67.0.

## Breaking changes

Major version releases of Azure CLI introduce breaking changes and occur up to two times per year.
Breaking changes can occur at any point for preview extensions. Non-GA extensions aren't required to
adhere to breaking change policies.

For detailed information about breaking changes in Azure CLI, see [Release notes][04].

## Supported environments

The Azure CLI runs on multiple operating systems (OS) and architectures. For a complete list, see
[Install the Azure CLI][01]. To be supported by Microsoft, the following criteria must be met:

- The version of Azure CLI is supported.
- The version of the OS is currently in mainstream support by the OS publisher.
- The dependencies required by the current version of Azure CLI are supported on the OS.

The Azure CLI ends support for a platform when one of the following conditions is met:

- The OS reaches its end of life as defined by the platform owner.
- The version of Python required by Azure CLI reaches its end of life, is no longer supported on the
  OS, or has an unfixed critical security issue.

Azure CLI announces the end of support of an OS or one of its dependencies within three months of
the public announcement of the retirement.

## Python dependency

Azure CLI depends on Python version 3.10 or above. The following table summarizes the expected end
of support for each version of Python:

| Python version | End of support date |
|----------------|---------------------|
| 3.10           | October 2026        |
| 3.11           | October 2027        |
| 3.12           | October 2028        |
| 3.13           | October 2029        |

Azure CLI can only be supported on operating systems where the above versions of Python are
supported.

- **Windows:** The currently supported versions of Windows client and server meet Python version
  requirements.
- **macOS:** The currently supported version of macOS 12 and above meet Python version requirements.
- **Linux:**
  - Each supported operating system has a lifecycle defined by its sponsor organization.
  - Support is typically removed when an operating system goes out of mainline support, at which
    time we stop testing and supporting it.
  - Here are the supported Linux operating systems for the Azure CLI:

    | Operating system | Version   | End of support    |
    | ---------------- | --------- | ----------------- |
    | Ubuntu           | 22.04 LTS | April 2027        |
    |                  | 24.04 LTS | June 2029         |
    | Debian           | 11        | August 31, 2026   |
    |                  | 12        | June 30, 2028     |
    | RHEL             | 8         | May 31, 2029      |
    |                  | 9         | May 31, 2032      |
    |                  | 10        | May 31, 2035      |
    | CentOS Stream    | 9         | Estimated 2027    |
    |                  | 10        | Estimated 2030    |
    | Azure Linux      | 3.0       |                   |

    > [!NOTE]
    > On RHEL 7, only Azure CLI 2.38 is supported. Microsoft is no longer providing updates or bug
    > fixes for this distribution.

## Azure CLI application ID guidance

The Azure CLI application ID is reserved exclusively for that tool and must not be used for other
purposes. For questions or concerns, use the official support channels.

> [!NOTE]
> This application ID is subject to change or limitation at any time, and its continued availability
> isn't guaranteed.

## See also

- [Azure CLI terminology][03]

<!-- updated link references -->

[01]: ./install-azure-cli.md
[03]: ./reference-types-and-status.md
[04]: ./release-notes-azure-cli.md
[05]: /cli/azure/azure-cli-extensions-overview
[06]: /cli/azure/vm
[07]: /cli/azure/vm/nic
[08]: /cli/azure/vm/repair
[09]: /lifecycle/policies/modern
[10]: https://semver.org/
