#!/bin/bash

# Check for .txt and .c files
files=$(ls *.txt *.c 2>/dev/null)

if [ -z "$files" ]; then
    echo "No .txt or .c files found. Creating dummy files..."
    touch file1.txt file2.txt file1.c file2.c
    files=$(ls *.txt *.c)
fi

# Print the found or created files
echo "List of .txt and .c files:"
echo "$files"
