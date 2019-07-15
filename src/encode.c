// Self Header
#include "encode.h"

// Step 1
SignMag conv_sign_mag(int to_convert)
{
    SignMag sign_mag;
    sign_mag.sign = to_convert >= 0 ? POS : NEG;
    sign_mag.mag = to_convert >= 0 ? to_convert : -to_convert;

    return sign_mag;
}

// Step 2
char calc_chord(unsigned int magnitude)
{
}

// Step 3
char extract_steps(char chord)
{
    return 0x0F & chord;
}

// Step 4
char assemble_codeword(Sign sign, char chord, char step)
{
    return (char)sign << 7 | chord << 4 | step;
}

// Step 5
int invert_codeword(char codeword)
{
    return !codeword;
}

/**
 * ===== ENCODE =====
 */
int endcode()
{

    return 0;
}
