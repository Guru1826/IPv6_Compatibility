#!/bin/bash

# Define the file containing the list of URLs
urls_file="o8.txt"

# Check if the file exists
if [ ! -f "$urls_file" ]; then
    echo "Error: File $urls_file not found."
    exit 1
fi

# Count the number of empty lines in the file
empty_lines=$(grep -c '^$' "$urls_file")

echo "Total number of empty lines: $empty_lines"
