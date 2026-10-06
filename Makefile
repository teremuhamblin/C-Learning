CC=gcc
CFLAGS=-Wall -Wextra -std=c11

SRC=$(wildcard src/*.c)
EXE=$(SRC:.c=)

all: $(EXE)

%: %.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f src/*.o src/*~ src/*exe
