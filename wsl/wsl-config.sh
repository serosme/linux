#!/bin/bash

# Configuration to be added
CONFIG="[interop]
enabled=false
appendWindowsPath=false
"

# Clear screen
clear

# Display current file content (if exists)
if [ -f "/etc/wsl.conf" ]; then
    echo "Current /etc/wsl.conf content:"
    echo
    cat /etc/wsl.conf
    echo
fi

# Ask for user confirmation
read -p "Add configuration to /etc/wsl.conf? (y/N): " -r response < /dev/tty

case ${response,,} in
    y|yes)
        clear
        echo "$CONFIG" | sudo tee -a /etc/wsl.conf > /dev/null
        echo "Configuration added. Updated /etc/wsl.conf content:"
        echo
        cat /etc/wsl.conf
        ;;
    *)
        clear
        echo "Cancelled."
        ;;
esac
