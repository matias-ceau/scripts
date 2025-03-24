#!/usr/bin/env -S uv run --script --quiet

# /// script
# requires-python = ">=3.13"
# dependencies = [
#   "pillow",
#   "numpy"]
# ///

import sys

import numpy as np
from PIL import Image

# Define the color palette
PALETTE = np.array(
    [
        (0xD1, 0x4D, 0x41),
        (0xAF, 0x30, 0x29),
        (0xDA, 0x70, 0x2C),
        (0xBC, 0x52, 0x15),
        (0xFC, 0xEE, 0xB8),
        (0xD0, 0xA2, 0x15),
        (0xAD, 0x83, 0x01),
        (0x4D, 0x3A, 0x0B),
        (0x87, 0x9A, 0x39),
        (0x66, 0x80, 0x0B),
        (0xEB, 0xF2, 0xE7),
        (0x3A, 0xA9, 0x9F),
        (0x24, 0x83, 0x7B),
        (0x14, 0x26, 0x25),
        (0x43, 0x85, 0xBE),
        (0x20, 0x5E, 0xA6),
        (0x8B, 0x7E, 0xC8),
        (0x5E, 0x40, 0x9D),
        (0xCE, 0x5D, 0x97),
        (0xA0, 0x2F, 0x6F),
        (0x10, 0x0F, 0x0F),
        (0x1C, 0x1B, 0x1A),
        (0x28, 0x27, 0x26),
        (0x34, 0x33, 0x31),
        (0x40, 0x3E, 0x3C),
        (0x57, 0x56, 0x53),
        (0x6F, 0x6E, 0x69),
        (0x87, 0x85, 0x80),
        (0x97, 0x95, 0x92),
        (0xB7, 0xB5, 0xAC),
        (0xCE, 0xCD, 0xC3),
        (0xDA, 0xD8, 0xCE),
        (0xE6, 0xE4, 0xD9),
        (0xFF, 0xFC, 0xF0),
    ],
    dtype=np.float32,
)


def find_closest_colors(pixels: np.ndarray) -> np.ndarray:
    """Find the closest colors in the palette for an array of pixels."""
    # Reshape pixels to 2D array of RGB values if needed
    if len(pixels.shape) == 3:
        original_shape = pixels.shape
        pixels = pixels.reshape(-1, 3)
    else:
        original_shape = None

    # Convert to float32 to prevent overflow
    pixels = pixels.astype(np.float32)

    # Calculate distances using broadcasting
    distances = np.sum((pixels[:, np.newaxis] - PALETTE) ** 2, axis=2)
    closest_indices = np.argmin(distances, axis=1)

    # Get the actual colors
    result = PALETTE[closest_indices]

    # Reshape back to original dimensions if needed
    if original_shape is not None:
        result = result.reshape(original_shape)

    return result.astype(np.uint8)


def process_image(input_path: str, output_path: str, max_size: int = 4000):
    """Process the image to use only colors from the palette."""
    # Open and convert image to RGB
    img = Image.open(input_path)
    if img.mode != "RGB":
        img = img.convert("RGB")

    # Resize if image is too large
    if max(img.size) > max_size:
        ratio = max_size / max(img.size)
        new_size = tuple(int(dim * ratio) for dim in img.size)
        img = img.resize(new_size, Image.Resampling.LANCZOS)

    # Convert image to numpy array
    img_array = np.array(img)

    # Process all pixels at once
    output_array = find_closest_colors(img_array)

    # Convert back to image and save
    output_img = Image.fromarray(output_array)
    output_img.save(output_path)


def main():
    if len(sys.argv) != 3:
        print("Usage: color_restrict.py input_image.jpg output_image.jpg")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    try:
        process_image(input_path, output_path)
        print(f"Successfully processed image from {input_path} to {output_path}")
    except Exception as e:
        print(f"Error processing image: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()

