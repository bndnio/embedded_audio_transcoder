#include "decode.h"

// Step 1
uint16_t decode_from_table(char input)
{
    char sign = 0x1 & (input >> 7);
    char step = 0xF & input;
    char chord = 0x7 & (input >> 4);

    char leading_one = 0x01 << (5 + step);
    char trailing_one = 0x01 << step;
    char shifted_chord = chord << (step + 1);

    printf("%d", input);

    printf("%d", leading_one);
    printf("%d", shifted_chord);
    printf("%d", trailing_one);

    return sign | leading_one | shifted_chord | trailing_one;
}

/**
 * ===== DECODE =====
 */
uint16_t decode(char input)
{
    return decode_from_table(input);
}
