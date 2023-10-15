#!/bin/bash

# Install script for LlamaPrint

script_path="$(dirname "$0")/llamaPrint.sh"

# Check if llamaPrint.sh exists at the determined path
if [ ! -f "$script_path" ]; then
    echo "Error: No llamaPrint.sh found at $script_path"
    exit 1
fi

# Determine the shell and the profile file
shell="$(basename "$SHELL")"
profile_file=""

case "$shell" in
    bash) profile_file="$HOME/.bashrc" ;;
    zsh) profile_file="$HOME/.zshrc" ;;
    *) 
        echo "Unsupported shell: $shell"
        echo "Please add the following line to your shell profile file manually:"
        echo "alias llama_print='bash $script_path'"
        exit 1
        ;;
esac

# Add the alias to the profile file
echo "alias llama_print='bash $script_path'" >> "$profile_file"

# Inform the user
echo "LlamaPrint has been installed. Restart your terminal or run 'source $profile_file' to start using it."
