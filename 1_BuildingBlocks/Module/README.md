# Module Block
- Module is used to combine resources that are frequently used together in reusable container
- Modules promotes reusability. A module can be deployed in different ways
- Modules are called by parent or root module and any module that parent module calls is clled as child module

--root directory
----Modules
    --vpc_module
        -- main.tf
        -- variables.tf
        -- outputs.tf
    --subnet_module
        -- main.tf
        -- variables.tf
        -- outputs.tf
main.tf
variables.tf
outputs.tf

- Modules can be developed locally or can be borrowed from remote registry. Find modules hosted on terraform registry [here](https://registry.terraform.io/browse/modules)
- Local modules are commonly saved in modules folder and each module is named for its respective function inside that folder
- Syntax

```hcl
module <ModuleName> {
    source = <ModuleSource>
    <InputName> = <Description>
}

module "website_s3_bucket" {
source = "./modules/aws-s3-static-website-bucket"
bucket_name = var.s3_bucket_name
aws_region = "us-east-1"
tags = {
Terraform = "true"
Environment = "certification"
}
```
- Within example, used these [module from Hashicorp](https://registry.terraform.io/modules/hashicorp/subnets/cidr/latest) 