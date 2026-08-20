#!/bin/bash

# Author: Raihanul Islam Bhuiyan
# Mail  : raihandmai@gmail.com
# This script updates the build without re-installing git, node & nginx.

set -e

# Variables

REPO_URL="https://github.com/Strange15R/react_project.git"
NGINX_DIR="/var/www/html"

###

echo "Updating the system"
apt update

echo "Cleaning previous version of the repository"
cd /var/www
rm -rf /var/www/react_project

echo "Cloning the new version of the repository from github"
git clone $REPO_URL

echo "Installing dependencies"
cd react_project
npm ci

echo "Building the application"
DISABLE_ESLINT_PLUGIN=true npm run build

echo "Cleaning the previous build from html"
rm -rf "$NGINX_ROOT"/*

echo "Transferring the new build to html"
cp -r build/* "$NGINX_ROOT"

echo "Restarting nginx"
systemctl restart nginx

echo "Deployment successful"

echo "Open:"
echo "http://15.207.45.22/"
