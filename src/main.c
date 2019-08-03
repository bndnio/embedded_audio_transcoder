// System Libraries
#include <stdio.h>
#include <stdlib.h>

// Project Modules
#include "decode.h"
#include "encode.h"
#include "wav.h"

/**
 * ===== MAIN =====
 */
int main()
{
    calc_chord(0x1234);
    printf("yea I do stuff\n");
    encode_decode_wav("./guac");

    return 0;
}
