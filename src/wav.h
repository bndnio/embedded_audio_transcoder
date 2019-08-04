#ifndef wav_h
#define wav_h

// System Libraries
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

// Project Modules
#include "decode.h"
#include "encode.h"

#include "../src_opt1/encode_v1.h"
#include "../src_opt1/decode_v1.h"

// Function Prototypes
void encode_decode_wav(char *filename);

#endif
