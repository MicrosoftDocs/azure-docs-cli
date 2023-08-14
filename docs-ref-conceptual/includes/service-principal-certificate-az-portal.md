# Assign an existing certificate to Service Principal through Azure Portal

You can assign a certificate to a service principal through the Azure portal by following these steps:

1. In the Azure Portal, select Active Directory
2. Then select App Registrations on the left hand sidebar
3. Next, select your AKS service principal
4. Then proceed to click on "Certificates and secrets." Here, you can upload it, or download and install it on your PC you are using to connect with. Make sure the certificate is stored somewhere you can access it on your local machine for later steps.
5. To use the Service Principal with the certificate to access the Azure Container Registry, use the following command:

```bash
# Sign into Azure CLI with SP's APP_ID and TENANT_ID and use certificate as password
az login --service-principal --username <APP_ID> --tenant <TENANT_ID> --password </path/to/cert PEM or DER file>
```

6. Then sign into the registry with `az acr login`, which uses the Active Directory token from the CLI login:

```bash
az acr login --name <registry name>
```

> [!NOTE]
> Certificate must be in PEM format - it won't work with PKCS#12 files (.p12/.pfx)
>
> You don't need to prefix the path with an @ like you do with the previous az commands