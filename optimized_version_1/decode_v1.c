#include "decode_v1.h"

/**
 * ===== DECODE =====
 */

// Step 1
uint16_t decode_v1(char input)
{
    char sign = (0x1 & (input >> 7)) ^ 0x1;
    char step = 0xF & input;
    char chord = 0x7 & (input >> 4);

    uint16_t shifted_sign = sign << 13;
    uint16_t leading_one = 0x01 << (5 + chord);
    uint16_t trailing_one = 0x01 << chord;
    uint16_t shifted_chord = step << (chord + 1);

    uint16_t decoded = shifted_sign | leading_one | shifted_chord | trailing_one;

    return ~decoded & 0x3FFF;
}
