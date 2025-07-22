# 📦 Project Title:
Automated Jenkins Deployment with Terraform, Ansible, and GitHub Actions on AWS

# 📝 Project Description:
This project automates the deployment of a Jenkins CI/CD server on AWS using Infrastructure as Code (IaC) and configuration management tools. The workflow leverages GitHub Actions, Terraform, and Ansible to achieve full automation from infrastructure provisioning to software configuration.

# 🚀 Key Components:
🔧 Terraform
Provisions a custom VPC with 3 public subnets, Internet Gateway, and route tables.

# Creates two EC2 instances:

Ansible Controller: Manages configuration tasks.

Remote Server: Target server for Jenkins installation.

Configures Security Groups for SSH and Jenkins web access.

# 🔄 GitHub Actions
Runs Terraform commands (init, plan, apply) automatically on code push.

Dynamically generates Ansible inventory from Terraform outputs.

Triggers Ansible to configure the remote server.

Repository Environment Secret:

# AWS_ACCESS_KEY_ID

AWS_REGION

AWS_SECRET_ACCESS_KEY

<img width="1353" height="458" alt="Image" src="https://github.com/user-attachments/assets/ce8675b7-66df-4254-9b5a-1e5983a40010" />

# 🧰 Ansible
Connects to the target EC2 instance (Jenkins server).

Installs dependencies (Java), adds Jenkins repo and key.

Installs Jenkins and ensures the service is running.

# 🌐 AWS Architecture Overview:
VPC (10.0.0.0/16)

3 Public Subnets

Internet Gateway

1 Route Table for Internet access

2 EC2 Instances

Public IPs assigned

Security Group allows:

SSH (port 22)

Jenkins HTTP access (port 8080)

# ⚙️ Automation Pipeline:
yaml
Copy
Edit
GitHub → GitHub Actions → Terraform → AWS → Ansible → Jenkins Installed
📁 File Structure:
bash
Copy
Edit
/
├── main.tf                 # EC2 instances
├── vpc.tf                  # VPC + Subnets + Routes
├── security.tf             # Security group
├── variables.tf
├── outputs.tf
├── terraform.tfvars        # Key name input
├── playbooks/
│   └── jenkins.yml         # Ansible playbook
└── .github/
    └── workflows/
        └── deploy.yml      # GitHub Actions pipeline
✅ Outcome:
Once pushed to GitHub:

Infrastructure is automatically created in AWS.

Ansible automatically configures the Jenkins server.

Jenkins is ready to access via browser on port 8080 of the EC2 public IP.