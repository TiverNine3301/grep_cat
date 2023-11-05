# Makefile
CC = gcc
CFLAGS = -std=c11

all: cat grep

cat: cat.c common.c
    $(CC) $(CFLAGS) -o cat cat.c common.c

grep: grep.c common.c
    $(CC) $(CFLAGS) -o grep grep.c common.c

.PHONY: clean
clean:
    rm -f cat grep
