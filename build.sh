#!/bin/bash

# Specify the base directory
BASE_DIR='./src'

# Loop over all directories in the base directory
for dir in $(find $BASE_DIR -type d); do
    # If a Dockerfile exists in the directory
    if [ -f $dir/Dockerfile ]; then
        # Extract the directory name
        dir_name=$(basename $dir)
        dir_name="${dir_name,,}"
        # Build the Docker image and tag it as latest
        echo "Building docker image for $dir_name..."
        docker build -t $dir_name:latest $dir 
    fi
done