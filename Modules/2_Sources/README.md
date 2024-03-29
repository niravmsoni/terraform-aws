# Module Sources
- Modules can be sourced from number of different locations including remote and local sources
- Remote Source examples
    - [TF Module Registry](https://registry.terraform.io/browse/modules)
    - HTTP URLs
    - S3 Buckets etc.

- Local Sources
    - Folders
    - Sub folders

- Anytime we update the location of the module source, we need to re-initialize the working directory

```hcl
terraform init
```
- After pointing it to a new path, there would be no changes in the resource configuration since we have merely updated the path of the module

- Each module hosted on public registry is requried to open source their code on Github. So, we can either reference module from registry or DIRECTLY from the underlying Github repository as well

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/bdcd86c1-d7cb-4863-9d9d-dc90998e4374)
