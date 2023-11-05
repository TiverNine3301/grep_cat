#ifndef COMMON_H
#define COMMON_H

#include <stdio.h>

// Функция для чтения содержимого файла и записи его в буфер
int read_file(const char *filename, char **buffer);

// Функция для записи строки в файл
int write_to_file(const char *filename, const char *data);

// Функция для парсинга аргументов командной строки
int parse_args(int argc, char *argv[], char **filename, int *flag);

#endif