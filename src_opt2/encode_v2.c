#include "encode_v2.h"

#define MAX_MAG 32635
#define NEG 0
#define POS 1

/**
 * ===== ENCODE =====
 */

char encode_v2(int16_t input)
{
    register uint16_t mag;
    register uint8_t sign;

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

    register uint16_t chord_lmb = mag;
    chord_lmb |= chord_lmb >> 8;
    chord_lmb |= chord_lmb >> 4;
    chord_lmb |= chord_lmb >> 2;
    chord_lmb |= chord_lmb >> 1;

    register char chord = 0x00;
    switch (chord_lmb) {
        case (0x7FFF):
            chord =  0x07;
            break;
        case (0x3FFF):
            chord = 0x06;
            break;
        case (0x1FFF):
            chord = 0x05;
            break;
        case (0xFFF):
            chord = 0x04;
            break;
        case (0x7FF):
            chord = 0x03;
            break;
        case (0x3FF):
            chord = 0x02;
            break;
        case (0x1FF):
            chord = 0x01;
            break;
        default:
            chord = 0x00;
    }

    register char step = (mag >> (chord + 3)) & 0x0F;
    return ~(((char)sign ^ 0x01) << 7 | chord << 4 | step);
}
