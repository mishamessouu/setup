#!/bin/bash

set -e  # Exit on error

# ---------- CONFIG ----------
REPO_DIR="$HOME/setup"
ZSH_CONF="$REPO_DIR/zsh/.zshrc"
ZSH_CUSTOM="$REPO_DIR/zsh/oh-my-zsh/custom"
P10K_DIR="$REPO_DIR/zsh/powerlevel10k"
OMZ_DIR="$REPO_DIR/zsh/oh-my-zsh"
# ----------------------------

echo "Setting up Zsh environment..."

# 1. Install zsh if needed
if ! command -v zsh &> /dev/null; then
  echo "Installing zsh..."
  sudo apt update && sudo apt install -y zsh
else
  echo "Zsh is already installed."
fi

# 2. Set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Changing default shell to zsh"
  chsh -s "$(which zsh)"
else
  echo "Default shell is already zsh."
fi

# 3. Symlink .zshrc
echo "Linking .zshrc..."
ln -sf "$ZSH_CONF" "$HOME/.zshrc"

# 4. Ensure Oh My Zsh submodule is initialized
if [ ! -d "$OMZ_DIR" ]; then
  echo "ERROR: Oh My Zsh not found in $OMZ_DIR"
  echo "Hint: Run 'git submodule update --init --recursive'"
  exit 1
fi

# 5. Ensure Powerlevel10k submodule is initialized
if [ ! -d "$P10K_DIR" ]; then
  echo "ERROR: Powerlevel10k not found in $P10K_DIR"
  echo "Hint: Run 'git submodule update --init --recursive'"
  exit 1
fi

echo "Zsh setup complete."
echo
echo "You can now open a new terminal or run 'exec zsh' to start using zsh."
