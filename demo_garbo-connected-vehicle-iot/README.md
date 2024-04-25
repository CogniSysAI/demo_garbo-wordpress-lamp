## README.md

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
   