# LlamaPrint

LlamaPrint is a command-line utility that recursively searches a specified directory, printing the text content of files. It provides options to include or exclude files based on glob patterns and has the ability to follow symbolic links.

## Usage

```bash
llamaprint [path] --include [include] --exclude [exclude] --follow-links
```

- `path`: The path to search. Default is the current directory.
- `include`: A glob pattern to include files. Default is `*` (all files).
- `exclude`: A glob pattern to exclude files. No default value.
- `--follow-links`: An optional flag to follow symbolic links. Not enabled by default.

## Installation

### Prerequisites

Ensure that you have the necessary permissions to read the files and execute scripts in the specified path.

### Manual Installation

1. Download the `llamaPrint.sh` script.
2. Make it executable: `chmod +x path_to_script/llamaPrint.sh`
3. Move it to a directory in your PATH or add its location to PATH:
   - Move to a directory in PATH: `mv path_to_script/llamaPrint.sh /usr/local/bin/llamaprint`
   - Or, add script location to PATH: `export PATH=$PATH:path_to_script` (add this line to your shell profile file for permanent effect)
4. Now you can use `llamaprint` from any location in the terminal.

### Automated Installation

You can also use the provided `install.sh` script to install LlamaPrint as an alias in your shell profile. Simply run:

```bash
./install.sh path_to_script/llamaPrint.sh
```

## Note

Always test scripts in a safe environment before using them in production to ensure they behave as expected and do not cause data loss or other issues.
