#!/bin/bash

# Define the two directories to compare
dir1="~/Desktop/projects"
dir2="/media/linux/DATA/projects"

# Run 'find' command to list all files and directories in each directory
files1=$(find "$dir1" -type f -printf "%P\n" | sort)
files2=$(find "$dir2" -type f -printf "%P\n" | sort)

# Run 'diff' command to compare the two directory listings
diff_output=$(diff <(echo "$files1") <(echo "$files2"))

# Display the differences
if [ -z "$diff_output" ]; then
    echo "No differences found."
else
    echo "Differences found:"
    echo "$diff_output"
fi

