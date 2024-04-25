## variables.tf

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

variable "subnets" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
  default     = ["subnet-12345678", "subnet-87654321"]
}

variable "security_groups" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = ["sg-12345678"]
}

variable "vpc_id" {
  description = "The VPC ID where resources will be deployed"
  type        = string
  default     = "vpc-12345678"
}

variable "lb_arn" {
  description = "The ARN of the load balancer"
  type        = string
  default     = "arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/my-load-balancer/50dc6c495c0c9188"
}

# Ensure all variables have strong types, explicit descriptions, and default values to maintain clarity, reusability, and avoid circular imports.
