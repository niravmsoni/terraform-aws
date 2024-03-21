# Terraform Workspaces - OSS

- Workspaces is a TF feature that allow us organize infrastructure by environments and variables in a single directory
- By-default, there is a workspace that is created namely "default". Whenever we do terraform init locally and the local backend that gets initialized uses this default workspaces
- Using workspaces, terraofrm allows us to leverage DRY (Don't Repeat Yourself) development practices allowing us to use the same code base but for different environments
```hcl
terraform workspace command
```