#include "decode_v1.h"

/**
 * ===== DECODE =====
 */
uint16_t decode_v1(register char input)
{
    register uint16_t sign = (0x1 & (input >> 7)) ^ 0x1;
    register uint16_t step = 0xF & input;
    register uint16_t chord = 0x7 & (input >> 4);

    register uint16_t decoded = (sign << 13) |          // shift sign
                                (0x01 << (5 + chord)) | // shift leading one
                                (step << (chord + 1)) | // shift chord
                                (0x01 << chord);        // shift trailing one

    return ~decoded & 0x3FFF; // invert & mask lest significant 14 bits
}
