#include "encode_v2.h"

/**
 * ===== ENCODE =====
 */

char encode_v2(uint16_t input)
{
    uint16_t sign = (input & 0x2000) == 0x2000 ? 0 : 1;
    uint16_t mag = input & 0x1FFF;

    char chord = 0;

    switch (mag) {
        case (1 << 12):
            chord =  0x7;
            break;
        case (1 << 11):
            chord = 0x6;
            break;
        case (1 << 10):
            chord = 0x5;
            break;
        case (1 << 9):
            chord = 0x4;
            break;
        case (1 << 8):
            chord = 0x3;
            break;
        case (1 << 7):
            chord = 0x2;
            break;
        case (1 << 6):
            chord = 0x1;
            break;
    }

    char step = (mag >> (chord + 1)) & 0xF;
    return ~(((char)(sign) << 7 | chord << 4 | step));
}
