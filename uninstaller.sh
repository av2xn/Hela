#!/bin/bash

echo "[*] Uninstalling Hela Flash Tool..."

# 1. Stop and disable user service
systemctl --user stop hela-watchdog.service 2>/dev/null
systemctl --user disable hela-watchdog.service 2>/dev/null
rm -rf ~/.config/systemd/user/hela-watchdog.service
rm -rf ~/.local/bin/hela-watchdog.sh

# 2. Reload systemd user
systemctl --user daemon-reload 2>/dev/null
systemctl --user reset-failed 2>/dev/null

# 3. Remove hela binary with sudo
echo "[*] Removing hela binary: /usr/local/bin/hela"
sudo rm -rf /usr/local/bin/hela*

# 4. Remove tmp files
echo "[*] Removing temporary files..."
sudo rm -rf /tmp/hela_*

# 5. Confirm
echo "[+] Hela has been completely uninstalled."
