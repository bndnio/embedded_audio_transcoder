#include "test.h"

/**
 * ===== MAIN =====
 */
int main()
{
    test_encode();
    test_decode();
    test_conv_sign_mag();
    test_calc_chord();
    test_extract_steps();
    test_assemble_codeword();
    check_summary();
    return 0;
}
