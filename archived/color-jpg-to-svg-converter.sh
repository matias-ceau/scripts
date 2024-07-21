#!/bin/bash

WALLPAPER_DIR="$HOME/.wallpapers/"

# Function to display usage
usage() {
    echo -e "# Usage"
    echo -e "\
    <script> <input_jpg_file> [ImageMagick options]
    # Example
    <script> input.jpg -resize 1920x1080> -colors 32" | bat -lbash --style='grid' -H 1
    echo -e \
"DESCRIPTION
       Interesting options:
         \033[32m-resize\033[0m \033[34mWxH>\033[0m               Resize image (maintaining aspect ratio, only shrink)
         \033[32m-colors\033[0m \033[34mvalue\033[0m              Reduce to this many colors (e.g., 32, 64, 128)
         \033[32m-colorspace\033[0m \033[34mtype\033[0m           Convert to specified colorspace (e.g., RGB, sRGB)
         \033[32m-posterize\033[0m \033[34mlevels\033[0m          Reduce number of color levels (e.g., 4, 8)
         \033[32m-dither\033[0m \033[34mmethod\033[0m             Apply dithering (e.g., Floyd-Steinberg)

For more options, refer to ImageMagick documentation." | bat -lman --style='rule'
    exit 1
}

# Initialize variables
input_file=""
magick_options=""

# Parse arguments
echo "# Parse arguments" | glow
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
echo "# If no input file is provided, use fzf to select one" | glow
if [[ -z $input_file ]]; then
    rpfile=$(ls -1 "$WALLPAPER_DIR" | fzf)
    if [[ -z $rpfile ]]; then
        echo "No file selected, exiting..."
        exit 1
    fi
    input_file="$WALLPAPER_DIR/$rpfile"
fi

# Check if file exists
echo "# Check if file exists" | glow
if [[ ! -f $input_file ]]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

output_dir="$(dirname "$input_file")/output"
filename=$(basename -- "$input_file")
name="${filename%.*}"

# Create output directory if it doesn't exist
echo "# Create output directory if it doesn't exist" | glow
mkdir -p "$output_dir"

# Process the image with user-provided options and color reduction
echo "# Process the image with user-provided options and color reduction" | glow
magick_command="magick \"$input_file\" $magick_options -colors 64 -dither FloydSteinberg \"$output_dir/${name}_processed.ppm\""
echo "Executing: $magick_command"
eval $magick_command

# Check if the magick command was successful
echo "# Check if the magick command was successful" | glow
if [[ $? -ne 0 ]]; then
    echo "Error: ImageMagick processing failed."
    exit 1
fi

# Convert to PGM for mkbitmap
echo "# Convert to PGM for mkbitmap" | glow
magick "$output_dir/${name}_processed.ppm" "$output_dir/${name}_processed.pgm"

# Use mkbitmap to prepare the image for potrace
echo "# Use mkbitmap to prepare the image for potrace" | glow
mkbitmap -f 2 -s 2 -t 0.48 "$output_dir/${name}_processed.pgm" -o "$output_dir/${name}_bitmap.pbm"

# Trace with Potrace
echo "# Trace with Potrace" | glow
potrace "$output_dir/${name}_bitmap.pbm" -s -C "#000000" -o "$output_dir/${name}.svg"

# Check if potrace was successful
echo "# Check if potrace was successful" | glow
if [[ $? -ne 0 ]]; then
    echo "Error: Potrace processing failed."
    exit 1
fi

# Clean up intermediate files"
#echo "# Clean up intermediate files" | glow
#rm -f "$output_dir/${name}_processed.ppm" "$output_dir/${name}_processed.pgm" "$output_dir/${name}_bitmap.pbm" "$output_dir/${name}.svg"

echo "Processed: $filename"
echo "SVG file is in $output_dir/${name}.svg"

# Set as background (comment out if not needed)
echo "# Set as background (comment out if not needed)" | glow
if [[ -f "$output_dir/${name}.svg" ]]; then
    magick "$output_dir/${name}.svg" "$output_dir/${name}_bg.png" &&\
    magick "$output_dir/${name}_bg.png" -negate "$output_dir/negative_${name}_bg.png"
else
    echo "Error: SVG file not found. Background setting failed."
fi
