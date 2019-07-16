.PHONY: all test clean

CC=arm-linux-gcc
CFLAGS = -Wall

SRC_FILES:=$(filter-out src/main.c,$(wildcard src/*.c))
TEST_FILES:=$(filter-out test/main.c,$(wildcard test/*.c))
SRC_OBJS:=$(SRC_FILES:src/%.c=%.o)
TEST_OBJS:=$(TEST_FILES:test/%.c=%.o)

%.o: src/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: test/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

all: $(SRC_OBJS)
	$(CC) -static $(SRC_OBJS) -o main.exe src/main.c

test: $(TEST_OBJS) $(SRC_OBJS)
	$(CC) -static $(TEST_OBJS) $(SRC_OBJS) -o test.exe test/main.c

clean:
	rm -f $(SRC_OBJS)
	rm -f $(TEST_OBJS)
	rm -f main.exe
	rm -f test.exe
