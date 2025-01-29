#!/bin/bash

echo "Updating package list..."
sudo apt-get update -y
echo "Installing MySQL server..."
sudo apt-get install -y mysql-server
echo "Starting MySQL service..."
sudo systemctl start mysql


echo "Enabling MySQL to start on boot..."
sudo systemctl enable mysql


echo "Checking MySQL server status..."
mysql_status=$(sudo systemctl status mysql | grep "Active:")

if [[ $mysql_status == *"active (running)"* ]]; then
    echo "MySQL server installed and running successfully"
else
    echo "MySQL installation or service start failed."
fi
