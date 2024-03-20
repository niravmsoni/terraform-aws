# Terraform Taint and Replace command
- Let's say we have a resource that we want to temporarily remove.
    - Simple way 
        - Comment the configuration block and run terraform plan/apply.
        - This will delete the resource
        - For re-creating it, uncomment the configuration block and re-run terraform plan/apply
        - This will create the resource back
    - However, this approach is not the ideal approach. A better way to deal with this situation is through terraform taint command

- Terraform taint command allows us to manually mark resource for recreation
- taint command informs TF that particular resource needs to be rebuilt even if there is no configuration change
- Terraform marks resource as "tainted" in the state in which case TF will propose to replace it in the next plan