# Terraform Import
- Not always we would find a usecase where we are creating resources from the scratch using terraform. Sometimes, there would be existing resources created outside the terraform boundary either
    - Manually
    - Or through any other IaC tool

- Terraform has a command that we can use to import the resource within the terraform state namely "import"

```hcl
terraform import
```

- For ensuring import works, create an empty resource block within any configuration file
    - For example, if we have an EC2 instance manually provisioned outside the TF boundary, for importing it,

```hcl
resource "aws_instance" "aws_linux" {

}

terraform import -help

terraform import aws_instance.aws_linux "Instance_Id" from below screenshot
```

- EC2 instance Manually provisioned
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/070a202b-1e9b-4caa-9fea-578d8203a5bb)

- After Import
  
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/fd487526-2668-4e34-925e-56719801c25b)

