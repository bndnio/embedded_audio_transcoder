#include "wav.h"

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

    uint16_t xfer;
    char encoded_xfer;
    uint16_t decoded_xfer;
    // Write file header across both output files
    unsigned int i;
    for (i = 0; i < 22; i++)
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
        fwrite(&encoded_xfer, sizeof(encoded_xfer), 1, eofp);
        fwrite(&decoded_xfer, sizeof(decoded_xfer), 1, dofp);
    }
}
