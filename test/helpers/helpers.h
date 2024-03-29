#ifndef helpers_h
#define helpers_h

// System Libraries
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// check.c
void check_equal(char *msg, uint32_t param1, uint32_t param2, void (*print)(uint32_t));
void check_func(char *msg, int (*funcp)());

// putsb.c
void puts_b32(uint32_t value);
void puts_b16(uint32_t value);
void puts_b14(uint32_t value);
void puts_b8(uint32_t value);

#endif
