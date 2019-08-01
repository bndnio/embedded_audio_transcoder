#include "wav.h"

const unsigned int DEBUG = 0;

// Debugging tools because I can't include testing helpers
void puts_bs(uint32_t value, uint8_t size)
{
    uint8_t str_size = size + 3;

    char output[str_size];
    output[0] = '0';
    output[1] = 'b';

    unsigned int i;
    for (i = 0; i < size; i++)
    {
        // 0|1 + '0' -> '0' or '1' (ascii '0' + value)
        output[str_size - 2 - i] = ((uint8_t)(value >> i) & 0x1) + '0';
    }
    output[str_size - 1] = '\0';

    printf("%s", output);
}

void puts_bs32(uint32_t value)
{
    puts_bs(value, 32);
}

void puts_bs16(uint32_t value)
{
    puts_bs(value, 16);
}

void puts_bs8(uint32_t value)
{
    puts_bs(value, 8);
}

void encode_decode_wav(char *filename)
{

    FILE *ifp, *eofp, *dofp;

    int input_filename_len = strlen(filename) + sizeof(".wav") + 1;
    int output_filename_len = strlen(filename) + sizeof("_xxx.wav") + 1;

    char input_filename[input_filename_len];
    strcpy(input_filename, filename);
    strcat(input_filename, ".wav\0");

    char encoded_filename[output_filename_len];
    strcpy(encoded_filename, filename);
    strcat(encoded_filename, "_enc.wav\0");

    char decoded_filename[output_filename_len];
    strcpy(decoded_filename, filename);
    strcat(decoded_filename, "_dec.wav\0");

    ifp = fopen(input_filename, "rb");

    if (ifp == NULL)
    {
        fprintf(stderr, "Can't open input file: %s\n", input_filename);
        exit(1);
    }

    eofp = fopen(encoded_filename, "wb");

    if (eofp == NULL)
    {
        fprintf(stderr, "Can't open encoded output file %s\n", encoded_filename);
        exit(1);
    }

    dofp = fopen(decoded_filename, "wb");

    if (dofp == NULL)
    {
        fprintf(stderr, "Can't open decoded output file %s\n", decoded_filename);
        exit(1);
    }

    int16_t xfer;
    char encoded_xfer;
    int16_t decoded_xfer;
    // Write file header across both output files
    unsigned int i;
    for (i = 0; i < 44; i++)
    {
        fread(&xfer, sizeof(xfer), 1, ifp);
        fwrite(&xfer, sizeof(xfer), 1, eofp);
        fwrite(&xfer, sizeof(xfer), 1, dofp);
    }
    // Write encoded & encoded -> decoded files
    while (!feof(ifp))
    {
        fread(&xfer, sizeof(xfer), 1, ifp);
        encoded_xfer = encode(xfer);
        decoded_xfer = decode(encoded_xfer);
        if (DEBUG)
        {
            printf("\ni: ");
            puts_bs16(xfer);
            printf("\ne: ");
            puts_bs8(encoded_xfer);
            printf("\nd: ");
            puts_bs16(decoded_xfer);
            printf("\n----\n");
            printf("sizeof xfer: %u\n", sizeof(xfer));
            printf("sizeof decoded_xfer: %u\n", sizeof(decoded_xfer));
        }
        fwrite(&encoded_xfer, sizeof(encoded_xfer), 1, eofp);
        fwrite(&decoded_xfer, sizeof(decoded_xfer), 1, dofp);
    }
    printf("Done encoding/decoding part\n");
}
