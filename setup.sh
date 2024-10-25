#!/bin/bash

# Get the directory of the current script
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create symlink for Alacritty config
ln -s "$DOTFILES_DIR/alacritty.toml" ~/.config/alacritty/alacritty.toml

# Create symlink for Zsh configuration files
ln -s "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -s "$DOTFILES_DIR/zsh/aliases.zsh" ~/.aliases

echo "Symbolic links created for Alacritty, .zshrc, and .aliases."

# How to run
# chmod +x setup.sh  # Make the script executable
# ./setup.sh
