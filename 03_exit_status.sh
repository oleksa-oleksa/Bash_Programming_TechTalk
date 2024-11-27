#!/bin/bash
cp file1.txt file2.txt

# Capture the exit status of the last command
exit_status=$?

# Use the stored exit status later in the script
if [ $exit_status -ne 0 ]; then
  echo "Error: The last command failed with exit status $exit_status."
else
  echo "The last command succeeded with exit status $exit_status."
fi
