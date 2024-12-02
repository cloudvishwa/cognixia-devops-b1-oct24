# Day 1: Setup and Preparation

## Preparation
- **Create Windows 11 Environment**:
  - Install and run all necessary commands.
  - Install the following tools:
    - WinSCP
    - Git Bash
    - Visual Studio Code or Visual Studio 2022
      - Ensure extensions for Azure, Docker, and Git are installed.
- **Azure Resource Setup**:
  - Create a Storage Account and Container to store the Terraform state file and other project-related data.
  - Create a Resource Group (RG), Virtual Network (VNet), and Subnet.

## Environment Setup
- **Terraform Setup**:
  - Install and configure Terraform on the Windows 11 environment.
  - Use Terraform to set up your local environment on a Linux VM.
- **Linux Agent Creation**:
  - Create a Linux VM using Rocky Linux.
    - Attach a 3GB volume for the working directory of Azure Pipeline jobs.
    - Add an entry in `/etc/fstab` to make the volume permanent.
    - Register the Linux VM as an agent in Azure DevOps.
    - Use a user data script to:
      - Install Ansible.
      - Test Ansible by executing a playbook against the VM's IP address.
- **Terraform Inputs**:
  - Define inputs for the Terraform setup:
    - `vnet-name`
    - `subnet-name`
    - `rg-name`
    - `vm-name`
    - `tags`

## Azure DevOps Pipeline for Infra-Setup
1. **Run Ansible Playbook**:
   - Use the pipeline to execute a playbook that installs the following tools on the Linux VM:
     - Maven (`mvn`)
     - `kubectl`
     - Docker
     - Docker Compose
     - JDK 17
     - Azure CLI (`az cli`)
2. **Infrastructure Provisioning**:
   - Use Terraform to:
     - Set up Azure Container Registry (ACR).
     - Create an Azure Kubernetes Service (AKS) cluster.
     - Configure Azure CLI for resource management.

## Branch Management Setup
- **Create an `infra-setup` Repository in Azure Repos**:
  - **Dev Branch**: For development deployment.
  - **Prod Branch**: For production deployment.
  - **Master Branch**: For stable code containing the latest release.
