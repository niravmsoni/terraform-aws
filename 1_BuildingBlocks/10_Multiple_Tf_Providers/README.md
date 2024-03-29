# Multiple Terraform Providers
- We could easily plug-in multiple providers with terraform
- Please find providers [here](https://registry.terraform.io/browse/providers)
    - Http Provider [here](https://registry.terraform.io/providers/hashicorp/http/latest)
    - Local Provider [here](https://registry.terraform.io/providers/hashicorp/local/latest)
    - TLS Provider [here](https://registry.terraform.io/providers/hashicorp/tls/latest/docs)
- In-case if we do not specify a version, TF will by-default download the latest provider version
- Ideally, we should be explicit in specifying the version of the provider we want to use
- We can use combination of TLS provider + Local Provider to generate pem file for EC2 instance and store it in local file

- Upgrade Providers
- How to update version of a provider?
    - terraform init -upgrade
        - This will check the local versions and see if they are matching with the version specified in terraform.tf
        - If so, it would use the same provider version(as present locally). If not, it will download a newer version

- Once provider versions are downloaded, it generates a dependency lock file (terraform.lock.hcl)
- If (For example), we decide to downgrade a version of provider, we will have to change the version in the provider file and run terraform init -upgrade and we would see terraform installing the downgraded version of the provider and update the same information in dependency lock file
 