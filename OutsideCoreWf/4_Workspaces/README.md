# Terraform Workspaces - OSS

- TF Workspaces are used both with open source and TF cloud and enterprise
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


- Create a new development workspace

```hcl
// This will create a new workspace namely development
terraform workspace new development

// This will show all workspaces (Default + Newly created development)
terraform workspace list

// This will show us no-state since we're on development workspace and we have not yet run TF init/plan
terraform show
```

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/8d9bd6b5-a7a8-4b1c-9ee1-c7a85c68ffe4)

- Updated region of AWS and now executing TF plan, this will show all 26 resources to add since against this workspace(Development) we do not have any resources created