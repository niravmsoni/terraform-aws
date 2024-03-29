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