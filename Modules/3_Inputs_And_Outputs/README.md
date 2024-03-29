# Modules - Inputs and Outputs
- For making module configurable, we can add input parameters to module.
- They can be defined within module using input variables
- Module can also return values to configuration that called module. They are known as output blocks

![image](https://github.com/niravmsoni/terraform-aws/assets/6556021/38a584a0-493c-499b-9a39-8c86f87b5f02)

- So, a module folder typically consists of 3 files
    - main.tf
        - Contains core resource to be created
    - variables.tf
        - Contains input variables. 
        - If input variables have a default value assigned, that makes them optional variables else it would be required
    - outputs.tf
        - Contains outputs to be returned from a module

