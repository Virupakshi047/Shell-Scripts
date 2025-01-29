# Shell-Scripts

This repository contains various Bash scripts for basic operations and system setup.

## Scripts

### 1. add_numbers.sh
- Prompts the user to enter two numbers and calculates their sum.
```bash
echo "Enter number a"
read a
echo "Enter number b"
read b
c=$((a+b))
echo "$a + $b = $c"
```

### 2. install_docker.sh
- Updates the package list and installs Docker.
- Verifies if Docker was installed successfully.
```bash
#!/bin/bash

echo "Updating package list..."
sudo apt-get update -y

echo "Installing Docker..."
sudo apt-get install -y docker.io

echo "Checking Docker version..."
docker_version=$(docker --version)

if [[ $docker_version == "Docker"* ]]; then
    echo "Docker installed successfully: $docker_version"
else
    echo "Docker installation failed."
fi
```

### 3. install_mysql.sh
- Updates the package list and installs MySQL.
- Starts and enables the MySQL service.
- Checks if MySQL is running successfully.
```bash
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
```

### 4. file_checker.sh
- Checks for `.txt` and `.c` files in the current directory.
- If none exist, creates dummy files and lists them.
```bash
#!/bin/bash

files=$(ls *.txt *.c 2>/dev/null)

if [ -z "$files" ]; then
    echo "No .txt or .c files found. Creating dummy files..."
    touch file1.txt file2.txt file1.c file2.c
    files=$(ls *.txt *.c)
fi

echo "List of .txt and .c files:"
echo "$files"
