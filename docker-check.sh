#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt-get update -y

# Install Docker
echo "Installing Docker..."
sudo apt-get install -y docker.io

# Check if Docker was installed successfully
echo "Checking Docker version..."
docker_version=$(docker --version)

if [[ $docker_version == "Docker"* ]]; then
    echo "Docker installed successfully: $docker_version"
else
    echo "Docker installation failed."
fi
