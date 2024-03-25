# Terraform State CLI
- terraform state command - used for advanced state management
- State file stores data in json format

- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/88df3fd5-89a9-4162-aa1c-1083f7df4771)

- Always recommended to not modify state 
- Commands

```hcl
// Renders all the resources managed by Terraform state
terraform show
```
- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/f7828f00-b7b5-43b6-9557-6241330591dc)


```hcl
// Gives us a summary of all the resources managed by Terraform
terraform state list
```
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/11a92a38-66a9-4afa-a6e3-26557eb32067)

```hcl
// For viewing at a detail of individual resource within state file
terraform state show aws_instance.web_server
```

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/b05979f6-1f1d-4479-87ee-8aaf3d0493df)
