#!/bin/bash

# Directory containing your JPG files

# Loop through all .jpg files in the directory
for jpg_file in *.jpg; do
    # Get the base filename (without the extension)
    base_name=$(basename "$jpg_file" .jpg)

    # Output filename with the same name as the input, but different extension
    output_file="$base_name-compressed.jpg"

    # Resize and compress the image
    convert "$jpg_file" -resize 50% -quality 85 "$output_file"

    echo "Processed: $jpg_file -> $output_file"
done

echo "Conversion complete."
