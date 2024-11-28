#!/bin/bash

# Check if exactly one directory argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 directory_path"
    exit 1
fi

# Assign the directory argument to a variable
dir="$1"

# Check if the argument is a valid directory
if [ ! -d "$dir" ]; then
    echo "Error: $dir is not a valid directory."
    exit 1
fi

# Process all files in the directory
for file in "$dir"/*; do
    # Skip if not a file
    [ -f "$file" ] || continue

    # Get the file name without the path
    base_name=$(basename "$file")

    # Remove IMG or PANO at the beginning of the file name
    new_name=$(echo "$base_name" | sed -E 's/^(IMG|PANO)//')

    # Skip renaming if the name remains the same
    if [ "$base_name" = "$new_name" ]; then
        continue
    fi

    # Rename the file
    mv "$file" "$dir/$new_name"
    echo "Renamed: $base_name -> $new_name"
done
