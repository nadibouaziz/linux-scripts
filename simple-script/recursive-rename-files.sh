# #!/bin/bash

# Function to recursively rename files and folders with some rules (cf comments)
rename_files_and_folders() {
    local dir="$1"
    local entry
    cd "$dir" || return  # Change to the directory
    shopt -s nullglob   # Avoid errors if no files or folders are present

    for entry in *; do
        # Check if the entry is a directory
        if [ -d "$entry" ]; then
            # Generate the new name by replacing spaces with "-" and removing consecutive "-" characters
            new_name=$(echo "$entry" | tr ' ' '-' | sed 's/-\+/-/g')
            if [ "$entry" != "$new_name" ]; then
                mv "$entry" "$new_name"
            fi
            # Recursively call the function for subdirectories
            rename_files_and_folders "$new_name"
        elif [ -f "$entry" ]; then
            # Get the filename without extension
            filename=$(basename "$entry")
            extension="${filename##*.}"
            filename="${filename%.*}" 

            # Replace all special characters EXCEPT - with "-", convert to lowercase, remove consecutive "-" and remove trailing and leading -
            new_name=$(echo "${filename//[^[:alnum:]-]/-}" | tr '[:upper:]' '[:lower:]' | sed 's/-\+/-/g' | sed 's/-$//;s/^-//')        

            if [ "$filename" != "$new_name" ]; then
                # Append the extension back to the filename
                new_name="$new_name.$extension"
                # Rename the file
                mv "$entry" "$new_name"
            fi
        fi
    done
    cd ..  # Move back to the parent directory
}

# Run the function with the specified directory
rename_files_and_folders "$1"
