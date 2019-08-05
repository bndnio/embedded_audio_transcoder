#include "decode_v3.h"

/**
 * ===== DECODE =====
 */

// Step 1
uint16_t decode_v3(register char input)
{
    input = ~input;

    register uint16_t chord = (input >> 4) + 3;

    register int16_t decoded = ((0x10 | (0x0F & input)) << chord) - 132;

    if (input & 0x80) {
        return -decoded;
    }
    return decoded;
}
