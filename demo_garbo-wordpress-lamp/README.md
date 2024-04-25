## README.md
# Project Overview

This project automates the provisioning and configuration of a LAMP (Linux, Apache, MySQL, PHP) stack on AWS ECS using Terraform for infrastructure as code and Ansible for configuration management. The goal is to create a scalable and maintainable infrastructure that can handle varying loads with autoscaling policies based on CPU and memory usage.

## Prerequisites

Before you begin, ensure you have the following installed:
- Terraform (v0.14+)
- Ansible (v2.9+)
- AWS CLI (configured with appropriate access credentials)
- Python packages: `boto3==1.20.24`, `ansible==5.0.1`
  