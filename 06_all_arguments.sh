#!/bin/bash
echo "Using \$@:"
for arg in "$@"; do
    echo "$arg"
done

echo "\n"

echo "Using \$*:"
for arg in "$*"; do
    echo "$arg"
done
