#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Anoushka Bakshi
# Course: Open Source Software
# Purpose: Checks if a package is installed and provides a philosophical note.

# For Kali Linux, the kernel metapackage is usually linux-image-amd64
PACKAGE="linux-image-amd64" 

echo "Inspecting system for package: $PACKAGE..."
echo "----------------------------------------"

# Check if package is installed using dpkg -l 
# Redirecting output to /dev/null for a clean 'silent' check 
if dpkg -l "$PACKAGE" &> /dev/null; then
    echo "[SUCCESS] $PACKAGE is installed on this system." [cite: 138]
    
    # Extract version details using awk [cite: 148]
    # We use grep '^ii' to ensure we only look at 'installed' status lines
    VERSION=$(dpkg -l "$PACKAGE" | grep '^ii' | awk '{print $3}')
    echo "Version : $VERSION" [cite: 139]
else
    echo "[WARNING] $PACKAGE is NOT installed." [cite: 140]
    echo "Hint: You can install it using 'sudo apt install $PACKAGE'"
fi

echo "----------------------------------------"
echo "Philosophical Note:"

# Case statement for conditional branching [cite: 141]
case "$PACKAGE" in
    "linux-image-amd64" | "linux-image-generic" | "linux")
        echo "Linux: Torvalds' hobby project that democratized computing." [cite: 141]
        ;;
    "apache2" | "httpd")
        echo "Apache: The web server that built the open internet." [cite: 143]
        ;;
    "mysql-server" | "mariadb-server")
        echo "MySQL/MariaDB: Open source at the heart of millions of apps." 
        ;;
    "gcc")
        echo "GCC: The compiler that built the open source world." [cite: 75]
        ;;
    "nmap")
        echo "Nmap: The 'Eyes of the Network' - essential for security auditing."
        ;;
    *)
        echo "A tool shared freely by the FOSS community." [cite: 10]
        ;;
esac
echo "----------------------------------------"