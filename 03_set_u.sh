#!/bin/bash
set -e
# If cp command fails, the script stops.
cp file1.txt file2.txt  
echo "This line won't be printed"
