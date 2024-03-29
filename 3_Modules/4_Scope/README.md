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
- We can view it using this command
terraform console

```bash
> module.autoscaling

{
  "autoscaling_group_arn" = "arn:aws:autoscaling:us-east-1:508140242758:autoScalingGroup:2a33891c-6c8b-4434-9386-bf1f1574523d:autoScalingGroupName/myasg-20211218123153166900000003"
  "autoscaling_group_availability_zones" = toset([
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
  ])
  "autoscaling_group_default_cooldown" = 300
  "autoscaling_group_desired_capacity" = 1
  "autoscaling_group_health_check_grace_period" = 300
  "autoscaling_group_health_check_type" = "EC2"
  "autoscaling_group_id" = "myasg-20211218123153166900000003"
  "autoscaling_group_load_balancers" = toset(null) /* of string */
  "autoscaling_group_max_size" = 1
  "autoscaling_group_min_size" = 0
  "autoscaling_group_name" = "myasg-20211218123153166900000003"
  "autoscaling_group_target_group_arns" = toset(null) /* of string */
  "autoscaling_group_vpc_zone_identifier" = toset([
    "subnet-01dcabb8c2474bd4f",
    "subnet-0d29fb83c81f6278b",
    "subnet-0e509d03fb7841876",
  ])
  "autoscaling_schedule_arns" = (known after apply)
  "launch_configuration_arn" = (known after apply)
  "launch_configuration_id" = (known after apply)
  "launch_configuration_name" = (known after apply)
  "launch_template_arn" = "arn:aws:ec2:us-east-1:508140242758:launch-template/lt-0bdc46cf90ccdad50"
  "launch_template_id" = "lt-0bdc46cf90ccdad50"
  "launch_template_latest_version" = 1
  .
  .

}
```

## Good Practices while building module
When building a module, consider three areas:

- **Encapsulation:** Group infrastructure that is always deployed together. Including more infrastructure in a module makes it easier for an end user to deploy that infrastructure but makes the module's purpose and requirements harder to understand
- **Privileges:** Restrict modules to privilege boundaries. If infrastructure in the module is the responsibility of more than one group, using that module could accidentally violate segregation of duties. Only group resources within privilege boundaries to increase infrastructure segregation and secure your infrastructure
- **Volatility:** Separate long-lived infrastructure from short-lived. For example, database infrastructure is relatively static while teams could deploy application servers multiple times a day. Managing database infrastructure in the same module as application servers exposes infrastructure that stores state to unnecessary churn and risk.

A simple way to get start with creating modules is to:

- Always aim to deliver a module that works for at least 80% of use cases.
- Never code for edge cases in modules. An edge case is rare. A module should be a reusable block of code.
- A module should have a narrow scope and should not do multiple things.
- The module should only expose the most commonly modified arguments as variables. Initially, the module should only support variables that you are most likely to need.