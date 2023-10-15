#!/bin/bash

# Unit test for llamaPrint.sh

# Create a temporary directory for testing
test_dir=$(mktemp -d)

# Create test files
echo "This is a text file." > "$test_dir/test1.txt"
echo "This is another text file." > "$test_dir/test2.txt"
touch "$test_dir/test3.bin"

# Path to llamaPrint.sh
llama_print_path="./llamaPrint.sh"

# Run llamaPrint.sh and capture the output
output=$("$llama_print_path" "$test_dir" --include "*.txt")

# Clean up
rm -r "$test_dir"

# Check the output
if [[ "$output" == *"test1.txt"* && "$output" == *"test2.txt"* && ! "$output" == *"test3.bin"* ]]; then
    echo "Test passed: llamaPrint.sh correctly identified and printed the text files."
else
    echo "Test failed: llamaPrint.sh did not produce the expected output."
    exit 1
fi
