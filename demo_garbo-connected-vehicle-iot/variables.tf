## variables.tf

variable "region" {
  description = "The AWS region to deploy resources into."
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "The AWS profile to use for deployment."
  type        = string
  default     = "default"
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed."
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "The IDs of the subnets for deploying resources."
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "The type of EC2 instance to deploy."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair to attach to EC2 instances."
  type        = string
  default     = ""
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed to SSH to the instances."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {
    Project = "Connected Vehicle Platform"
  }
}
