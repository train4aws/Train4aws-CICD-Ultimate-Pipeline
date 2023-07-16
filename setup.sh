#!/bin/bash

# Update package list
sudo apt update -y

# Install OpenJDK 11
sudo apt install openjdk-11-jre -y

# Add Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository to sources.list
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list again
sudo apt-get update -y

# Install Jenkins
sudo apt-get install jenkins -y

# Update package list again
sudo apt update -y

# Install Docker
sudo apt install docker.io -y

# Add Jenkins and Ubuntu users to the docker group
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu

# Restart Docker service
sudo systemctl restart docker

# Switch to the docker group
newgrp docker

# Restart Jenkins service
sudo systemctl restart jenkins
