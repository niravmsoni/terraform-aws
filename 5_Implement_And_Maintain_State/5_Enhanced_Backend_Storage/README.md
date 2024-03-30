# Terraform Remote State - Enhanced Backends
- Standard backends - Store state remotely but terraform operations and execution are performed locally
- There are 2 enhanced backends
    - local
    - remote

- local backend (Default backend) -Is an enhanced backend since it stores state and performes operations also LOCALLY
- remote backend - Stores terraform state remotely and runs operations also remotely in Terraform cloud. When using full remote operations like (terraform plan, terraform apply etc.), they can be executed in terraform cloud's run environment with log output streaming to local terminal