#include "decode_v2.h"

/**
 * ===== DECODE =====
 */

// Step 1
uint16_t decode_v2(register char input)
{
    input = ~input;

    register uint16_t chord =(( 0x70 & input) >> 4);

    register int16_t decoded = (0x0001 << (2 + 5 + chord)) + ((0x0F & input) << (2 + 1 + chord)) - 132;

    if ((((0x80 & input) >> 7) ^ 0x1) == 0) {
        return -decoded;
    }
    return decoded;
}
