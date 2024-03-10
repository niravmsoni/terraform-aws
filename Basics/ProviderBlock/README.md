# Provider block
- Overview
    - Terraform relies on plugins called "providers" to interact with remote systems. Terraform configurations must declare which providers they require, so that Terraform can install and use them.

    - This section works in conjunction with the __required_providers__ block we specify in terraform block
    - Each Terraform module must declare which providers it requires, so that Terraform can install and use them. Provider requirements are declared in a required_providers block.

    - A provider requirement consists of a local name, a source location, and a version constraint:
    - The required_providers block must be nested inside the top-level terraform block (which can also contain other settings).

    - Each argument in the required_providers block enables one provider. The key determines the provider's local name (its unique identifier within this module), and the value is an object with the following elements:
        - source - the global source address for the provider you intend to use, such as hashicorp/aws.
        - version - a version constraint specifying which subset of available provider versions the module is compatible with.

    - Each provider has 2 identity
        - Unique Source address - Used when requiring a provider
        - Local name - Used everywhere else in terraform module
```hcl
terraform {
  required_providers {
    mycloud = {
      source  = "mycorp/mycloud"
      version = "~> 1.0"
    }
  }
}

# Referencing using Local Name "mycloud" specified in terraform block
provider "mycloud" {
  # ...
}
```

- Each provider has differrent configurations that it could take in within the provider block. Find major public cloud provider documentation here
    - [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
    - [AzureRm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
    - [GCP](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

- AWS
    - A few of the most used arguments that are present in AWS provider block are as follows:
        - region
        - access_key
        - secret_key
        - profile
        - shared_config_files
        - shared_credentials_files
        - ...etc.

    - One of the most used way to communicate with AWS/AzureRm
        - Using Environment variables
```shell
% export AWS_ACCESS_KEY_ID="anaccesskey"
% export AWS_SECRET_ACCESS_KEY="asecretkey"
% export AWS_REGION="us-west-2"
% terraform plan
```
