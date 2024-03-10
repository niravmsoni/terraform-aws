# Resource Blocks
- Syntax

```hcl
resource "<Type_Of_Resource> <Resource_Name>"{
    <Resource_Attribute_Key> = <Value>
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
    }
    tags = {
        Name = "Nirav Tag"
        CreatedThrough = "Terraform"
    }
}

# Here, public_route_table is the name within our terraform code. If a name attribute is present against a resource type (For ex : EC2 instance, we need to specify it within the resource block)

```
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


