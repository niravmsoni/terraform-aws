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

- Multi-environment setup
    - Consider if we have to replicate same infrastructure on multiple environments, most times, we would see there would be environment specific .tfvars file be created
    - For ex - If we have these environments
        - Dev
        - QA
        - Perf
        - Prod

    - We could provision 1 variable file per environment i.e.
        - terraform.dev.tfvars
        - terraform.qa.tfvars
        - terraform.perf.tfvars
        - terraform.prd.tfvars
    
    - Typically we would have CI/CD setup for such configuration.
    - How does terraform know which file to use for which environment?
        - Within plan/apply command, there is a file switch that we can use to specify which file to use to assign values
        - terraform apply -var-file="terraform.common.tfvars" -var-file="terraform.dev.tfvars"
