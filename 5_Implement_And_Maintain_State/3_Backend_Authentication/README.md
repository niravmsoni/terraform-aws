# TF State - Backend Authentication
- The local backend stores state as a local file on disk, but other backend types store state in a remote service of some kind, which allows multiple people to access it via local or via CI/CD pipelines

-  Accessing state in a remote service generally requires some kind of access credentials since state data contains extremely sensitive information. It is important to strictly control who can access your Terraform backend.

# Changing State backend from Local to S3 Standard
- The s3 backend stores Terraform state as a given key in a given bucket on Amazon S3. This backend supports several different methods in which the Terraform CLI can authenticate to the Amazon S3 bucket.
- Step 1 - Create S3 Bucket

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/f7c95c6f-8563-49ac-a721-b6d9de240974)


- Step 2 - Remove existing resource with TF destroy
If you already have a state file present with infrastructure deployed from previous labs we will first issue a cleanup of our infrastructure using a terraform destroy before changing our our backend. This is not a requirement as Terraform supports the migration of state data between backends, which will be covered in a future lab.

```hcl
terraform destroy

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
```
- Step 3 - Update configuration to use s3 backend
Update the terraform.tf configuration to utilize the s3 backend with the required arguments.

```hcl
terraform {
  backend "s3" {
    bucket = "myterraformstate"
    key    = "path/to/my/key"  # This is location within S3 bucket where the state will be stored
    region = "us-east-1"
  }
}
Example:

terraform {
  backend "s3" {
    bucket = "my-terraform-state-ghm"
    key    = "prod/aws_infra"
    region = "us-east-1"
  }
}
```
IMP Note: A Terraform configuration can only specify a single backend. If a backend is already configured be sure to replace it. Copy just the backend block above and not the full terraform block You can validate the syntax is correct by issuing a terraform validate

- Step 4 - Provide Terraform Credentials to connect to S3
Providing credentials fo accessing state in an S3 bucket can be done in a number of different ways. This lab will showcase using environment variables but a shared credentials file can also be used. It is important to protect any credential information so while it is possible to set these values in the code itself it is strongly not recommended.

Source credentials to the S3 backend using the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables.

```hcl
export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
```

(Optional): If using Multi-Factor Authentication you can source the token using the AWS_SESSION_TOKEN environment variable.

(Optional): In lieu of setting environment varialbes you can also utilize an AWS shared credentials file by specifying the path to the file useing the shared_credentials_file arguement within the backend configuration block. This defaults to ~/.aws/credentials.

- Step 5 - Verify Authentication to S3 Backend

Once the configuration is complete, you can verify authentication to the S3 backend by first removing infrastructure that has already been deployed with a terraform destroy and performing a terraform init
```
terraform init

Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.
```

- Step 6 - Terraform Apply
Now that autentication has been verified, we can build out the infrastructure with our S3 backend for storing state we can issue a terraform apply

```hcl
terraform apply

...

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
```
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/415b91e2-96df-4c1a-b2a0-8759b7a53189)

Now the state file for your infrastructure build out is stored remotely on the S3 object store in your bucket. This can now be utilized by others who have appropriate permissions to the S3 bucket as we have succesfully centralized the terraform state file.
- Step 7 - Validate Unauthorized access to S3
If we set incorrect value in environment variables used to connect to S3 and then try to connect we should see such error

```shell
export AWS_ACCESS_KEY_ID="notvalid"
export AWS_SECRET_ACCESS_KEY="notvalid"
```
```hcl
terraform state list

Error: error configuring S3 Backend: error validating provider credentials: error calling sts:GetCallerIdentity: InvalidClientTokenId: The security token included in the request is invalid
status code: 403, request id: 00771614-5553-4eaf-ae8d-a3ce54c66060
```
Upon resetting the correct value, we should be able to connect to S3 backend again!