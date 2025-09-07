#!/bin/bash

# Recursively find all .png and .jpg files under the current directory
find . \( -iname "*.png" -o -iname "*.jpg" \) -print0 | while IFS= read -r -d $'\0' file; do
  # Get the directory path of the file
  dirpath=$(dirname "$file")
  # Get the filename without the extension
  filename=$(basename "$file" | sed 's/\.[^.]*$//')
  # Generate the output filename with .webp extension
  output_filename="${dirpath}/${filename}.webp"

  # Convert .png or .jpg to .webp using ffmpeg
  echo "Converting \"$file\" to \"$output_filename\"..."
  ffmpeg -i "$file" "$output_filename"

  # Check if ffmpeg command was successful
  if [ $? -eq 0 ]; then
    echo "Successfully converted \"$file\""
  else
    echo "Error converting \"$file\""
  fi
done