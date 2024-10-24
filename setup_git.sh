#!/bin/bash

# Variables
DOTFILES_DIR="$HOME/personal-projects/dotfiles/git"
BACKUP_DIR="$HOME/personal-projects/dotfiles_backup/git_$(date +%Y%m%d_%H%M%S)"
FILES=(".gitconfig" ".gitconfig-work" ".gitconfig-personal")

# Create backup directory
mkdir -p "$BACKUP_DIR"

echo "Starting setup of Git configuration files..."

# Loop through each file
for file in "${FILES[@]}"; do
    SRC="$DOTFILES_DIR/$file"
    DEST="$HOME/$file"

    # Check if the source file exists
    if [ ! -f "$SRC" ]; then
        echo "Source file $SRC does not exist. Skipping..."
        continue
    fi

    # Backup existing file if it exists and is not a symlink
    if [ -e "$DEST" ] && [ ! -L "$DEST" ]; then
        echo "Backing up existing file $DEST to $BACKUP_DIR"
        mv "$DEST" "$BACKUP_DIR/"
    fi

    # Remove existing symlink or file if it exists
    if [ -L "$DEST" ]; then
        echo "Removing existing symlink $DEST"
        rm "$DEST"
    fi

    # Create the symlink
    echo "Creating symlink for $file"
    ln -s "$SRC" "$DEST"
done

echo "Git configuration files setup completed."

# How to run
# chmod +x setup_git.sh  # Make the script executable
# ./setup_git.sh
