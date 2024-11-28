#!/bin/bash

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed."
    exit 1
fi

# List all S3 buckets
echo "Fetching list of S3 buckets..."
aws s3 ls

# Prompt user for bucket name and file to upload
read -p "Enter the bucket name: " bucket_name
read -p "Enter the file path to upload: " file_path

# Check if file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File $file_path does not exist."
    exit 1
fi

# Extract the file name from the file path
file_name=$(basename "$file_path")

# Upload the file to the specified S3 bucket
echo "Uploading $file_name to bucket $bucket_name..."
if aws s3 cp "$file_path" "s3://$bucket_name/$file_name"; then
    echo "Upload successful!"
    
    # Verify the file in the bucket
    echo "Verifying upload..."
    if aws s3 ls "s3://$bucket_name/$file_name" &> /dev/null; then
        echo "File $file_name exists in bucket $bucket_name."
    else
        echo "Error: File $file_name not found in bucket $bucket_name after upload."
    fi
else
    echo "Error: Failed to upload $file_name to bucket $bucket_name."
    exit 1
fi
