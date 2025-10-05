#!/bin/bash

set -e

clear
echo "[*] Hela setup is starting..."

# Heimdall binary'si indiriliyor
echo "[*] Heimdall (Grimler version) downloading..."
wget -q --show-progress https://sourceforge.net/projects/custom-android-builds/files/tools/heimdall/heimdall -O heimdall
chmod +x heimdall
sudo mv heimdall /usr/local/bin/

# hela scripti kuruluyor
echo "[*] hela command setupping..."
sudo mv hela /usr/local/bin/hela 2>/dev/null || true
sudo chmod +x /usr/local/bin/hela

# Watchdog scripti oluşturuluyor
echo "[*] hela-watchdog.sh making..."
sudo tee /usr/local/bin/hela-watchdog.sh > /dev/null << 'EOF'
#!/bin/bash
while true; do
    if ! lsusb | grep -q "04e8.*Download mode"; then
        rm -f /tmp/hela_last_flash
    fi
    sleep 1
done
EOF
sudo chmod +x /usr/local/bin/hela-watchdog.sh

# Systemd servisi tanımlanıyor
echo "[*] hela-watchdog service applying..."
sudo tee /etc/systemd/system/hela-watchdog.service > /dev/null << EOF
[Unit]
Description=Hela Watchdog - USB connection contoller
After=multi-user.target

[Service]
ExecStart=/usr/local/bin/hela-watchdog.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Servis etkinleştiriliyor
echo "[*] Service starting..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable hela-watchdog.service > /dev/null
sudo systemctl start hela-watchdog.service

echo ""
echo "[✓] Kurulum tamamlandı. Artık 'hela' komutu her yerde çalışır ve Watchdog servisi aktiftir."
