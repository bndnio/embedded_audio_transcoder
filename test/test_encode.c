#include "test.h"

void test_conv_sign_mag()
{
    check_equal(
        "check conv_sign_mag POS sign",
        POS,
        conv_sign_mag(0x1000).sign,
        puts_b16);

    check_equal(
        "check conv_sign_mag NEG sign",
        NEG,
        conv_sign_mag(0x8000).sign,
        puts_b16);

    check_equal(
        "check conv_sign_mag POS mag",
        32635 + 132,
        conv_sign_mag(32767).mag,
        puts_b16);

    check_equal(
        "check conv_sign_mag NEG mag",
        32635 + 132,
        conv_sign_mag(-32767).mag,
        puts_b16);

    check_equal(
        "check conv_sign_mag POS max boundary mag",
        32635 + 132,
        conv_sign_mag(32767).mag,
        puts_b16);

    check_equal(
        "check conv_sign_mag NEG max boundary mag",
        32635 + 132,
        conv_sign_mag(-32767).mag,
        puts_b16);

    check_equal(
        "check conv_sign_mag POS max mag",
        32635 + 132,
        conv_sign_mag(32767).mag,
        puts_b16);

    check_equal(
        "check conv_sign_mag NEG max mag",
        32635 + 132,
        conv_sign_mag(-32767).mag,
        puts_b16);
}

void test_calc_chord()
{
    check_equal(
        "check calc_chord 0 chord low",
        0,
        calc_chord(0x0080),
        puts_b16);

    check_equal(
        "check calc_chord 0 chord boundary",
        0,
        calc_chord(0x0080),
        puts_b16);

    check_equal(
        "check calc_chord 0 chord",
        0,
        calc_chord(0x008F),
        puts_b16);

    check_equal(
        "check calc_chord 1 chord boundary",
        1,
        calc_chord(0x0100),
        puts_b16);

    check_equal(
        "check calc_chord 1 chord",
        1,
        calc_chord(0x010F),
        puts_b16);

    check_equal(
        "check calc_chord 2 chord boundary",
        2,
        calc_chord(0x0200),
        puts_b16);

    check_equal(
        "check calc_chord 2 chord",
        2,
        calc_chord(0x020F),
        puts_b16);

    check_equal(
        "check calc_chord 3 chord boundary",
        3,
        calc_chord(0x0400),
        puts_b16);

    check_equal(
        "check calc_chord 3 chord",
        3,
        calc_chord(0x040F),
        puts_b16);

    check_equal(
        "check calc_chord 4 chord boundary",
        4,
        calc_chord(0x0800),
        puts_b16);

    check_equal(
        "check calc_chord 4 chord",
        4,
        calc_chord(0x080F),
        puts_b16);

    check_equal(
        "check calc_chord 5 chord boundary",
        5,
        calc_chord(0x1000),
        puts_b16);

    check_equal(
        "check calc_chord 5 chord",
        5,
        calc_chord(0x100F),
        puts_b16);

    check_equal(
        "check calc_chord 6 chord boundary",
        6,
        calc_chord(0x2000),
        puts_b16);

    check_equal(
        "check calc_chord 6 chord",
        6,
        calc_chord(0x200F),
        puts_b16);

    check_equal(
        "check calc_chord 7 chord boundary",
        7,
        calc_chord(0x4000),
        puts_b16);

    check_equal(
        "check calc_chord 7 chord",
        7,
        calc_chord(0x400F),
        puts_b16);
}

void test_extract_steps()
{
    check_equal(
        "check extract_steps with chord 1",
        0b0,
        calc_chord(0x100F),
        puts_b16);
}
