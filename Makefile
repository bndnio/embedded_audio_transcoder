.PHONY: all test clean

mu:
	arm-linux-gcc -c src/encode.c
	arm-linux-gcc -c src/decode.c
	arm-linux-gcc -c src/wav.c
	arm-linux-gcc -static decode.o encode.o wav.o -o main.exe src/main.c

test:
    arm-linux-gcc -c src/encode.c
    arm-linux-gcc -c src/decode.c
    arm-linux-gcc -static decode.o encode.o -o test.exe test/test_encode_decode.c

clean:
	rm -f encode.o
	rm -f decode.o
	rm -f wav.o
	rm -f main.exe
	rm -f test.exe
