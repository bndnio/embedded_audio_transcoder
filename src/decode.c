#include "decode.h"

// Step 1
int16_t decode_from_table(char input)
{
    uint16_t sign = ((0x80 & input) >> 7) ^ 0x1;
    uint16_t step = 0x0F & input;
    uint16_t chord = (0x70 & input) >> 4;

    uint16_t leading_one = 0x01 << (2 + 5 + chord);
    uint16_t trailing_one = 0x01 << (2 + chord);
    uint16_t shifted_step = step << (2 + 1 + chord);
    uint16_t shifted_bias = 132;
    if (chord > 7)
        printf("uhohhhh");

    int16_t decoded = (int16_t)(shifted_step);

    // If Neg
    if (sign == NEG)
    {
        // printf("%d\n", -decoded);
        return -decoded;
    }
    // If Pos
    else
    {
        // printf("%d\n", decoded);
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
