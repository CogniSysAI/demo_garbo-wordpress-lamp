provider "aws" {
  region  = var.region != "" ? var.region : "us-east-1"
  profile = var.profile != "" ? var.profile : "default"
  version = "~> 3.0"
}

variable "region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "The AWS profile to use for deployment"
  type        = string
  default     = "default"
}
