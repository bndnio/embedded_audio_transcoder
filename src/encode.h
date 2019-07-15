#ifndef encode_h
#define encode_h

#include "types.h"
#include <stdint.h>

SignMag conv_sign_mag(uint16_t to_convert);
char calc_chord(unsigned int magnitude);
char extract_steps(char chord);
char assemble_codeword(Sign sign, char chord, char step);
int invert_codeword(char codeword);
char encode(uint16_t input);

#endif
