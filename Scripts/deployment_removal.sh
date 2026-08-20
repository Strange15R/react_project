# This script removes the entire deployment and all its dependencies. 

#!/bin/bash


echo"Stopping nginx"
sudo systemctl stop nginx

echo"Removing project"
sudo rm -rf /var/www/react_project

echo"Removing deployment"
sudo rm -rf /var/www/html/*

echo"Removing nginx"
sudo apt purge nginx nginx-common -y

echo"Removing node.js"
sudo apt purge nodejs -y

echo"Removing git"
sudo apt purge git -y



echo "Cleanup complete!"
