#!/bin/bash

set -e  # Stop on errors

# ========== CONFIG ==========
REPO_DIR="$HOME/setup"
TMUX_CONF="$REPO_DIR/tmux/.tmux.conf"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip"
FONTS_DIR="$HOME/.local/share/fonts"
# =============================

echo "🚀 Starting setup..."

# 1. Install tmux
echo "📦 Installing tmux..."
sudo apt update && sudo apt install -y tmux unzip wget

# 2. Symlink .tmux.conf
echo "🔗 Linking .tmux.conf..."
ln -sf "$TMUX_CONF" "$HOME/.tmux.conf"

# 3. Install TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "🌐 Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo "✅ TPM already installed."
fi

# 4. Install Nerd Font (Hack)
if [ ! -f "$FONTS_DIR/Hack Regular Nerd Font Complete.ttf" ]; then
  echo "🎨 Installing Hack Nerd Font..."
  mkdir -p "$FONTS_DIR"
  cd "$FONTS_DIR"
  wget -O Hack.zip "$NERD_FONT_URL"
  unzip Hack.zip
  rm Hack.zip
  fc-cache -fv
else
  echo "✅ Nerd Font already installed."
fi

# 5. Final instructions
echo -e "\n✅ Done! Final steps:"
echo "  1. Open a new terminal"
echo "  2. Start tmux: tmux"
echo "  3. Press Ctrl + Space (prefix), then Shift + I to install plugins"
echo "  4. Set your terminal font to 'Hack Nerd Font' in preferences"


