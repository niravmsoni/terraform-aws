# Debugging Terraform
- Terraform has detailed log which can be enabled using "TF_LOG" environment variable to a value
- Value can be
    - TRACE (Most verbose)
    - DEBUG
    - INFO
    - WARN
    - ERROR

- Set it using
    - Linux - export TF_LOG=TRACE
    - PS - $env: TF_LOG="TRACE"
    - And run terraform apply

- After executing terraform apply, we can see code interacting with AWS provider API internally and comparing state information
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/8d1459ec-94d8-4299-a4ac-2b3c15b272a2)
