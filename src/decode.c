#include "decode.h"

// Step 1
int16_t decode_from_table(char input)
{
    uint16_t sign = (0x1 & (input >> 7)) ^ 0x1;
    uint16_t step = 0xF & input;
    uint16_t chord = 0x7 & (input >> 4);

    uint16_t leading_one = 0x01 << (2 + 4 + chord);
    uint16_t trailing_one = 0x01 << (2 + chord);
    uint16_t shifted_chord = step << (2 + 1 + chord);
    uint16_t shifted_bias = 33 << 2;

    int16_t decoded = (int16_t)(leading_one + shifted_chord + trailing_one - shifted_bias);

    // If Neg
    if (sign == NEG)
    {
        return -decoded;
    }
    // If Pos
    else
    {
        return decoded;
    }
}

/**
 * ===== DECODE =====
 */
int16_t decode(char input)
{
    return decode_from_table(~input);
}
