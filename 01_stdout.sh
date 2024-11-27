#!/bin/bash
echo "This is stdout, you see it in the terminal window!"

# Redirect stdout to a file
echo "Let's write a first line to the file" > output.txt

# Append stdout to a file
echo "And another line so that the previous line is kept in the file!" >> output.txt
