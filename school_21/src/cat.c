#include "common.h"

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

    printf("File Contents:\n%s\n", buffer);

    free(buffer);
    return 0;
}