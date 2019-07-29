#ifndef types_h
#define types_h

// boolean
typedef enum Bool
{
    FALSE,
    TRUE
} Bool;

// sign (negative, positive)
typedef enum Sign
{
    POS,
    NEG
} Sign;

// sign and magnitude
typedef struct SignMag
{
    Sign sign;
    unsigned int mag;
} SignMag;

#endif
