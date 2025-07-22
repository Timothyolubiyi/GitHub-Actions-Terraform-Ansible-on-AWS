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
<img width="1700" height="810" alt="Image" src="https://github.com/user-attachments/assets/49519d94-d848-4029-8b6a-83ac2921695e" />

<img width="1909" height="595" alt="Image" src="https://github.com/user-attachments/assets/e66f6e13-5b85-46e8-8a90-114c3509ae6c" />

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

<img width="1857" height="754" alt="Image" src="https://github.com/user-attachments/assets/6fdabbcc-22a3-4dc6-9557-d7a598b0ec5e" />

Internet Gateway
<img width="1889" height="512" alt="Image" src="https://github.com/user-attachments/assets/89fb69b3-0928-46ea-bb2d-047b69023dd7" />

1 Route Table for Internet access
<img width="1901" height="699" alt="Image" src="https://github.com/user-attachments/assets/09a40bbf-b272-4554-8821-154da71dc5e5" />

2 EC2 Instances
<img width="1894" height="502" alt="Image" src="https://github.com/user-attachments/assets/66de22fe-365a-4ad0-bad5-d4bd60efa471" />

Public IPs assigned for Jenkins Server
jenkins_server_public_ip = "16.171.60.52"
<img width="1890" height="719" alt="Image" src="https://github.com/user-attachments/assets/7d61efa7-0ba7-4918-a9eb-e6e69154b87f" />

Public IPs assigned for Ansible Controller
ansible_controller_public_ip = "56.228.17.254"
<img width="1888" height="735" alt="Image" src="https://github.com/user-attachments/assets/35b76801-4d78-417c-a8c3-8cae22424428" />

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

![Image](https://github.com/user-attachments/assets/8ec344ad-b398-4545-8375-40285c152ab6)

<img width="1869" height="823" alt="Image" src="https://github.com/user-attachments/assets/9a166aa7-c283-42d7-aae8-add8176c12ae" />

Jenkins deployed and is ready to access via browser on port 8080 of the EC2 public IP.