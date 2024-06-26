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
 
  ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/241d6e44-7fbd-4333-8893-86c9b68358d9)

    - IMPORTANT NOTE - Anyone on your team who has access to that S3 bucket will be able to see the state files in an unencrypted form, so this is still a partial solution, but at least the data will be encrypted at rest (S3 supports server-side encryption using AES-256) and in transit (Terraform uses SSL to read and write data in S3).

- Locking for S3
    - The `s3` backend stores Terraform state as a given key in a given bucket on Amazon S3 to allow everyone working with a given collection of infrastructure the ability to access the same state data. In order to prevent concurrent modifications which could cause corruption, we need to implement locking on the backend. The `s3` backend supports state locking and consistency checking via Dynamo DB.

    - State locking for the `s3` backend can be enabled by setting the dynamodb_table field to an existing DynamoDB table name. A single DynamoDB table can be used to lock multiple remote state files.

    ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/fd7a9233-5f66-4a6e-bf36-03bfc3ad4606)


    - Update the `s3` backend to use the new DynamoDB Table and reconfigure your backend.

```hcl
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "myterraformstate"
    key    = "path/to/my/key"
    region = "us-east-1"

    # Replace this with DynamoDB table name!
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```
    - IMPORTANT NOTE - Anytime we make a change to backend configuration, we need to supply the -reconfigure switch!

```shell
terraform init -reconfigure

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.
```
Update the size of your web server from `t2.small` to a `t2.micro` and apply the change.

```hcl
resource "aws_instance" "web_server_2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnets["public_subnet_2"].id
  tags = {
    Name = "Web EC2 Server 2"
  }
}
```

```bash
terraform apply
```

Now you can see that your state file is locked by selecting the DynamoDB table and looking at `View Items` to see the lock.
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/c3c909b4-3ae8-47c5-9161-0afe6af608c9)
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/be69bddc-40c8-4e00-8c9c-31da53786075)
Now, no one would be able to modify configuration till this lock entry is deleted. This will be removed once we execute terraform apply and free up the lock
