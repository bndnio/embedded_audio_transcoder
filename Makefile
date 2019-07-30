.PHONY: all test clean

CC=arm-linux-gcc
CFLAGS = -Wall

SRC_FILES:=$(filter-out src/main.c,$(wildcard src/*.c))
OPT_1_FILES:=$(wildcard optimized_version_1/*.c)
TEST_FILES:=$(filter-out test/main.c,$(wildcard test/*.c))
TEST_HELPER_FILES:=$(wildcard test/helpers/*.c)

SRC_OBJS:=$(SRC_FILES:src/%.c=%.o)
OPT_1_OBJS=$(OPT_1_FILES:optimized_version_1/%.c=%.o)
TEST_OBJS:=$(TEST_FILES:test/%.c=%.o)
TEST_HELPER_OBJS:=$(TEST_HELPER_FILES:test/helpers/%.c=%.o)

%.o: src/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: test/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: test/helpers/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: optimized_version_1/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

all: $(SRC_OBJS)
	$(CC) -static $(SRC_OBJS) -o main.exe src/main.c

test: $(TEST_OBJS) $(TEST_HELPER_OBJS) $(SRC_OBJS) $(OPT_1_OBJS)
	$(CC) -static $(TEST_OBJS) $(OPT_1_OBJS) $(TEST_HELPER_OBJS) $(SRC_OBJS) -o test.exe test/main.c

clean:
	rm -f $(SRC_OBJS)
	rm -f $(TEST_OBJS)
	rm -f $(TEST_HELPER_OBJS)
	rm -f main.exe
	rm -f test.exe
