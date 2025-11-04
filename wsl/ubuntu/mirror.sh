#!/bin/bash

# Clear screen
clear

# Replace mirror
sudo tee /etc/apt/sources.list.d/ubuntu.sources > /dev/null << 'EOF'
Types: deb
URIs: https://mirrors.ustc.edu.cn/ubuntu
Suites: noble noble-updates noble-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

Types: deb
URIs: https://mirrors.ustc.edu.cn/ubuntu
Suites: noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF

echo "Mirror replaced. Current sources:"
echo
cat /etc/apt/sources.list.d/ubuntu.sources

# Update and upgrade
echo
read -p "Execute 'apt update' and 'apt upgrade'? (y/N): " -r response < /dev/tty
case ${response,,} in
    y)
        sudo sudo apt update && sudo apt upgrade -y
        ;;
    *)
        echo "Skipped update and upgrade."
        ;;
esac
