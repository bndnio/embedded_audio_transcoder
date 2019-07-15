// Self Header
#include "encode.h"

// Step 1
SignMag conv_sign_mag(int to_convert)
{
}

// Step 2
int calc_chord(unsigned int magnitude)
{
    if (magnitude & (1 << 12))
        return 0x7;
    if (magnitude & (1 << 11))
        return 0x6;
    if (magnitude & (1 << 10))
        return 0x5;
    if (magnitude & (1 << 9))
        return 0x4;
    if (magnitude & (1 << 8))
        return 0x3;
    if (magnitude & (1 << 7))
        return 0x2;
    if (magnitude & (1 << 7))
        return 0x2;
}

// Step 3
int extract_steps(int chord)
{
}

// Step 4
int assemble_codeword(Sign sign, int chord, int step)
{
}

// Step 5
int invert_codeword(int codeword)
{
}

/**
 * ===== ENCODE =====
 */
int endcode()
{

    return 0;
}
