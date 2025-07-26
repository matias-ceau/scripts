#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <limits.h>  // Add this line to include INT_MAX

#define MAX_COLOR 255
#define MAX_PALETTE_SIZE 256

typedef struct {
    unsigned char r, g, b;
} Color;

Color palette[MAX_PALETTE_SIZE];
int palette_size = 0;

int color_distance_sq(Color c1, Color c2) {
    int dr = c1.r - c2.r;
    int dg = c1.g - c2.g;
    int db = c1.b - c2.b;
    return dr*dr + dg*dg + db*db;
}

Color find_closest_color(Color input) {
    int min_distance = INT_MAX;
    Color closest = palette[0];

    for (int i = 0; i < palette_size; i++) {
        int distance = color_distance_sq(input, palette[i]);
        if (distance < min_distance) {
            min_distance = distance;
            closest = palette[i];
        }
    }

    return closest;
}

int read_palette(const char *filename) {
    FILE *palette_file = fopen(filename, "r");
    if (!palette_file) {
        perror("Error opening palette file");
        return 0;
    }

    char line[100];
    while (fgets(line, sizeof(line), palette_file) && palette_size < MAX_PALETTE_SIZE) {
        // Skip comments and empty lines
        if (line[0] == '#' || line[0] == '\n') continue;

        // Remove trailing newline
        line[strcspn(line, "\n")] = 0;

        // Parse color values
        int r, g, b;
        if (sscanf(line, "%d,%d,%d", &r, &g, &b) == 3) {
            palette[palette_size].r = (unsigned char)r;
            palette[palette_size].g = (unsigned char)g;
            palette[palette_size].b = (unsigned char)b;
            palette_size++;
        } else {
            fprintf(stderr, "Invalid color format in line: %s\n", line);
        }
    }

    fclose(palette_file);
    printf("Loaded %d colors from the palette file.\n", palette_size);
    return palette_size > 0;
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file.ppm> <output_file.ppm> <palette_file.txt>\n", argv[0]);
        return 1;
    }

    if (!read_palette(argv[3])) {
        fprintf(stderr, "Failed to load palette from %s\n", argv[3]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "rb");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    FILE *output_file = fopen(argv[2], "wb");
    if (!output_file) {
        perror("Error opening output file");
        fclose(input_file);
        return 1;
    }

    char magic[3];
    int width, height, max_color;

    // Read PPM header
    if (fscanf(input_file, "%2s\n%d %d\n%d\n", magic, &width, &height, &max_color) != 4) {
        fprintf(stderr, "Error reading PPM header\n");
        fclose(input_file);
        fclose(output_file);
        return 1;
    }

    if (magic[0] != 'P' || magic[1] != '6') {
        fprintf(stderr, "Unsupported PPM format. Only P6 is supported.\n");
        fclose(input_file);
        fclose(output_file);
        return 1;
    }

    // Write PPM header to output file
    fprintf(output_file, "P6\n%d %d\n%d\n", width, height, MAX_COLOR);

    // Process pixels
    for (int i = 0; i < width * height; i++) {
        Color pixel;
        if (fread(&pixel, sizeof(Color), 1, input_file) != 1) {
            fprintf(stderr, "Error reading pixel data\n");
            fclose(input_file);
            fclose(output_file);
            return 1;
        }

        Color closest = find_closest_color(pixel);
        fwrite(&closest, sizeof(Color), 1, output_file);
    }

    fclose(input_file);
    fclose(output_file);
    printf("Conversion completed successfully.\n");
    return 0;
}
