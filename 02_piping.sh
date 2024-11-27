#!/bin/bash
find . -type f -name "*.txt" | xargs cat | tr -s '[:space:]' '\n' | grep -E '.{3,}' | sort | uniq -c | sort -nr | head -10
