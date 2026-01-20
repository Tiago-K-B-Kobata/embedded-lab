CC=arm-none-eabi-gcc

CFLAGS=-mcpu=cortex-m3 -mthumb -O0 -g -ffreestanding -nostdlib
LDFLAGS=-T linker.ld

all: firmware.elf

firmware.elf: startup.o main.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

startup.o: startup.s
	$(CC) $(CFLAGS) -c $<

main.o: main.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o firmware.elf
