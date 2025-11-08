#!/usr/bin/env bash
# Dieses Skript installiert das neueste Gemini CLI-Tool auf Ubuntu
# Voraussetzungen: sudo-Rechte und Internetverbindung
 
set -e  # stoppt das Skript bei Fehlern
 
echo "🚀 Starte Installation des Gemini CLI..."
 
# 1️⃣ System aktualisieren
echo "🔄 Aktualisiere Paketquellen..."
sudo apt update -y
 
# 2️⃣ Node.js und npm installieren (LTS-Version)
if ! command -v node &>/dev/null; then
  echo "📦 Installiere Node.js (LTS) und npm..."
  sudo apt install -y curl
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install -y nodejs
else
  echo "✅ Node.js ist bereits installiert: $(node -v)"
fi
 
# 3️⃣ npm aktualisieren
echo "🔄 Aktualisiere npm..."
sudo npm install -g npm
 
# 4️⃣ Gemini CLI installieren oder aktualisieren
echo "🌟 Installiere/aktualisiere Gemini CLI..."
sudo npm install -g @google/gemini-cli
 
# 5️⃣ Überprüfung
echo "✅ Überprüfe Installation..."
gemini --version || echo "⚠️ Konnte gemini CLI-Version nicht abrufen."
 
echo ""
echo "🎉 Installation abgeschlossen!"
echo "Du kannst jetzt das Gemini CLI verwenden mit:"
echo "    gemini --help"
