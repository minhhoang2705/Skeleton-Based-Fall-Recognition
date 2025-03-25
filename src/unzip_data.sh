#!/bin/bash

# Script to extract two zip files
# Usage: ./extract_zips.sh file1.zip file2.zip

# Check if two arguments were provided
if [ $# -ne 2 ]; then
    echo "Error: Please provide exactly two zip files to extract"
    echo "Usage: $0 file1.zip file2.zip"
    exit 1
fi

# Store arguments in variables
ZIP_FILE1="$1"
ZIP_FILE2="$2"

# Check if files exist
if [ ! -f "$ZIP_FILE1" ]; then
    echo "Error: File '$ZIP_FILE1' does not exist"
    exit 1
fi

if [ ! -f "$ZIP_FILE2" ]; then
    echo "Error: File '$ZIP_FILE2' does not exist"
    exit 1
fi

# Extract base names for creating extraction directories
BASENAME1=$(basename "$ZIP_FILE1" .zip)
BASENAME2=$(basename "$ZIP_FILE2" .zip)

# Create extraction directories
mkdir -p "$BASENAME1"
mkdir -p "$BASENAME2"

# Extract the zip files
echo "Extracting $ZIP_FILE1 to $BASENAME1/"
if unzip -o "$ZIP_FILE1" -d "$BASENAME1"; then
    echo "Extraction of $ZIP_FILE1 completed successfully"
else
    echo "Error: Failed to extract $ZIP_FILE1"
    exit 1
fi

echo "Extracting $ZIP_FILE2 to $BASENAME2/"
if unzip -o "$ZIP_FILE2" -d "$BASENAME2"; then
    echo "Extraction of $ZIP_FILE2 completed successfully"
else
    echo "Error: Failed to extract $ZIP_FILE2"
    exit 1
fi

echo "Both zip files have been extracted successfully"
exit 0