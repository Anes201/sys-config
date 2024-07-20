#!/bin/bash

# Path to the .bash_aliases file
aliases_file="$HOME/.bash_aliases"

# Common directory path
common_dir="$HOME"

# Define the lines you want to add to the .bash_aliases file
lines_to_add=(
"# aliases"
"alias i='sudo apt install'"
"alias u='sudo apt update && sudo apt upgrade'"
"alias x='exit'"
""
"alias ytd='$common_dir/ytd.sh'"
"alias sysfetch='$common_dir/sysfetch.sh'"
""
"alias cimg='convert -resize 50% -quality 85'"
)

# Check if the .bash_aliases file exists; if not, create it
if [ ! -f "$aliases_file" ]; then
    touch "$aliases_file"
fi

# Function to check if a line exists in the .bash_aliases file
line_exists() {
    local line_to_check="$1"
    grep -qFx "$line_to_check" "$aliases_file"
}

# Append the lines to the .bash_aliases file, but only if they don't already exist
for line in "${lines_to_add[@]}"; do
    if ! line_exists "$line"; then
        echo "$line" >> "$aliases_file"
        echo "Added: $line"
    else
        echo "Skipped (already exists): $line"
    fi
done

source "$aliases_file"
exec "$SHELL"
echo "Lines added to $aliases_file."
