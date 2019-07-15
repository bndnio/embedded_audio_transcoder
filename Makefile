mu:
	arm-linux-gcc -c src/encode.c
	arm-linux-gcc -c src/decode.c
	arm-linux-gcc -c src/wav.c
	arm-linux-gcc -static decode.o encode.o wav.o -o main.exe src/main.c

clean:
	rm -f encode.o
	rm -f decode.o
	rm -f wav.o
	rm -f main.exe
