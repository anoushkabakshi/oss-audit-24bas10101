#!/bin/bash
# Script 4: Log File Analyzer
# Author: Anoushka Bakshi
# Course: Open Source Software
# Purpose: Analyzes log files line-by-line using a while-read loop and counters.
# Usage: ./script4.sh /var/log/messages error

# --- Command line arguments with defaults
# $1: The log file to scan (Default: /var/log/messages for Kali/Debian)
# $2: The keyword to search for (Default: 'error')
LOGFILE=${1:-"/var/log/messages"}
KEYWORD=${2:-"error"}
COUNT=0

echo "======================================"
echo "         Log File Analyzer            "
echo "======================================"
echo "Target File : $LOGFILE"
echo "Search Term : '$KEYWORD'"
echo "--------------------------------------"

# --- File Validation
# Check if the file exists and is a regular file
if [ ! -f "$LOGFILE" ]; then
    echo "[!] Error: File $LOGFILE not found."
    echo "Usage: $0 <path_to_log> <keyword>"
    exit 1
fi

# Check if the file is empty using -s (size greater than zero)
if [ ! -s "$LOGFILE" ]; then
    echo "[!] Note: $LOGFILE exists but is currently empty."
    exit 0
fi

# --- Core Logic: Safe Line-by-Line Reading
# IFS= prevents leading/trailing whitespace from being trimmed
# -r prevents backslash escapes from being interpreted
while IFS= read -r LINE; do
    # Check if the line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Arithmetic expansion for the counter
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Result: Found '$KEYWORD' $COUNT times."
echo ""
echo "Last 5 matching occurrences:"
echo "--------------------------------------"
# Display the last 5 matching lines using tail as per project TODO 
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
echo "======================================"