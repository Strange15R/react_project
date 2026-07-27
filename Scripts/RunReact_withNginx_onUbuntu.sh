#!/bin/bash

# Author: Raihanul Islam Bhuiyan 
# Email: raihandmail@gmail.com

set -e

echo "Updating system"
apt update


echo "Installing git & nginx"
apt install git nginx -y


echo "Installing & updating node.js"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
apt install -y nodejs


echo "Openning nginx directory"
cd /var/www


echo "Cloning the project repository"
rm -rf /var/www/react_project
git clone https://github.com/Strange15R/react_project.git


echo "Openning the project directory"
cd react_project
rm -rf node_modules


echo "Installing dependencies"
npm ci


echo "Building the app"
DISABLE_ESLINT_PLUGIN=true npm run build


echo "Move the  build to nginx directory to connect to the web"
rm -rf /var/www/html/*
mv build/* /var/www/html/


echo "Restart nginx"
systemctl restart nginx


echo "Deployment done"
echo "Visit to https://<user_IP>"

