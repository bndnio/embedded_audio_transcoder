#ifndef test_h
#define test_h

// System Libraries
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Project Modules
#include "helpers/helpers.h"
#include "../src/decode.h"
#include "../src/encode.h"

#include "../src_opt1/encode_v1.h"
#include "../src_opt1/decode_v1.h"

#include "../src_opt2/encode_v2.h"
#include "../src_opt2/decode_v2.h"

#include "../src_opt3/encode_v3.h"

// test_each
void test_each_encode(char *msg, uint32_t param1, uint32_t param2);
void test_each_decode(char *msg, uint32_t param1, uint32_t param2);

// test_encode_decode
void test_encode();
void test_decode();

#endif
