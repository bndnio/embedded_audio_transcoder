// System Libraries
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Project Modules
#include "src/decode.h"
#include "src/encode.h"

int test_encode()
{
    char encoded = encode(0b01101010101010);
    assert(encoded == 0b00000101);

    encoded = encode(0b00011110000001);
    assert(encoded == 0b0100001);
}

/**
 * ===== MAIN =====
 */
int main()
{
    test_encode();
    printf("\n------------ALL TESTS PASSED-------------\n\n");
    return 0;
}
