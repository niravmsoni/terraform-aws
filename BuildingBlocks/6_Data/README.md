# Data Block
- Data sources allow TF to use information defined outside of TF, defined by another separate TF configuration, or modified by functions.
- Each provider may offer data sources alongside its set of resource types.
- A data source is accessed via a special kind of resource known as a data resource, declared using a data block:

```hcl

data "aws_region" "current"{}
data "aws_availability_zones" "available" {}

resources "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
        Region = data.aws_region.current    # This is how we reference data
    }
}

```
- A data block requests that TF read from a given data source ("aws_ami") and export the result under the given local name ("example"). 
- The name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside of the scope of a module.

- Data Blocks with AWS
- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/4a63ab7a-3de3-43b0-929b-fcfd8c635003)

- This is of great use when we want to reference resources created outside current Terraform configuration (For ex - Within NG - While getting subnets for different VNets, had to use data block to get subnet Id)