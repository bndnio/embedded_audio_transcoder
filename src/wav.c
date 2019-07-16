#include "wav.h"

void encode_decode_wav(char *filename)
{
    FILE *ifp, *eofp, *dofp;

    int output_filename_len = strlen(filename) + sizeof("_xxx.wav");

    char encodedFilename[output_filename_len];
    strcat(encodedFilename, filename);
    strcat(encodedFilename, "_enc.wav");

    char decodedFilename[output_filename_len];
    strcat(encodedFilename, filename);
    strcat(encodedFilename, "_dec.wav");

    ifp = fopen(filename, "rb");

    if (ifp == NULL)
    {
        fprintf(stderr, "Can't open input file in.list!\n");
        exit(1);
    }

    eofp = fopen(encodedFilename, "wb");

    if (eofp == NULL)
    {
        fprintf(stderr, "Can't open encoded output file %s!\n",
                encodedFilename);
        exit(1);
    }

    dofp = fopen(decodedFilename, "wb");

    if (dofp == NULL)
    {
        fprintf(stderr, "Can't open decoded output file %s!\n",
                decodedFilename);
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