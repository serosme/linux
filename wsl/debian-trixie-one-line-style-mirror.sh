#!/bin/bash

# Bash strict mode
set -e

# Clear screen
clear

# Replace mirror
sudo tee /etc/apt/sources.list > /dev/null << 'EOF'
deb http://mirrors.ustc.edu.cn/debian/ trixie main contrib non-free non-free-firmware
deb http://mirrors.ustc.edu.cn/debian/ trixie-updates main contrib non-free non-free-firmware
deb http://mirrors.ustc.edu.cn/debian/ trixie-backports main contrib non-free non-free-firmware
deb http://mirrors.ustc.edu.cn/debian-security/ trixie-security main contrib non-free non-free-firmware
EOF

echo "Mirror replaced. Current sources:"
echo
cat /etc/apt/sources.list

# Update and upgrade
echo
read -p "Execute 'apt update' and 'apt upgrade'? (y/N): " -r response < /dev/tty
case ${response,,} in
    y)
        sudo apt update
        sudo apt upgrade -y
        ;;
    *)
        echo "Skipped update and upgrade."
        ;;
esac
