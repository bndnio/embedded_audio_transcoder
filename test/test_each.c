#include "test.h"

void test_each_encode(char *msg, uint32_t param1, uint32_t param2)
{
    check_equal(
        msg,
        param1,
        encode(param2),
        puts_b8);

    check_equal(
        msg,
        param1,
        encode_v1(param2),
        puts_b8);

//    check_equal(
//        msg,
//        param1,
//        encode_v2(param2),
//        puts_b8);
}

void test_each_decode(char *msg, uint32_t param1, uint32_t param2)
{
    check_equal(
        msg,
        param1,
        decode(param2),
        puts_b14);

    check_equal(
        msg,
        param1,
        decode_v1(param2),
        puts_b14);

    check_equal(
        msg,
        param1,
        decode_v2(param2),
        puts_b14);
}
