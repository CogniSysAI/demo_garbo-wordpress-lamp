# Define the provider and version
provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"
}

# Initialize the backend for Terraform state files
terraform {
  backend "s3" {
    bucket = "terraform-state-prod"
    key    = "ecs/terraform.tfstate"
    region = "us-east-1"
  }
}

# Declare variables with default values and explicit types
variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "LAMP_Stack_Cluster"
}

variable "cpu_threshold" {
  description = "The CPU threshold for autoscaling"
  type        = number
  default     = 75
}

variable "memory_threshold" {
  description = "The memory threshold for autoscaling"
  type        = number
  default     = 80
}

# Use the Terraform AWS ECS module for cluster creation
module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 2.0"

  name = var.cluster_name
}

# Use the Terraform AWS Autoscaling module for configuring autoscaling
module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"

  # Assuming these are part of the module's required variables
  cpu_threshold    = var.cpu_threshold
  memory_threshold = var.memory_threshold
  cluster_name     = var.cluster_name
}

# Output cluster name and autoscaling thresholds for verification
output "cluster_name" {
  value = module.ecs.name
}

output "cpu_threshold" {
  value = var.cpu_threshold
}

output "memory_threshold" {
  value = var.memory_threshold
}
