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
    NEG,
    POS,
} Sign;

// sign and magnitude
typedef struct SignMag
{
    Sign sign;
    uint16_t mag;
} SignMag;

#endif
