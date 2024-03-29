# Terraform Module Scope
- Modules should be opinionated and designed to do 1 thing well
- If Module's purpose is hard to explain, it is too complex

- For example - [AWS Autoscaling module](https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest)

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/a958d2e3-0e69-4fe8-a683-5b455b77d311)

- Module has:
    - 95 Inputs (Out of which only 1 is Required)
    - 27 Outputs
    - Creates 9 resources