#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "📦 Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

echo "☕ Installing Java (Jenkins dependency)..."
sudo apt install -y openjdk-17-jdk

echo "🔑 Adding Jenkins repository key..."
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "📦 Adding Jenkins package repository..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "🔄 Updating apt cache..."
sudo apt update -y

echo "🚀 Installing Jenkins..."
sudo apt install -y jenkins

echo "🟢 Starting and enabling Jenkins service..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "✅ Jenkins installation complete."
echo "🔐 Fetching initial admin password..."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
