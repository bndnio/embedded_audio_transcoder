#include "encode_v2.h"

/**
 * ===== ENCODE =====
 */

char encode_v2(uint16_t input)
{
    uint16_t sign = (input & 0x2000) == 0x2000 ? 0 : 1;
    uint16_t mag = input & 0x1FFF;

    uint16_t chord_lmb = (mag & 0x1FFF);
    chord_lmb |= (chord_lmb >> 1);
    chord_lmb |= (chord_lmb >> 2);
    chord_lmb |= (chord_lmb >> 4);
    chord_lmb |= (chord_lmb >> 8);

    char chord = 0;
    switch (chord_lmb) {
        case (0x1FFF):
            chord =  0x7;
            break;
        case (0xFFF):
            chord = 0x6;
            break;
        case (0x7FF):
            chord = 0x5;
            break;
        case (0x3FF):
            chord = 0x4;
            break;
        case (0x1FF):
            chord = 0x3;
            break;
        case (0xFF):
            chord = 0x2;
            break;
        case (0x7F):
            chord = 0x1;
            break;
        default:
            chord = 0;
    }

    char step = (mag >> (chord + 1)) & 0xF;
    return ~(((char)(sign) << 7 | chord << 4 | step));
}
