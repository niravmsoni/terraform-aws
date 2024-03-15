# Multiple Terraform Providers
- We could easily plug-in multiple providers with terraform
- Please find providers [here](https://registry.terraform.io/browse/providers)
    - Http Provider [here](https://registry.terraform.io/providers/hashicorp/http/latest)
    - Local Provider [here](https://registry.terraform.io/providers/hashicorp/local/latest)
    - TLS Provider [here](https://registry.terraform.io/providers/hashicorp/tls/latest/docs)
- In-case if we do not specify a version, TF will by-default download the latest provider version
- Ideally, we should be explicit in specifying the version of the provider we want to use
