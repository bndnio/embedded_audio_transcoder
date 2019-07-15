mu:
	arm-linux-gcc -c src/encode.c
	arm-linux-gcc -c src/decode.c
	arm-linux-gcc -static decode.o encode.o -o main.exe src/main.c

clean:
	rm main.exe
	rm encode.o
	rm decode.o