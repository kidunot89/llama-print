#!/bin/bash

# Function to check if a file is a text file.
is_text_file() {
    file --mime-type "$1" | grep -q text
}

# Function to print the content of text files.
print_text_content() {
    if is_text_file "$1"; then
        echo "===== Content of: $1 ====="
        cat "$1"
        echo -e "\n===================================\n"
    fi
}

# Parse command-line arguments.
path=$(pwd)
include="*"
exclude=""
follow_symlinks=""
files_found=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --include) shift; include="$1";;
        --exclude) shift; exclude="$1";;
        --follow-links) follow_symlinks="-L";;
        *) path="$1";;
    esac
    shift
done

# Find all files that match the include glob, do not match the exclude glob,
# and are not in a .git, .github, node_modules, .next, .build, or vendor directory,
# and do not match common versioning file patterns.
# Then run the print_text_content function on them.
while IFS= read -r -d '' file; do
    files_found=true
    print_text_content "$file"
done < <(find $follow_symlinks "$path" \
    -type f \
    -name "$include" \
    ! -name "$exclude" \
    ! -path "*/.git/*" \
    ! -path "*/.github/*" \
    ! -path "*/node_modules/*" \
    ! -path "*/.next/*" \
    ! -path "*/.build/*" \
    ! -path "*/vendor/*" \
    ! -name ".gitignore" \
    ! -name ".gitattributes" \
    ! -name ".gitmodules" \
    ! -name "package-lock.json" \
    ! -name "composer.lock" \
    -print0)

# Check if no files were found and print an error message.
if [ "$files_found" != true ]; then
    echo "Error: No text files found in the specified path with the given criteria."
    exit 1
fi
