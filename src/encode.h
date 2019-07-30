#ifndef encode_h
#define encode_h

// System Libraries
#include <stdint.h>

// Project Modules
#include "types.h"

SignMag conv_sign_mag(uint16_t to_convert);
char calc_chord(uint16_t magnitude);
char extract_steps(uint16_t input, char chord);
char assemble_codeword(Sign sign, char chord, char step);
int invert_codeword(char codeword);
char encode(uint16_t input);

#endif
