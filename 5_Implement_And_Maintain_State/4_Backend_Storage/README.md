# Terraform State - BackendStorage
- There are 2 types of backend that terraform supports
    - Standard Backend
    - Enhanced Backend

## Standard Backends
The built in Terraform standard backends store **state remotely** and perform **terraform operations locally via CLI**. Popular standard backends include:

- [AWS S3 Backend (with DynamoDB)](https://www.terraform.io/docs/language/settings/backends/s3.html)
- [Google Cloud Storage Backend](https://www.terraform.io/docs/language/settings/backends/gcs.html)
- [Azure Storage Backend](https://www.terraform.io/docs/language/settings/backends/azurerm.html)

Consult Terraform documentaion for a [full list of Terraform standard backends](https://www.terraform.io/docs/language/settings/backends/index.html)

Most backends also support collaboration features so using a backend is a must-have both from a security and teamwork perspective.
