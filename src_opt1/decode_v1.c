#include "decode_v1.h"

/**
 * ===== DECODE =====
 */
uint16_t decode_v1(register char input)
{
    input = ~input;
    register uint16_t sign = ((0x80 & input) >> 7) ^ 0x1;
    register uint16_t chord =(( 0x70 & input) >> 4);
    register uint16_t step = (0x0F & input);
    register uint16_t shifted_bias = 132;

    register uint16_t leading_one = 0x0001 << (2 + 5 + chord);
    register uint16_t shifted_step = step << (2 + 1 + chord);
    register int16_t decoded = leading_one + shifted_step - shifted_bias;

    if (sign == 0) {
        return -decoded;
    }
    return decoded;
}
