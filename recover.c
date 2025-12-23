#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t BYTE;

int main(int argc, char *argv[])
{
    // Check command-line arguments
    if (argc != 2)
    {
        printf("Usage: ./recover FILE\n");
        return 1;
    }

    // Open input file
    FILE *input = fopen(argv[1], "r");
    if (input == NULL)
    {
        printf("Could not open file.\n");
        return 1;
    }

    // Create a buffer to store 512 bytes
    BYTE buffer[512];

    // Create variables for output file
    FILE *output = NULL;
    int file_count = 0;
    char filename[8];

    // Read 512 bytes into buffer
    while (fread(buffer, sizeof(BYTE), 512, input) == 512)
    {
        // Check if buffer indicates start of a new JPEG
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            // If already found a JPEG, close it
            if (output != NULL)
            {
                fclose(output);
            }

            // Create new JPEG
            sprintf(filename, "%03i.jpg", file_count);
            output = fopen(filename, "w");
            file_count++;
        }

        // If currently writing to a JPEG file, write the buffer
        if (output != NULL)
        {
            fwrite(buffer, sizeof(BYTE), 512, output);
        }
    }

    // Close any remaining files
    if (output != NULL)
    {
        fclose(output);
    }
    fclose(input);

    return 0;
}
