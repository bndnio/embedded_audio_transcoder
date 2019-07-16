#include "main.h"

void test_encode()
{
    char encoded = encode(0b01101010101010);
    assert(encoded == 0b00000101);

    encoded = encode(0b00011110000001);
    assert(encoded == 0b0100001);
}

void test_decode()
{
    uint16_t decoded = decode(0b00000101);
    assert(decoded == 0b11111111110100);

    //    decoded = decode(0b0100001);
    //    printf("%d\n", decoded);
    //    assert(decoded == 0b111110111001);
}
