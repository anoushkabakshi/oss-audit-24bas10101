#!/bin/bash
# Script 1: System Identity Report
# Author: Anoushka Bakshi
# Course: Open Source Software
# Purpose: Displays a welcome dashboard with system details.

# --- Variables [cite: 105, 106, 107]
STUDENT_NAME="Anoushka Bakshi"
SOFTWARE_CHOICE="Linux Kernel"

# --- System info captured via command substitution [cite: 99, 110, 111]
# uname -r gets the kernel version [cite: 110]
KERNEL=$(uname -r)
# whoami captures the current logged-in user [cite: 110]
USER_NAME=$(whoami)
# uptime -p provides a "pretty" version of system uptime [cite: 111]
UPTIME=$(uptime -p)
# Captures the home directory dynamically for the current user [cite: 96]
USER_HOME=$HOME
# Extracts the OS name from the standard os-release file 
DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d'=' -f2 | tr -d '"')
# Formats the current date and time [cite: 97]
DATE_TIME=$(date '+%A, %d %B %Y | %H:%M:%S')

# --- Display [cite: 113, 114, 117]
echo "======================================"
echo "         Open Source Audit            "
echo "======================================"
echo "Student : $STUDENT_NAME"
echo "Target  : $SOFTWARE_CHOICE"
echo "--------------------------------------"
echo "Distro  : $DISTRO"
echo "Kernel  : $KERNEL"
echo "User    : $USER_NAME"
echo "Home    : $USER_HOME"
echo "Uptime  : $UPTIME"
echo "Date    : $DATE_TIME"
echo "--------------------------------------"
# Message regarding the open-source license [cite: 98]
echo "License Note: The Linux Kernel is licensed"
echo "under the GNU GPL v2, ensuring freedom to"
echo "run, study, share, and modify."
echo "======================================"