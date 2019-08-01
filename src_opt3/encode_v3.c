#include "encode_v3.h"

/**
 * ===== ENCODE =====
 */

char encode_v3(register uint16_t input)
{
    register char sign = (input & 0x2000) == 0x2000 ? 0 : 1;
    register uint16_t mag = input & 0x1FFF;

    register char chord = 0;

    if (mag & (1 << 12))
        chord =  0x7;
    else if (mag & (1 << 11))
        chord =  0x6;
    else if (mag & (1 << 10))
        chord = 0x5;
    else if (mag & (1 << 9))
        chord = 0x4;
    else if (mag & (1 << 8))
        chord = 0x3;
    else if (mag & (1 << 7))
        chord = 0x2;
    else if (mag & (1 << 6))
        chord = 0x1;

    char step = (mag >> (chord + 1)) & 0xF;
    return ~(((char)(sign) << 7 | chord << 4 | step));

}
