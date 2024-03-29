# Locals Block

- Locals blocks (often referred to as locals) are defined values in Terraform that are used to reduce repetitive references to expressions or values. 
- Locals are very similar to traditional input variables and can be referred to throughout your Terraform configuration. 
- Locals are not set directly by the user/machine executing the Terraform configuration, and the values do not change between or during the Terraform workflow (init, plan, apply)
- A local value assigns a name to an expression, so you can use the name multiple times within a module instead of repeating the expression.
- If you're familiar with traditional programming languages, it can be useful to compare Terraform modules to function definitions:
    - Input variables are like function arguments.
    - Output values are like function return values.
    - Local values are like a function's temporary local variables.

- When to use Locals?
    - Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration, but if overused they can also make a configuration hard to read by future maintainers by hiding the actual values used.
    - Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values.
    
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