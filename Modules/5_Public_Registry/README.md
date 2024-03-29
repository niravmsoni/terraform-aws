# Terraform modules Public registry
- Hashicorp maintains a public registry [here](https://registry.terraform.io/browse/modules) helps us consume Terraform modules from others.
-  It includes support for module versioning and searchable and filterable list of available modules for quickly deploying common infrastructure configurations.
- Modules on the public Terraform Registry can be sourced using a registry source address of the form <NAMESPACE>/<NAME>/<PROVIDER>

## How to consume a Module?
Let's add an S3 bucket to our configuration using the S3 public module.

`main.tf`

```hcl
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.11.1"
}

output "s3_bucket_name" {
  value = module.s3-bucket.s3_bucket_bucket_domain_name
}
```

```bash
terraform init
terraform plan


  # module.s3-bucket.aws_s3_bucket.this[0] will be created
  + resource "aws_s3_bucket" "this" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = (known after apply)
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

  # module.s3-bucket.aws_s3_bucket_public_access_block.this[0] will be created
  + resource "aws_s3_bucket_public_access_block" "this" {
      + block_public_acls       = false
      + block_public_policy     = false
      + bucket                  = (known after apply)
      + id                      = (known after apply)
      + ignore_public_acls      = false
      + restrict_public_buckets = false
    }
```

```bash
terraform apply

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

s3_bucket_name = "terraform-20211220113638832700000001.s3.amazonaws.com"
```