#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Anoushka Bakshi
# Course: Open Source Software
# Purpose: Uses a for loop to audit permissions and disk usage of critical system paths.

# Array of critical system directories, including paths relevant to the Linux Kernel
# $HOME is used to dynamically find your current user's directory on Kali
DIRS=("/etc" "/var/log" "$HOME" "/usr/bin" "/boot" "/lib/modules/$(uname -r)")

echo "======================================"
echo "      Directory Audit Report          "
echo "======================================"

# Loop through the bash array using the ${DIRS[@]} syntax
for DIR in "${DIRS[@]}"; do
    # Check if the directory exists using the -d flag
    if [ -d "$DIR" ]; then
        # Pull permissions, owner, and group from ls using awk 
        # $1=Permissions, $3=Owner, $4=Group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        
        # Capture human-readable size using du and cut to extract the first field [cite: 148, 157]
        # 2>/dev/null hides 'Permission Denied' errors for sensitive sub-folders
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "Path: $DIR"
        echo " -> Permissions & Owner: $PERMS"
        echo " -> Disk Usage         : $SIZE"
        echo "--------------------------------------"
    else
        echo "Path: $DIR"
        echo " -> [!] This directory does not exist on this system."
        echo "--------------------------------------"
    fi
done

# Section for software-specific config audit as per project requirements 
KERNEL_CONFIG="/boot/config-$(uname -r)"
echo "Checking Kernel Config File Permissions:"
if [ -f "$KERNEL_CONFIG" ]; then
    ls -l "$KERNEL_CONFIG" | awk '{print " -> File: "$9" | Perms: "$1" | Owner: "$3}'
else
    echo " -> [!] Kernel config not found in /boot."
fi
echo "======================================"