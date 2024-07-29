#!/bin/bash

# Source folder to copy
source_folder="~/Desktop/projects"

# Destination folder
destination_folder="/media/linux/DATA/projects"

# Exclude folders
exclude_folders=("node_modules" ".git" ".idea" ".terraform" ".vscode") 


# Function to copy folders recursively while excluding specified folders
copy_folders() {
    local source="$1"
    local dest="$2"
    local exclude=("$3")

    # if directory is empty create it then exit
    if [ -z "$(ls -A "$source")" ]; then
        mkdir -p "$dest"
        return
    fi

    for item in "$source"/*; do
        if [ -d "$item" ]; then
            folder_name=$(basename "$item")
            if ! [[ " ${exclude[@]} " =~ " $folder_name " ]]; then
                mkdir -p "$dest/$folder_name"
                copy_folders "$item" "$dest/$folder_name" "$exclude"
            fi
        else
            cp "$item" "$dest"
        fi
    done
}

# enable hidden files/directory
shopt -s dotglob
# Copy folders recursively
copy_folders "$source_folder" "$destination_folder" "${exclude_folders[*]}"
shopt -u dotglob


