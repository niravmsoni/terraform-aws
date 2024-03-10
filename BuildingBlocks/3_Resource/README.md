# Resource Blocks

- Terraform uses resource blocks to manage infrastructure, such as virtual networks, compute instances,
or higher-level components such as DNS records. 
- Resource blocks represent 1 or more(Using for_Each loop) infrastructure objects in your Terraform configuration

- For example
| Resource   | AWS Provider       | AWS Infrastructure |
| ---------- | ------------------ | ------------------ |
| Resource 1 | aws_instance       | EC2 Instance       |
| Resource 2 | aws_security_group | Security Group     |
| Resource 3 | aws_s3_bucket      | Amazon S3 bucket   |
| Resource 4 | aws_key_pair       | EC2 Key Pair       |


