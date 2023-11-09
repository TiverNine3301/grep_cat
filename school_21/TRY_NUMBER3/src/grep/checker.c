#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    FILE *fileGREP;
    FILE *fileMYGREP;
    fileGREP = fopen("./RESGREP", "r");
    fileMYGREP = fopen("./RESMYGREP", "r");
    int grep = 0, mygrep = 0, check = 1;
    while (check && (grep != EOF || mygrep != EOF)) {
        grep = getc(fileGREP);
        mygrep = getc(fileMYGREP);
        if (grep != mygrep) {
            check = 0;
            printf("TEST FAILED");
        }
    }
    if (check == 1) {
        printf("TEST SUCCESS");
    }

    return 0;  // Возвращаем 0, чтобы указать успешное завершение программы
}
