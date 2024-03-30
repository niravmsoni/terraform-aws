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

### S3 Backend
- As seen earlier, we could configure S3 bucket as the backend.
- There are a number of useful features with S3 which we could leverage while storing S3 backend such as:
    - Versioning
    - Encryption
    - Locking

```hcl
terraform {
  backend "s3" {
    bucket = "myterraformstate"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
```
- Versioning
    - Enabling versioning on our terraform backend is important as it allows us to restore the previous version of state should we need to. The s3 backend supports versioning, so every revision of your state file is stored.

- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/a37549b7-06c3-47a6-9171-4ea5b326b3c7)

    - Once versioning is enabled on your bucket, after making a configuration change, which will result in a state change and execute that change with a `terraform apply`

    - Now you can see that your state file has been updated and if you check Show Versions on the bucket you will see the different versions of your state file.

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/e747899e-0840-4d32-8858-77991d0002c7)

- Encryption
    - It is important to protect terraform state data as it can contain extremely sensitive information. 
    - Many backends support encryption(Including S3), so that instead of your state files being in **plain text**, they will always be **encrypted** , both in **transit (e.g., via TLS)** and on **disk (e.g., via AES-256)**
    - The s3 backend supports encryption, which reduces worries about storing sensitive data in state files.