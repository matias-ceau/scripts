#!/bin/bash

#DOC#$deprecated$=2024-07=@CLI@ "first trial of jpg to svg"

WALLPAPER_DIR="$HOME/.wallpapers/"

# Function to display usage
usage() {
    echo -e "# Usage"
    echo -e "\
    <script> <input_jpg_file> [ImageMagick options]
    # Example
    <script> input.jpg -resize 1920x1080> -posterize 8 -colorspace gray" | bat -lbash --style='grid' -H 1
    echo -e \
"DESCRIPTION
       Interesting options:
         \033[32m-resize\033[0m \033[34mWxH>\033[0m               Resize image (maintaining aspect ratio, only shrink)
         \033[32m-posterize\033[0m \033[34mlevels\033[0m          Reduce number of colors (e.g., 8 for 8 levels per channel)
         \033[32m-colorspace\033[0m \033[34mtype\033[0m           Convert to specified colorspace (e.g., gray, RGB, sRGB)
         \033[32m-edge\033[0m \033[34mradius\033[0m               Detect edges in the image
         \033[32m-negate\033[0m                    Invert the image colors
         \033[32m-charcoal\033[0m \033[34mradius\033[0m           Create a charcoal-like effect
         \033[32m-threshold\033[0m \033[34mvalue\033[0m           Convert to black and white (0-100%, e.g. 50%)
         \033[32m-blur\033[0m \033[34mradiusxsigma\033[0m         Apply Gaussian blur
         \033[32m-sharpen\033[0m \033[34mradiusxsigma\033[0m      Sharpen the image
         \033[32m-sketch\033[0m \033[34mradiusxsigma+angle\033[0m Create a sketch effect
         \033[32m-tint\033[0m \033[34mvalue\033[0m                Tint the image with the fill color
         \033[32m-sepia-tone\033[0m \033[34mthreshold\033[0m      Sepia tone the image

For more options, refer to ImageMagick documentation." | bat -lman --style='rule'
    exit 1
}

# Initialize variables
input_file=""
magick_options=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        help|-h|--help)
            usage
            ;;
        -*)
            magick_options+="$1 "
            shift
            if [[ $1 != -* && $1 ]]; then
                magick_options+="$1 "
                shift
            fi
            ;;
        *)
            if [[ -z $input_file ]]; then
                input_file="$1"
            else
                magick_options+="$1 "
            fi
            shift
            ;;
    esac
done

# If no input file is provided, use fzf to select one
if [[ -z $input_file ]]; then
    rpfile=$(ls -1 "$WALLPAPER_DIR" | fzf)
    if [[ -z $rpfile ]]; then
        echo "No file selected, exiting..."
        exit 1
    fi
    input_file="$WALLPAPER_DIR/$rpfile"
fi

# Check if file exists
if [[ ! -f $input_file ]]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

output_dir="$(dirname "$input_file")/output"
filename=$(basename -- "$input_file")
name="${filename%.*}"

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Process the image with user-provided options
magick_command="magick \"$input_file\" $magick_options \"$output_dir/${name}_processed.pnm\""
echo "Executing: $magick_command"
eval $magick_command

# Check if the magick command was successful
if [[ $? -ne 0 ]]; then
    echo "Error: ImageMagick processing failed."
    exit 1
fi

# Trace with Potrace
potrace "$output_dir/${name}_processed.pnm" -s -o "$output_dir/${name}.svg"

# Clean up intermediate file
rm "$output_dir/${name}_processed.pnm"

echo "Processed: $filename"
echo "SVG file is in $output_dir/${name}.svg"

# Set as background (comment out if not needed)
magick "$output_dir/${name}.svg" "$output_dir/${name}_bg.png" && feh --bg-fill "$output_dir/${name}_bg.png"
