#include "encode_v1.h"

#define NEG 0
#define POS 1

/**
 * ===== ENCODE =====
 */

char encode_v1(int16_t input)
{
    uint16_t MAX_MAG = 32635;

    uint16_t mag;
    uint8_t sign;

    if (input < 0) {
        mag = -input;
        sign = NEG;
    }
    else {
        mag = input;
        sign = POS;
    }

    if (mag > MAX_MAG)
    {
        mag = MAX_MAG;
    }
    mag += 132;

    char chord = 0x00;

    if (mag & (1 << 14))
        chord =  0x07;
    else if (mag & (1 << 13))
        chord =  0x06;
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
    return ~(((char)sign ^ 0x01) << 7 | chord << 4 | step);
}
