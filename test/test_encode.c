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
        "check extract_steps with chord 0",
        0x03,
        extract_steps(0x009F, calc_chord(0x009F)),
        puts_b16);

    check_equal(
        "check extract_steps with chord 1",
        0x0F,
        extract_steps(0x01FF, calc_chord(0x01FF)),
        puts_b16);

    check_equal(
        "check extract_steps with chord 2",
        0x09,
        extract_steps(0x0320, calc_chord(0x0320)),
        puts_b16);

    check_equal(
        "check extract_steps with chord 3",
        0x04,
        extract_steps(0x050F, calc_chord(0x050F)),
        puts_b16);

    check_equal(
        "check extract_steps with chord 4",
        0x06,
        extract_steps(0x0B00, calc_chord(0x0B00)),
        puts_b16);

    check_equal(
        "check extract_steps with chord 5",
        0x03,
        extract_steps(0x1300, calc_chord(0x1300)),
        puts_b16);

    check_equal(
        "check extract_steps with chord 6",
        0x07,
        extract_steps(0x2F00, calc_chord(0x2F00)),
        puts_b16);

    check_equal(
        "check extract_steps with chord 7",
        0x03,
        extract_steps(0x4F00, calc_chord(0x4F00)),
        puts_b16);
}

void test_assemble_codeword() {
    check_equal(
        "test assemble codeword with 0 chord and negative sign",
        0x8F,
        assemble_codeword(0, 0x0, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 0 chord and pos sign",
        0x0F,
        assemble_codeword(1, 0x0, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 1 chord and negative sign",
        0x9F,
        assemble_codeword(0, 0x01, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 1 chord and pos sign",
        0x1F,
        assemble_codeword(1, 0x01, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 2 chord and negative sign",
        0xAF,
        assemble_codeword(0, 0x02, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 2 chord and pos sign",
        0x2F,
        assemble_codeword(1, 0x02, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 3 chord and negative sign",
        0xBF,
        assemble_codeword(0, 0x03, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 3 chord and pos sign",
        0x3F,
        assemble_codeword(1, 0x03, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 4 chord and negative sign",
        0xCF,
        assemble_codeword(0, 0x04, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 4 chord and pos sign",
        0x4F,
        assemble_codeword(1, 0x04, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 5 chord and negative sign",
        0xDF,
        assemble_codeword(0, 0x05, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 5 chord and pos sign",
        0x5F,
        assemble_codeword(1, 0x05, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 6 chord and negative sign",
        0xEF,
        assemble_codeword(0, 0x06, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 6 chord and pos sign",
        0x6F,
        assemble_codeword(1, 0x06, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 7 chord and negative sign",
        0xFF,
        assemble_codeword(0, 0x07, 0xF),
        puts_b16);

    check_equal(
        "test assemble codeword with 7 chord and pos sign",
        0x7F,
        assemble_codeword(1, 0x07, 0xF),
        puts_b16);
}
