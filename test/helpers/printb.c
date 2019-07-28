#include "helpers.h"

void puts_b16(uint16_t value)
{
    char output[17];
    output[0] = '0';
    output[1] = 'b';
    unsigned int i;
    for (i = 0; i < 14; i++)
    {
        output[17 - i - 2] = (char)((value >> i) & 0x1) + '0';
    }
    output[18] = '\0';
    printf("%s", output);
}
