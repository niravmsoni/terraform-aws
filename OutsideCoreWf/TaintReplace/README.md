# Terraform Taint and Replace command
- Let's say we have a resource that we want to temporarily remove.
- Alternative approaches
    - Simple way - Comment, Apply, Uncomment, ReApply
    - Using Taint
    - Using -replace flag

1. Simple way 
    - Comment the configuration block and run terraform plan/apply.
        - This will delete the resource
    - For re-creating it, uncomment the configuration block and re-run terraform plan/apply
        - This will create the resource back

2. Terraform taint
    - However, this approach is not the ideal approach. A better way to deal with this situation is through terraform taint command

    - Terraform taint command allows us to manually mark resource for recreation
    - taint command informs TF that particular resource needs to be rebuilt even if there is no configuration change
    - Terraform marks resource as "tainted" in the state in which case TF will propose to replace it in the next plan

```hcl
# Sample Web Server
resource aws_instance "web_server"{
    <Properties>
}

// For marking this web_server as tainted, execute this command
terraform taint aws_instance.web_server

// This will instruct terraform to mark this instance as tainted
// Upon next execution of TF Plan, it will say that aws_instance.web_server needs recreating

terraform plan -out tfPlan

```

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/fa60cfa8-d765-4e53-93c4-fbfa81585563)

- In-case if a remote-exec provisioner fails due to any reason OR TF is unable to successfully deploy a resource, TF marks the resource as tainted

- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/f56984af-2ec2-445f-b15f-92aa52564f28)

- To undo taint, there is an 'untaint' command

```hcl
//Untainting
terraform untaint aws_instance.web_server

//Checking status of resource. We could see it as untainted and we cannot see any changes in the plan
terraform state show aws_instance.web_server
```
IMPORTANT - After TF 15.2, taint and untaint commands are marked deprecated

3. -replace flag
    - In the Latest versions of terraform, there is a better way to achieve the same implementation using -replace flag

```hcl
terraform apply -replace="aws_instance.web_server"

```