#!/bin/bash

# Bash strict mode
set -e

# Clear screen
clear

# Replace mirror
sudo tee /etc/apt/sources.list.d/debian.sources > /dev/null << 'EOF'
Types: deb
URIs: http://mirrors.ustc.edu.cn/debian
Suites: bookworm bookworm-updates
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb
URIs: http://mirrors.ustc.edu.cn/debian-security
Suites: bookworm-security
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF

echo "Mirror replaced. Current sources:"
echo
cat /etc/apt/sources.list.d/debian.sources

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
