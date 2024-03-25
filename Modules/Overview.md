# Overview
- TF configuration can be spearated into modules to better organize configuration
- This makes code easier to read and reusable across organization
- Definition- Module is any set of TF configuration files in a folder
- Modules are a key ingredient to write reusable and maintainable TF code

- Till now, we were placing all files in the root directory. TF by default scans all the .tf files within the current executing directory & then considers them for creation/modification of resource
- For ensuring terraform reads the contents within a separate directory and uses them for resource creation, we need to use module

- Consider modules as functions in C#. Similar to functions, there are 2 things we need to make sure module behaves as expected
    - Defining a module (Similar to creating a function with input arguments/output variables)
    - Calling the module (Calling the function by passing in required relevant arguments. Similar to function, we can call the module multiple times and this actually promotes reusability)

## Creating a local TF Module
- Create a new directory called `server` in your `/workspace/terraform` directory and create a new file inside of it called `server.tf`.

Edit the file `server/server.tf`, with the following contents:

```hcl
variable "ami" {}
variable "size" {
  default = "t2.micro"
}
variable "subnet_id" {}
variable "security_groups" {
  type = list(any)
}
resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.size
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups

  tags = {
    "Name"        = "Server from Module"
    "Environment" = "Training"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

output "public_dns" {
  value = aws_instance.web.public_dns
}
```

- In your root configuration (also called your root module) `/workspace/terraform/main.tf`, we can call our new `server` module with a Terraform module block. Remember that terraform only works with the configuration files that are in it's current working directory. Modules allow us to reference Terraform configuration that lives outside of our working directory. In this case we will incorporate all configuration that is both inside our working directory (root module) and inside the `server` directory (child module).

```hcl
module "server" {
  source          = "./server"
  ami             = data.aws_ami.ubuntu.id
  subnet_id       = aws_subnet.public_subnets["public_subnet_3"].id
  security_groups = [
    aws_security_group.vpc-ping.id,
    aws_security_group.ingress-ssh.id,
    aws_security_group.vpc-web.id
  ]
}
```
- Now run `terraform init` to install the module. Terraform configuration files located within modules are pulled down by Terraform during initialization, so any time you add or update a module version you must run a `terraform init`.

```shell
terraform init
```

You can see that our configuaration now depends on this module to be installed and used by using the `terraform providers` command.

```shell
terraform providers

Providers required by configuration:
.
|-- provider[registry.terraform.io/hashicorp/aws] ~> 3.0
|-- module.server
    |-- provider[registry.terraform.io/hashicorp/aws]

Providers required by state:
    provider[registry.terraform.io/hashicorp/aws]
    provider[registry.terraform.io/hashicorp/tls]
```
- Here we can see along with provider, whatever modules are registered in the configuration, they're also getting visible in the configuration output

- We can add two output blocks to our `main.tf` to report back the IP and DNS information from our `server` module. Notice how Terraform references (interpolation syntax) information about the server build from a module.

## Referencing a module in a TF configuration
- Upon doing terraform state list, we can see resource created with a module being present here


- We can reference it using module.<moduleName>.<Property>

```hcl
output "public_ip" {
  value = module.server.public_ip
}

output "public_dns" {
  value = module.server.public_dns
}
```

## Reusing module