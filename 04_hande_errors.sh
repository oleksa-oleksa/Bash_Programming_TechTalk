#!/bin/bash
error_exit() {
  echo "Error: $1" >&2
  exit 1
}

cp file1.txt file2.txt || error_exit "Failed to copy file."


cp file1.txt file2.txt 2>> error.log


mkdir /mydir && echo "Directory created." || echo "Failed to create directory."
