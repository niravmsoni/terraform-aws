# Variables in Terraform
- While working with Terraform templates we should focus on reusability and DRY development (don’t
repeat yourself)
- Input variables allow aspects of a module or configuration to be customized without altering the module’s own source code. This allows modules to be shared between different configurations
- Variables would most often be declared in a separate file (variables.tf) although its not mandatory
- Variables are declared in a variable block - one block for each
variable. The variable block contains the variable name, most importantly, and then often includes
additional information such as the type, a description, a default value, and other options.

- Syntax

```hcl

variables.tf

variable "<VAR_NAME>" {
    type = <DATA_TYPE>
    description = <DESCRIPTION>
    default = <EXPRESSION>
    sensitive = <BOOLEAN>
    validation = <RULES>
}

variable "aws_region" {
type = string
description = "region used to deploy workloads"
default = "us-east-1"
validation {
condition = can(regex("^us-", var.aws_region))
error_message = "The aws_region value must be a valid region in the
USA, starting with \"us-\"."
}
}
```

- Variables can be assigned values in multiple ways
    - Defaults
    - Environment variables
    - Setting value in terraform.tfvars file
    - Setting value in terraform.tfvars.json file
    - *.auto.tfvars or *.auto.tfvars.json
    - Command line

- Precendence is bottom to top (If same variable is assigned a default value and a command line value, command line will take precedence)

