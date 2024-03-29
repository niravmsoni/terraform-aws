# Terraform State Local Backend
- Terraform stores and operates on the state of your managed infrastructure. Terraform uses this state on each execution to plan and make changes. 
- This state must be stored and maintained on each execution so future operations can be performed correctly. 
- The location and method of operation of Terraform's state is determined by the Terraform backend. 
- By `default` Terraform uses a local backend, where state information is stored and acted upon locally within the working directory in a local file named `terraform.tfstate`.