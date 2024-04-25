# Connected Vehicle Platform Deployment Guide

Welcome to the Connected Vehicle Platform project. This guide provides instructions on how to deploy and manage the infrastructure and application using Terraform and Ansible.

## Prerequisites

Before you begin, ensure you have the following installed on your system:
- Terraform (https://www.terraform.io/downloads.html)
- Ansible (https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- AWS CLI (https://aws.amazon.com/cli/) configured with at least one profile

## Project Structure

The project is structured as follows:
- `main.tf`, `variables.tf`, `provider.tf`, `outputs.tf`: Terraform configuration files for provisioning AWS resources.
- `ansible.cfg`: Configuration file for Ansible.
- `playbook.yml`: Main Ansible playbook that orchestrates the deployment of the application.
- `roles/`: Contains Ansible roles for deploying different components of the application.
- `docs/`: Documentation on security practices and usage instructions.

## Setup Instructions

1. **Configure AWS Credentials**: Make sure your AWS credentials are configured by running `aws configure`.

2. **Initialize Terraform**:
   Navigate to the project's root directory and run:
   ```
   terraform init
   ```
   This will initialize Terraform and download the necessary providers.

3. **Review Terraform Plan**:
   To see what resources Terraform will create, run:
   ```
   terraform plan
   ```
   Review the output to ensure everything is correct.

4. **Apply Terraform Configuration**:
   To provision the AWS resources, run:
   ```
   terraform apply
   ```
   Confirm the action by typing `yes` when prompted.

5. **Configure Ansible**:
   - Update the `ansible.cfg` file with the correct `private_key_file` and `remote_user` values.
   - Ensure the inventory file (`./inventory/hosts`) lists the correct hosts to deploy to.

6. **Run Ansible Playbook**:
   Execute the following command to deploy the application:
   ```
   ansible-playbook playbook.yml
   ```

## Managing Deployment

- **Updating Infrastructure**: To update the infrastructure after modifying Terraform configuration files, simply run `terraform apply` again.
- **Redeploying Application**: To redeploy the application with Ansible, run the playbook again with `ansible-playbook playbook.yml`.
- **Destroying Infrastructure**: To remove all AWS resources provisioned by Terraform, run:
  ```
  terraform destroy
  ```
  Confirm the action by typing `yes` when prompted.

## Security and Compliance

Refer to `docs/SECURITY.md` for information on security practices and SOC2 compliance measures implemented in this project.

## Usage

For instructions on how to use the deployed application, see `docs/USAGE.md`.

## Support

For support, please refer to the project's issue tracker or contact the project maintainers.

Thank you for using the Connected Vehicle Platform.
