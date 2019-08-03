#include "encode.h"

// Step 1
SignMag conv_sign_mag(int16_t to_convert)
{
    uint16_t MAX_MAG = 32635;
    SignMag sign_mag;

    sign_mag.sign = (to_convert < 0) ? NEG : POS;                 // Get the sign bit
    sign_mag.mag = ((to_convert < 0) ? -to_convert : to_convert); // Grab the rest of the magnitude

    if (sign_mag.mag > MAX_MAG)
    {
        sign_mag.mag = MAX_MAG;
    }
    sign_mag.mag += 132;

    return sign_mag;
}

// Step 2
char calc_chord(uint16_t magnitude)
{
    if (magnitude & (1 << 14))
        return 0x07;
    if (magnitude & (1 << 13))
        return 0x06;
    if (magnitude & (1 << 12))
        return 0x05;
    if (magnitude & (1 << 11))
        return 0x04;
    if (magnitude & (1 << 10))
        return 0x03;
    if (magnitude & (1 << 9))
        return 0x02;
    if (magnitude & (1 << 8))
        return 0x01;
    return 0x00;
}

// Step 3
char extract_steps(uint16_t mag, char chord)
{
    return (mag >> (chord + 3)) & 0x0F;
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
    char step = extract_steps(sign_mag.mag, chord);
    char codeword = assemble_codeword(sign_mag.sign, chord, step);
    return invert_codeword(codeword);
}
