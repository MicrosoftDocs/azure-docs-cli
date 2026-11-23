# Azure CLI documentation

This repository hosts the documentation source for the Azure CLI, published on [learn.microsoft.com](https://learn.microsoft.com/cli/azure/).

## Public contributions

We welcome public contributions to the Azure CLI documentation! There are two types of documentation hosted in this repository,
with different workflows:

* To submit a change for _conceptual_ documentation (content in the `docs-ref-conceptual` directory) make a pull request against
  this repository.
* To submit a change for _reference_ documentation (all other documentation), please make a pull request against
  [azure/azure-cli](https://github.com/azure/azure-cli). This reference is generated from the source code, and is also used in
  the command-line `-h` help.

## Retired Mongo cluster reference pages

The latest-version `az cosmosdb mongocluster` reference pages are retired in favor of
[`az documentdb`](https://learn.microsoft.com/cli/azure/documentdb). Their old URLs redirect
through `openpublishing-redirection-config/.openpublishing.redirection.json`. Both latest-version
reference content mappings in `docfx.json` exclude the retired pages so regenerated files
aren't published again. LTS reference content is unchanged.

The reference generator must also stop emitting the retired pages and their entries in
`TOC.yml` and `cosmosdb.yml`; otherwise, regeneration can restore references to excluded pages.
Track the upstream work in [Azure/azure-cli#34481](https://github.com/Azure/azure-cli/issues/34481).

## Microsoft Open Source Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
