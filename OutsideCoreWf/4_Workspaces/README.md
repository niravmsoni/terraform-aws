# Terraform Workspaces - OSS

- Workspaces is a TF feature that allow us organize infrastructure by environments and variables in a single directory
- By-default, there is a workspace that is created namely "default". Whenever we do terraform init locally and the local backend that gets initialized uses this default workspaces
- Using workspaces, terraofrm allows us to leverage DRY (Don't Repeat Yourself) development practices allowing us to use the same code base but for different environments
```hcl
terraform workspace
```
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/2a466757-c0b4-4dc0-9d88-4043acb1cd9c)


```hcl

terraform workspace show

```
- Tells us we are operating under default workspace
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/7f25a358-2007-443c-a4f1-d9e1b14613e2)
