# Change daily Desktop background

Create a script that changes the desktop background picture on your gnome (GUI) every day when you log in, you can follow these steps:

## Setting the Desktop Background

Create a new script file, e.g. `change_wallpaper.sh`, with the following content:

```sh
#!/bin/bash

# Set the directory containing your wallpaper images
wallpaper_dir="/path/to/your/wallpaper/directory"

# Get a random wallpaper file from the directory
random_wallpaper=$(ls "$wallpaper_dir" | shuf -n 1)

# Set the new wallpaper
gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper_dir/$random_wallpaper"
```

Replace `/path/to/your/wallpaper/directory` with the actual path to the directory containing your wallpaper images.

## Permissions to the scripts

Make the script executable by running: 

```sh
chmod +x change_wallpaper.sh
```

## Running the Script at Login

To run the script automatically when you log in to your  session, you can create a desktop entry file:

Create a new file :

```sh
touch ~/.config/autostart/change_wallpaper.desktop
```

Edit the file with the following content:

```text
[Desktop Entry]
Type=Application
Exec=/path/to/change_wallpaper.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Change Wallpaper
Comment=Change desktop wallpaper on login
```

Replace `/path/to/change_wallpaper.sh` with the actual path to your change_wallpaper.sh script.

Make sure to have a collection of wallpaper images in the specified directory for the script to work properly. You can customize the script further, such as downloading a new wallpaper image from a website every day, if desired.
