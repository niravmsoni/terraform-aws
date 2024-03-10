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
