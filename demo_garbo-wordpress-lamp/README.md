# Project Overview

This project automates the provisioning and configuration of a LAMP (Linux, Apache, MySQL, PHP) stack on AWS ECS using Terraform for infrastructure as code and Ansible for configuration management. The goal is to create a scalable and maintainable infrastructure that can handle varying loads with autoscaling policies based on CPU and memory usage.

## Prerequisites

Before you begin, ensure you have the following installed:
- Terraform (v0.14+)
- Ansible (v2.9+)
- AWS CLI (configured with appropriate access credentials)
- Python packages: `boto3==1.20.24`, `ansible==5.0.1`
  
  ```bash
  pip install boto3==1.20.24 ansible==5.0.1
  ```
- Terraform AWS modules: `terraform-aws-modules/ecs/aws`, `terraform-aws-modules/autoscaling/aws`
  Ensure these are referenced in your Terraform configurations.

## Installation & Usage

### Terraform

1. Navigate to the Terraform directory:
   ```bash
   cd terraform
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Apply the Terraform configurations:
   ```bash
   terraform apply
   ```

4. To destroy the infrastructure when it's no longer needed:
   ```bash
   terraform destroy
   ```

### Ansible

1. Navigate to the Ansible directory:
   ```bash
   cd ansible
   ```

2. Run the playbook to configure the LAMP stack on AWS ECS instances:
   ```bash
   ansible-playbook -i hosts playbook.yml
   ```

This guide provides a comprehensive overview of setting up a LAMP stack on AWS ECS using Terraform and Ansible. By following these steps, you can ensure a scalable and maintainable infrastructure that leverages the best practices for cloud resource management and configuration.
