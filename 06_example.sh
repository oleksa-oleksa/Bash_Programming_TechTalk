#!/bin/bash

# Check if at least one argument is provided
[ "$#" -eq 0 ] && echo "Usage: $0 dir1 [dir2 ...]" && exit 1

log_file="$1/process_$$_$!.log"

# Log the current script name and number of arguments
echo "Running $0 with $# arguments" > "$log_file"

for d in "$@"; do
    if [ -d "$d" ]; then
        # Count files in the directory
        count=$(ls -1 "$d" 2>/dev/null | wc -l)
        echo "Directory $d: $count files" >> "$log_file"
    else
        echo "$d is not a directory!" >> "$log_file"
    fi
done

echo "Log file: $log_file"
