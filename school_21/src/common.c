#include "common.h"
#include <stdlib.h>

int read_file(const char *filename, char **buffer) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Failed to open file");
        return 1;
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    rewind(file);

    *buffer = (char *)malloc(file_size + 1);
    if (*buffer == NULL) {
        perror("Memory allocation error");
        fclose(file);
        return 1;
    }

    fread(*buffer, file_size, 1, file);
    (*buffer)[file_size] = '\0';

    fclose(file);
    return 0;
}

int write_to_file(const char *filename, const char *data) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Failed to open file");
        return 1;
    }

    fprintf(file, "%s", data);
    fclose(file);
    return 0;
}

int parse_args(int argc, char *argv[], char **filename, int *flag) {
    if (argc != 3) {
        printf("Usage: %s <filename> <flag>\n", argv[0]);
        return 1;
    }

    *filename = argv[1];
    *flag = atoi(argv[2]);
    return 0;
}