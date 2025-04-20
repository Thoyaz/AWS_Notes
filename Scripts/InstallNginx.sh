#!/bin/bash

# Update package list
sudo apt update

# Install Nginx
sudo apt install -y nginx

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Print status
echo "Nginx has been installed, started, and enabled on boot."
sudo systemctl status nginx | grep Active
echo "You can access Nginx at http://localhost or http://your_server_ip"
