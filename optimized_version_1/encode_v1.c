#include "encode_v1.h"

/**
 * ===== ENCODE =====
 */
char encode_v1(uint16_t input)
{
    char chord;
    if (input & (1 << 12))
        chord =  0x7;
    if (input & (1 << 11))
        chord = 0x6;
    if (input & (1 << 10))
        chord = 0x5;
    if (input & (1 << 9))
        chord = 0x4;
    if (input & (1 << 8))
        chord = 0x3;
    if (input & (1 << 7))
        chord = 0x2;
    if (input & (1 << 6))
        chord = 0x1;

    char step = (input >> (chord + 1)) & 0xF;


    return ~(((char)(input & 0x2000)) << 7 | chord << 4 | step);

}
