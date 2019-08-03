#include "encode.h"

// Step 1
SignMag conv_sign_mag(int16_t to_convert)
{
    uint16_t MAX_MAG = 32635;
    SignMag sign_mag;

    sign_mag.sign = to_convert < 0 ? NEG : POS;                   // Get the sign bit
    sign_mag.mag = ((to_convert < 0 ? -to_convert : to_convert)); // Grab the rest of the magnitude

    if (sign_mag.mag < 0)
        printf("oooopps");
    if (sign_mag.mag > MAX_MAG)
    {
        sign_mag.mag = MAX_MAG;
    }
    // sign_mag.mag += 132;

    return sign_mag;
}

// Step 2
char calc_chord(uint16_t magnitude)
{
    if (magnitude & (1 << 14))
        return 0x7;
    if (magnitude & (1 << 13))
        return 0x6;
    if (magnitude & (1 << 12))
        return 0x5;
    if (magnitude & (1 << 11))
        return 0x4;
    if (magnitude & (1 << 10))
        return 0x3;
    if (magnitude & (1 << 9))
        return 0x2;
    if (magnitude & (1 << 8))
        return 0x1;
    return 0;
}

// Step 3
char extract_steps(uint16_t input, char chord)
{
    return (input >> (chord + 3)) & 0xF;
}

// Step 4
char assemble_codeword(Sign sign, char chord, char step)
{
    char codeword = ((char)sign ^ 0x01) << 7 | chord << 4 | step;
    return codeword;
}

// Step 5
int invert_codeword(char codeword)
{
    return ~codeword;
}

/**
 * ===== ENCODE =====
 */
char encode(int16_t input)
{
    SignMag sign_mag = conv_sign_mag(input);
    char chord = calc_chord(sign_mag.mag);
    char step = extract_steps(input, chord);
    char codeword = assemble_codeword(sign_mag.sign, chord, step);
    return invert_codeword(codeword);
}
