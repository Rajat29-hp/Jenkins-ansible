#!bin/bash

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload

# Start the service
sudo systemctl enable jenkins
sudo systemctl start jenkins

#firewall configuration
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload