#include "test.h"

void test_encode()
{
    test_each_encode(
        "0b00000101 == encode(0b01101010101010)",
        0b00000101,
        0b01101010101010);

    test_each_encode(
        "0b00100001 == encode(0b00011110000001)",
        0b00100001,
        0b00011110000001);

    test_each_encode(
        "0b01101000 == encode(0b00000001011100)",
        0b01101000,
        0b00000001011100);

    test_each_encode(
        "0b11101000 == encode(0b10000001011100)",
        0b11101000,
        0b10000001011100);
}

void test_decode()
{
    test_each_decode(
        "0b01111111010100 == decode(0b00000101)",
        0b01111111010100,
        0b00000101);

    test_each_decode(
        "0b01110110101111 == decode(0b01000010)",
        0b01110110101111,
        0b01000010);

    test_each_decode(
        "0b00011001111111 == decode(0b01111001)",
        0b00011001111111,
        0b01111001);

    test_each_decode(
        "0b10011001111111 == decode(0b11111001)",
        0b10011001111111,
        0b11111001);
}
