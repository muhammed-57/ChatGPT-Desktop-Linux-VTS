#!/bin/bash

echo "Installing ChatGPT Desktop (Vishwanath Tec Systems)..."

mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/icons

# Copy icon and .desktop entry
cp chatgpt.png ~/.local/share/icons/chatgpt.png
cp chatgpt.desktop ~/.local/share/applications/chatgpt.desktop

# Copy launcher to PATH
sudo cp chatgpt-launcher /usr/local/bin/chatgpt-launcher

update-desktop-database ~/.local/share/applications

echo "✅ Installation complete."
echo "Search for 'ChatGPT Desktop' in your application menu."
