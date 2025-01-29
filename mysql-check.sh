#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt-get update -y

# Install MySQL server
echo "Installing MySQL server..."
sudo apt-get install -y mysql-server

# Start MySQL service if it's not already running
echo "Starting MySQL service..."
sudo systemctl start mysql

# Enable MySQL service to start on boot
echo "Enabling MySQL to start on boot..."
sudo systemctl enable mysql

# Check MySQL server status
echo "Checking MySQL server status..."
mysql_status=$(sudo systemctl status mysql | grep "Active:")

if [[ $mysql_status == *"active (running)"* ]]; then
    echo "MySQL server installed and running successfully"
else
    echo "MySQL installation or service start failed."
fi
