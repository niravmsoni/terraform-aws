# Data Block
- Data sources allow TF to use information defined outside of TF, defined by another separate TF configuration, or modified by functions.
- Each provider may offer data sources alongside its set of resource types.
- A data source is accessed via a special kind of resource known as a data resource, declared using a data block:

```hcl
data "aws_ami" "example" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

```
- A data block requests that TF read from a given data source ("aws_ami") and export the result under the given local name ("example"). 
- The name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside of the scope of a module.

- Data Blocks with AWS
- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/4a63ab7a-3de3-43b0-929b-fcfd8c635003)
