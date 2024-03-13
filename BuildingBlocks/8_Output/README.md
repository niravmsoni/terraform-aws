# Output block
- TF output values allow us to export structured data about our resources
- We can use this data to configure other parts fo infrastructure with automation tools OR as data source for another TF workspace
- Outputs are necessary to share data from child module to root module

```hcl
output <NAME> {
    value = <Expression>
}

output "web_server_ip" {
    description = "Public IP of EC2"
    value       = aws_instance.web_server.public_ip
    sensitive   = true
}
```

- Generally, its recommended practice to have output block in outputs.tf file
- If terraform code outputs content, it does store it in its state file. For outputing the content in json format, we can execute this command
    - terraform output -json
    - ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/fab3bf2e-3252-4e75-92a5-42241976c586)
