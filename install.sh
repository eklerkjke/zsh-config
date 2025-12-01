#!/usr/bin/env bash

set -e

echo "[1/5] Updating packages..."
sudo apt update -y

echo "[2/5] Installing Zsh, Git, Curl..."
sudo apt install -y zsh git curl

echo "[3/5] Installing Oh My Zsh (unattended)..."
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "[4/5] Downloading and extracting your Zsh config..."
TMPFILE="/tmp/zsh-config.tar.gz"
curl -fsSL https://raw.githubusercontent.com/eklerkjke/zsh-config/refs/heads/main/zsh-config.tar.gz -o "$TMPFILE"
tar -xzf "$TMPFILE" -C "$HOME"

echo "[5/5] Setting Zsh as default shell..."
chsh -s "$(which zsh)"

echo "Done! Restart your terminal or reconnect via SSH to load Zsh."
