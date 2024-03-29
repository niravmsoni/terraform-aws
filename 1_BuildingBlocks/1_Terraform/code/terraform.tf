terraform {
  required_version = ">= 1.0.0" # This means any version >= 1.0.0 is required for TF CLI
  #required_version = "= 1.0.0" # This means we are explicitly saying, 1.0.0 is the only version of TF CLI that will work 
  #required_version = "~1.0.0" # This means anything that changes at the right-most number 1.0.x is considered valid
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"  #This means we are seeking AWS provider version of 3.0 or above
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}