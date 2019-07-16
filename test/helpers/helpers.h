// System Libraries
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// check.c
void check_equal(char *msg, uint16_t param1, uint16_t param2);
void check_func(char *msg, int (*funcp)());

// printb.c
void puts_b16(uint16_t value);
