#!/bin/bash

# Install script for LlamaPrint

script_name="llamaPrint.sh"
hidden_dir="$HOME/.llama_print"
script_path="$hidden_dir/$script_name"

# Create hidden directory in home if it doesn't exist
mkdir -p "$hidden_dir"

# Copy llamaPrint.sh to the hidden directory
cp "$(dirname "$0")/$script_name" "$script_path"

# Check if llamaPrint.sh exists at the copied path
if [ ! -f "$script_path" ]; then
    echo "Error: Failed to copy $script_name to $script_path"
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

# Check if alias already exists in the profile file
if grep -q "alias llama_print=" "$profile_file"; then
    # Update the existing alias
    sed -i.bak "s|alias llama_print=.*|alias llama_print='bash $script_path'|" "$profile_file"
    rm "$profile_file.bak"
else
    # Add the alias to the profile file
    echo "alias llama_print='bash $script_path'" >> "$profile_file"
fi

# Inform the user
echo "LlamaPrint has been installed. Restart your terminal or run 'source $profile_file' to start using it."
