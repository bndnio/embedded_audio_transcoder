// boolean
typedef enum
{
    FALSE,
    TRUE
} Bool;

// sign (negative, positive)
typedef enum
{
    NEG,
    POS
} Sign;

// sign and magnitude
typedef struct
{
    Sign sign;
    unsigned int mag;
} SignMag;
