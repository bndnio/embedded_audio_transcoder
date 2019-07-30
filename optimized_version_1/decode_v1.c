#include "decode_v1.h"

/**
 * ===== DECODE =====
 */

// Step 1
uint16_t decode_v1(char register input)
{
    char register chord = 0x7 & (input >> 4);
    return ~(
               ((((input >> 7) & 0x1) ^ 0x1) << 13) |
               (0x01 << (5 + chord)) |
               (0x01 << chord) |
               ((0xF & input) << (chord + 1))) &
           0x3FFF;
}
