#include "encode.h"

// Step 1
SignMag conv_sign_mag(int16_t to_convert)
{
    SignMag sign_mag;
    sign_mag.sign = to_convert >= 0 ? POS : NEG;
    sign_mag.mag = to_convert >= 0 ? to_convert : -to_convert;

    return sign_mag;
}

// Step 2
char calc_chord(uint16_t magnitude)
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
    if (magnitude & (1 << 6))
        return 0x1;
    return 0;
}

// Step 3
char extract_steps(uint16_t input, char chord)
{
    return (input >> (chord + 1)) & 0xF;
}

// Step 4
char assemble_codeword(Sign sign, char chord, char step)
{
    char code_word = (char)sign << 7 | chord << 4 | step;
    return code_word;
}

// Step 5
int invert_codeword(char codeword)
{
    return ~codeword;
}

/**
 * ===== ENCODE =====
 */
char encode(uint16_t input)
{
    SignMag sign_mag = conv_sign_mag(input);
    char chord = calc_chord(sign_mag.mag);
    char step = extract_steps(input, chord);
    char codeword = assemble_codeword(sign_mag.sign, chord, step);
    return invert_codeword(codeword);
}
