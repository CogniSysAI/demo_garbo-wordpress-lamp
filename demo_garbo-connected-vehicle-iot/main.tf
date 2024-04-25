## main.tf

# Define the provider configuration
provider "aws" {
  region  = var.region
  profile = var.profile
  version = "~> 3.0"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
  vpc_id = var.vpc_id
  tags   = var.tags
}

# Subnet Module for each subnet ID provided
module "subnets" {
  source     = "./modules/subnets"
  subnet_ids = var.subnet_ids
  vpc_id     = module.vpc.vpc_id
  tags       = var.tags
}

# Security Group Module
module "security_group" {
  source          = "./modules/security_group"
  allowed_ssh_cidr = var.allowed_ssh_cidr
  vpc_id          = module.vpc.vpc_id
  tags            = var.tags
}

# EC2 Instance Module
module "ec2_instance" {
  source        = "./modules/ec2_instance"
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.subnets.subnet_ids[0] # Assuming deployment in the first subnet
  security_groups = [module.security_group.security_group_id]
  tags          = var.tags
}

# Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}
