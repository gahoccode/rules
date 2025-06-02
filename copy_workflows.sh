#!/bin/bash

# Define source and destination paths
SOURCE_DIR=~/Projects/rules/.windsurf/workflows
DEST_DIR=./windsurf/workflows

# Check if destination directory exists, if not create it
if [ ! -d "$DEST_DIR" ]; then
    echo "Creating destination directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

# Copy files from source to destination
echo "Copying workflow files from $SOURCE_DIR to $DEST_DIR"
cp -r "$SOURCE_DIR"/* "$DEST_DIR"/

echo "Workflow files copied successfully!"
