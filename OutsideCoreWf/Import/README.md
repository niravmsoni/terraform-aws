# Terraform Import
- Not always we would find a usecase where we are creating resources from the scratch using terraform. Sometimes, there would be existing resources created outside the terraform boundary either
    - Manually
    - Or through any other IaC tool

- Terraform has a command that we can use to import the resource within the terraform state namely "import"

```hcl
terraform import
```