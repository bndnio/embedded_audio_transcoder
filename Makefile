.PHONY: all test clean

CC=arm-linux-gcc
CFLAGS = -Wall -static

SRC_FILES:=$(wildcard src/*.c)
TEST_FILES:=$(wildcard test/*.c)
SRC_OBJS:=$(SRC_FILES:%.c=%.o)
TEST_OBJS:=$(TEST_FILES:%.c=%.o)

all:$(SRC_FILES)
	$(CC) $(SRC_FILES) -o main.exe

test:$(TEST_FILES)
	$(CC) $(TEST_FILES) -o test.exe

%.o: %.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(SRC_OBJS)
	rm -f $(TEST_OBJS)
	rm -f main.exe
	rm -f test.exe
