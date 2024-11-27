#!/bin/bash
# This won't cause an error.
echo "Line 3 -> The value is: $undefined_var"  

set -u
# This will cause an error.
echo "Line 7 -> The value is: $undefined_var"  