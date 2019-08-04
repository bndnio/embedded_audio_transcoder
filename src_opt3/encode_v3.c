#include "encode_v3.h"

/**
 * ===== ENCODE =====
 */

char encode_v3(register int16_t input)
{
    register char sign = (input & 0x8000) == 0x8000 ? 1 : 0;
    register uint16_t mag = (sign == 1 ? -input : input);

    if (mag > 32635)
    {
        mag = 32635;
    }
    mag += 132;

    register char chord = 0x00;

    if (mag & (1 << 14))
        chord = 0x07;
    else if (mag & (1 << 13))
        chord = 0x06;
    else if (mag & (1 << 12))
        chord = 0x05;
    else if (mag & (1 << 11))
        chord = 0x04;
    else if (mag & (1 << 10))
        chord = 0x03;
    else if (mag & (1 << 9))
        chord = 0x02;
    else if (mag & (1 << 8))
        chord = 0x01;

    char step = (mag >> (chord + 3)) & 0x0F;
    return ~(((sign << 7) | (chord << 4) | step));
}
