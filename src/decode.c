#include "decode.h"

// Step 1
int16_t decode_from_table(char input)
{
    uint16_t sign = ((0x80 & input) >> 7) ^ 0x01;
    uint16_t chord = ((0x70 & input) >> 4);
    uint16_t step = (0x0F & input);

    uint16_t leading_one = 0x0001 << (2 + 5 + chord);
    uint16_t shifted_step = step << (2 + 1 + chord);
    uint16_t shifted_bias = 132;

    int16_t decoded = leading_one + shifted_step - shifted_bias;

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
