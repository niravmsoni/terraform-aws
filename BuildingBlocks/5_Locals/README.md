# Locals Block

- Locals blocks (often referred to as locals) are defined values in Terraform that are used to reduce repetitive references to expressions or values. 
- Locals are very similar to traditional input variables and can be referred to throughout your Terraform configuration. 
- Locals are often used to give a name to the result of an expression to simplify your code and make it easier to read. (For ex - Tags)
- Locals are not set directly by the user/machine executing the Terraform configuration, and the values do not change between or during the Terraform workflow (init, plan, apply)


```hcl
locals {
# Block body
local_variable_name = <EXPRESSION OR VALUE>
local_variable_name = <EXPRESSION OR VALUE>
}

locals {
time = timestamp()
application = "api_server"
server_name = "${var.account}-${local.application}"
}
```