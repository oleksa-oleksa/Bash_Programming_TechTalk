#!/bin/bash
source_dir=$1
backup_dir=$2
timestamp=$(date +%Y%m%d%H%M%S)

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Define the backup file name
backup_file="backup_$timestamp.tar.gz"

# Create the tarball (backup) file
tar -czvf "$backup_dir/$backup_file" "$source_dir"