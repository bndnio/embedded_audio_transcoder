#include "test.h"

void test_encode()
{
    check_equal(
        "0b00000101 == encode(0b01101010101010)",
        0b00000101,
        encode(0b01101010101010));

    check_equal(
        "0b0100001 == encode(0b00011110000001)",
        0b0100001,
        encode(0b00011110000001));
}

void test_decode()
{
    check_equal(
        "0b11111111110100 == decode(0b00000101)",
        0b11111111110100,
        decode(0b00000101));

    check_equal(
        "0b111110111001 == decode(0b0100001)",
        0b111110111001,
        decode(0b0100001));
}
