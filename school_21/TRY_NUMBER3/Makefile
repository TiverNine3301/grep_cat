CC = gcc
CFLAGS = -std=c11 -Wall -Werror -Wextra -pedantic -O2
LDFLAGS = -lm

CAT_SRC_DIR = src/cat
CAT_SRCS = $(wildcard $(CAT_SRC_DIR)/*.c)
CAT_OBJS = $(CAT_SRCS:.c=.o)
CAT_EXECUTABLE = $(CAT_SRC_DIR)/s21_cat

GREP_SRC_DIR = src/grep
GREP_SRCS = $(wildcard $(GREP_SRC_DIR)/*.c)
GREP_OBJS = $(GREP_SRCS:.c=.o)
GREP_EXECUTABLE = $(GREP_SRC_DIR)/s21_grep

COMMON_MODULE_DIR = src/common
COMMON_MODULE_SRC = $(COMMON_MODULE_DIR)/common_module.c
COMMON_MODULE_OBJ = $(COMMON_MODULE_SRC:.c=.o)

.PHONY: all cat grep clean

all: cat grep

cat: $(CAT_EXECUTABLE)

$(CAT_EXECUTABLE): $(CAT_OBJS) $(COMMON_MODULE_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

$(CAT_SRC_DIR)/%.o: $(CAT_SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

grep: $(GREP_EXECUTABLE)

$(GREP_EXECUTABLE): $(GREP_OBJS) $(COMMON_MODULE_OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(GREP_SRC_DIR)/%.o: $(GREP_SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(COMMON_MODULE_OBJ): $(COMMON_MODULE_SRC)
	$(CC) $(CFLAGS) -Wno-error=sign-compare -c -o $@ $<

clean:
	rm -f $(CAT_EXECUTABLE) $(CAT_OBJS) $(GREP_EXECUTABLE) $(GREP_OBJS) $(COMMON_MODULE_OBJ)
