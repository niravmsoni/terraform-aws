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

- After executing terraform apply
