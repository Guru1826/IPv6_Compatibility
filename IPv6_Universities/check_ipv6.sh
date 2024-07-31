#!/bin/bash

# Define the file containing the list of websites
websites_file="websites.txt"

# Check if the file exists
if [ ! -f "$websites_file" ]; then
    echo "Error: File $websites_file not found."
    exit 1
fi

# Loop over every command
while IFS= read -r website; do
    # Command to get output of AAAA records
    output=$(host -t AAAA "$website")

    # Check if the output contains a fully compatible IPv6 address and exclude IPv4-Embedded IPv6 addresses
    if echo "$output" | grep -q "IPv6 address" && ! echo "$output" | grep -Eq "64:ff9b::|64:ff9b::\S*ipv4\S*"; then
        # print the IPv6 address
        ipv6_address=$(echo "$output" | grep "IPv6 address" | awk '{print $5}')
        echo "$website: Yes, IPv6 Address: $ipv6_address"
        echo   
    fi
done < "$websites_file"

