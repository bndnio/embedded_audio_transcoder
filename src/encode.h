#ifndef encode_h
#define encode_h

#include "types.h"

SignMag conv_sign_mag(int to_convert);
char calc_chord(unsigned int magnitude);
char extract_steps(char chord);
char assemble_codeword(Sign sign, char chord, char step);
int invert_codeword(char codeword);

char encode(input);

#endif