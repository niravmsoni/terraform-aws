# Terraform State Local Backend
## Overview for State
- Terraform stores and operates on the state of your managed infrastructure. Terraform uses this state on each execution to plan and make changes. 
- This state must be stored and maintained on each execution so future operations can be performed correctly. 
- The location and method of operation of Terraform's state is determined by the Terraform backend. 
- By `default` Terraform uses a local backend, where state information is stored and acted upon locally within the working directory in a local file named `terraform.tfstate`.

## Local state
 Terraform stores state locally in a JSON file on disk, but it also supports a number of state backends for storing "remote state"

Terraform's local state is stored on disk as JSON, and that file must always be up to date before a person or process runs Terraform. If the state is out of sync, the wrong operation might occur, causing unexpected results.

By default terraform uses a local backend and saves its state file to a terraform.tfstate file located in the working directory. You can validate that your state file lives in the current directory by looking for the presence of a terraform.tfstate file. You may also see a backup that was created for this state file

```shell
|-- main.tf
|-- terraform.tf
|-- terraform.tfstate
|-- terraform.tfstate.backup
|-- terraform.tfstate.d
|-- |-- development
      |-- terraform.tfstate
      |-- terraform.tfstate.backup
|-- variables.tf
```
If you open and view the terraform.tfstate file you will notice that it is stored in a json format

## View/Update Terraform local backend configuration

The terrafrom backend end configuration for a given working directory is specified in the Terraform configuration block. Our terraform configuaration block for this lab is located in the `terraform.tf` file.

```hcl
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
```
By default there is no backend configuration block within our configuration. Because no backend was included in our configuration Terraform will use it's default backend - local This is why we see the terraform.tfstate file in our working directory. 

If we want to be explicit about which backend Terraform should use it would cause no harm to add the following to our Terraform configuration block within the terraform.tf file

```hcl
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
```
This is not required and generally not performed as it is the Terraform defalt backend that terraform uses.
