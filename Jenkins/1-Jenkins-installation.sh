#This script installs and runs jenkins from an ec2 server
#Before executing the file give execution permission by 'chmod +x jenkins-installation.sh'
#Md. Raihanul Islam Bhuiyan

#!/bin/bash


set -e


echo "Installing java"
sudo apt update
sudo apt install -y fontconfig openjdk-21-jre
java -version


echo "Installing jenkins"
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install -y jenkins


echo "Enabling jenkins"
sudo systemctl enable jenkins


echo "Start jenkins"
sudo systemctl start jenkins


echo "Checking status"
sudo systemctl is-active jenkins
sudo systemctl is-enabled jenkins:


echo "Jenkins installed successfully!"

echo "Initial admin password:"
echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"

echo "Open:"
echo "http://15.207.45.22:8080/"
