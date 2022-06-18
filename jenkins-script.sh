#!/bin/bash

# Hillary

# Date : 18-06-2022

# Script for installing a jenkins server

echo "Your jenkins server will be installed after runing these commands"

# Install Java

echo "Since Jenkins is a Java application, we first need to install java on the system"

 yum install java-1.8.0-openjdk-devel -y

 if
 [ $? -ne 0 ]

 then 
 echo "yum install java was unsuccessful. Please run the command below to install java"
 
exit 2
fi
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 

#  Disable key check on the repo, run:

sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

# Install the latest stable version of Jenkins
sudo yum install jenkins

# Start the service
sudo systemctl start jenkins

#Check the status with:
sudo systemctl status jenkins

# Enable the Jenkins service to start on system boot:
sudo systemctl enable jenkins 

# Adjust the firewall
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp 
sudo firewall-cmd --reload

# Open the jenkins page from the browser

echo "Type your IP address followed by the port number 8080"
http://your_ip_or_domain:8080

# Copy and paste the administrator password
echo "In your terminal, use the following command to print the Administrator password that was generated during jenkins installation" 
cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Copy the password and paste it into the Administrator password field in the page you have in the browser. Then click on Continue" 