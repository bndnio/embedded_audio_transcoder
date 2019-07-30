#include "helpers.h"

void puts_b(uint32_t value, uint8_t size)
{
    uint8_t str_size = size + 3;

    char output[str_size];
    output[0] = '0';
    output[1] = 'b';

    unsigned int i;
    for (i = 0; i < size; i++)
    {
        // 0|1 + '0' -> '0' or '1' (ascii '0' + value)
        output[str_size - 2 - i] = (char)((value >> i) & 0x1) + '0';
    }
    output[str_size - 1] = '\0';

    printf("%s", output);
}

void puts_b32(uint32_t value)
{
    puts_b(value, 32);
}

void puts_b16(uint16_t value)
{
    puts_b(value, 16);
}

void puts_b14(uint16_t value)
{
    puts_b(value, 14);
}

void puts_b8(uint8_t value)
{
    puts_b(value, 8);
}
