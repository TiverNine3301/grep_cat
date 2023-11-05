#include "common.h"
#include <string.h>

int main(int argc, char *argv[]) {
    char *filename;
    int flag;

    if (parse_args(argc, argv, &filename, &flag)) {
        return 1;
    }

    char *buffer;
    if (read_file(filename, &buffer)) {
        return 1;
    }

    char *line = strtok(buffer, "\n");
    while (line != NULL) {
        if (strstr(line, argv[2]) != NULL) {
            printf("%s\n", line);
        }
        line = strtok(NULL, "\n");
    }

    free(buffer);
    return 0;
}