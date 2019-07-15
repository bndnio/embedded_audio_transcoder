// System Libraries
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Project Modules
#include "../decode.h"
#include "../encode.h"


int test_encode() {
    char encoded = encode(0b0101010101010);
    printf("%d\n", encoded);
    assert(encoded == 0b1110101);
}

/**
 * ===== MAIN =====
 */
int main()
{
    test_encode();

    return 0;

}
