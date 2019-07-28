#include "helpers.h"

static unsigned int test_count = 0;
static unsigned int test_success = 0;
static unsigned int test_failure = 0;

void check_setup()
{
    printf("\n\n");
    printf("=====================================\n");
    printf("==       STARTING TEST SUITE       ==\n");
    printf("=====================================\n");
    printf("\n");
}

int check_exp(char *msg, int expression)
{
    if (test_count == 0)
        check_setup();

    printf("Testing #%d: %s\n", test_count, msg);
    test_count += 1;

    if (expression == 1)
    {
        test_success += 1;
        printf(" \033[0;32mSuccess \033[0m\n\n");
        return 1;
    }
    test_failure += 1;
    return expression;
}

void check_equal(char *msg, uint16_t param1, uint16_t param2)
{
    int result = check_exp(msg, param1 == param2);
    if (result != 1)
    {
        printf(" \033[1;31mFailed \033[0;31m -- Expected ");
        puts_b16(param1);
        printf(",\n\t     but got ");
        puts_b16(param2);
        printf(" \033[0m\n\n");
    }
}

void check_func(char *msg, int (*funcp)())
{
    int result = check_exp(msg, funcp());
    if (result != 1)
        printf("Failed -- Function returned: %d\n", result);
}

void check_summary()
{
    printf("\n");
    printf("=====================================\n");
    printf("==         TESTS COMPLETE          ==\n");
    if (test_count == test_success)
        printf("==     ** ALL TESTS PASSED **      ==\n");
    // printf("==                                 ==\n");
    printf("=====================================\n");
    printf("|\n");
    printf("|  TOTAL: %d \n", test_count);
    printf("|  SUCCESS: %d \n", test_success);
    printf("|  FAILURES: %d \n", test_failure);
    printf("|\n");
    printf("|  PASS RATE: %d%% \n", 100 * test_success / test_count);
    printf("|\n");
    printf("=====================================\n");
    printf("\n");
}
