#!/bin/bash

# Define the trap for cleaning up when the script exits
trap 'echo "Cleaning up..."; rm -f tempfile; echo "Cleanup completed!"' EXIT
echo "Starting script... Creating a temporary file."

# Create a temporary file
touch tempfile
echo "Temporary file created at tempfile"
# Simulate some processing
echo "Processing..."

# Loop to keep the script running until 'exit' is typed
while true; do
  # Read user input
  read -p "Type 'exit' to terminate the script: " user_input

  if [ "$user_input" == "exit" ]; then
    echo "User requested to exit. Exiting now."
    exit 0  # This will trigger the trap and clean up the tempfile
  else
    echo "You typed: $user_input"
  fi
done
