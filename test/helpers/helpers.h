// System Libraries
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// check.c
void check_equal(char *msg, uint32_t param1, uint32_t param2, void (*print)());
void check_func(char *msg, int (*funcp)());

// printb.c
void puts_b32(uint32_t value);
void puts_b16(uint16_t value);
void puts_b14(uint16_t value);
void puts_b8(uint8_t value);
