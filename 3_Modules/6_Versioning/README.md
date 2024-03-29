# Terraform Module Versioning
- Modules, like any piece of code, are never complete. There will always be new module requirements and changes.
- Each distinct module address has associated with it a set of versions, each of which has an associated version number.

## How to specify Module Versions?

- Each module in the Terraform Public registry is versioned. These versions syntactically must follow semantic versioning

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"
}
```
- When installing a module inside the working directory with a `terraform init` Terraform pulls down version of the module specified by the version argument.

```bash
terraform init

Initializing modules...
Downloading registry.terraform.io/terraform-aws-modules/vpc/aws 3.11.0 for vpc...
- vpc in .terraform/modules/vpc
```

## Comparing module versions

Update the vpc module block to specify a particular module version, by adding the `version` argument. You can find the latest version of the module by viewing the module information in the Terraform Public Module Registry

[VPC Module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)

- After upgrading/downgrading module version, we can run into errors such as deprecated items etc. One should update the versions carefully

## Using Version constraints

When using modules installed from a module registry it is highly recommended to explicitly constrain the acceptable version numbers to avoid unexpected or unwanted changes. Terraform provides the ability to resolve any provided module version constraints and using them is highly recommended to avoid pulling in breaking changes. The version argument accepts a version constraint string. Terraform will use the newest installed version of the module that meets the constraint; if no acceptable versions are installed, it will download the newest version that meets the constraint.

Update the VPC module block to utilze any version greater then 3.0.0

```hcl
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = ">3.0.0"

  name = "my-vpc-terraform"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Name        = "VPC from Module"
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## IMPORTANT NOTE

- Version constraints are supported only for modules installed from a module registry, such as the public Terraform Registry or Terraform Cloud's private module registry

- Other module sources can provide their own versioning mechanisms within the source string itself, or might not support versions at all. In particular, modules sourced from local file paths do not support version; since they're loaded from the same source repository, they always share the same version as their caller.