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

- After executing terraform init, we can see the entire initialization sequence (Initialization of TF, Verifying required providers etc. )

- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/9e2b7bd1-bf57-4e41-9819-e863771863ca)

- We can also persist log to a file using environment variable "TF_LOG_PATH"
- Set it using
    - Linux - export TF_LOG_PATH = "terraform_log.txt"
    - PS - $env:TF_LOG_PATH="terraform_log.txt"
    - Run terraform init -upgrade to see initialization
 
 - We can see a log file getting generated like this:
  ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/dd95fe10-7dc2-43ae-ad47-e1f519cde490)

- Disable Logging
- Clear the TF_LOG environment variable
- Generally recommended to turn on logging only if we're troubleshooting something. Once we are done with the error, we can get rid of logging 
- ![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/35905b42-84d7-4c79-bc04-4059a6c20792)
