# Plugin based architecture

```hcl
terraform {
# Tells us the terraform CLI version that is required for this configuration
  required_version = ">= 1.0.0"

# Specifies providers required for this configuration
  required_providers {
# Provider name and along with that source and version details are also entered
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}
```

- After performing terraform init, it will download required providers
- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/b3ce73c8-4183-4c88-9a11-0c76c3ad7f31)

- Terraform version
- Tells us the terraform version installed. Along with that, if we have installed any providers, it tells us about version details of that provider as well
- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/6a330368-a5bc-44ce-b87e-6231b1208b3b)

- terraform providers
- Tells us all the providers required for our configuration to run
- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/4dc52979-5815-4f33-8a5b-a5938a0a1a34)
