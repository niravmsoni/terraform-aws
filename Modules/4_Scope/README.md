# Terraform Module Scope
- Modules should be opinionated and designed to do 1 thing well
- If Module's purpose is hard to explain, it is too complex

## Examining sample resources within child module
- For example - [AWS Autoscaling module](https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest)

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/a958d2e3-0e69-4fe8-a683-5b455b77d311)

- Module has:
    - 95 Inputs (Out of which only 1 is Required)
    - 27 Outputs
    - Creates 9 resources

## Scoping inputs and outputs
![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/0b680037-c05b-42f9-9d29-f80bbf649f25)

- This diagram provides an understanding for relationships between root and child modules
- Modules are simply configuration files that have optional/required inputs and return specified number of outputs
- Consider configuration code within module as black box and we can configure that box using inputs and we do not have to worry about the internal working of the module
- We should also be generous in exposing the number of output parameters since we never know what output value will be of use to the calling module
- The Autoscaling module returns 27 outputs