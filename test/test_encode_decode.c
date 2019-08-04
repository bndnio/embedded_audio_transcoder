#include "test.h"

void test_encode()
{
    test_each_encode(
            "test encode chord 0",
            0b11111111,
            0b0000000000000010);

    test_each_encode(
            "test encode chord 1",
            0b11100110,
            0b0000000100010011);

    test_each_encode(
            "test encode chord 2",
            0b11011010,
            0b0000001000100110);

    test_each_encode(
            "test encode chord 3",
            0b11001100,
            0b0000010001001101);

    test_each_encode(
            "test encode chord 4",
            0b10111101,
            0b0000100010011011);

    test_each_encode(
            "test encode chord 5",
            0b10101110,
            0b0001000100110110);

    test_each_encode(
            "test encode chord 6",
            0b10011110,
            0b0010001001101100);

    test_each_encode(
            "test encode chord 7",
            0b10001110,
            0b0100010011011001
    );
}

void test_decode()
{
    test_each_decode(
            "test decode chord 0",
            0b0000000000000100,
            0b11111110);

    test_each_decode(
            "test decode chord 1",
            0b0000000100001100,
            0b11100110);

    test_each_decode(
            "test decode chord 2",
            0b0000001000011100,
            0b11011010);

    test_each_decode(
            "test decode chord 3",
            0b0000010000111100,
            0b11001100);

    test_each_decode(
            "test decode chord 4",
            0b0000100001111100,
            0b10111101);

    test_each_decode(
            "test decode chord 5",
            0b0001000001111100,
            0b10101110);

    test_each_decode(
            "test decode chord 6",
            0b0010000101111100,
            0b10011110);

    test_each_decode(
            "test decode chord 7",
            0b0100001101111100,
            0b10001110);
}
