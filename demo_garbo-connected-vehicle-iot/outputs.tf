## outputs.tf

output "vpc_id" {
  description = "The ID of the VPC created."
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the subnets created."
  value       = module.subnets.subnet_ids
}

output "security_group_id" {
  description = "The ID of the security group created."
  value       = module.security_group.security_group_id
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance created."
  value       = module.ec2_instance.instance_id
}
