#include "s21_grep.h"
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc > 1) {
        struct forms new;
        init_struct(&new, argc);
        parse_flags(argc, &new, argv);
        if (!new.error) op_fles(argc, argv, &new);
        all_free_arr(&new);
    }
    return 0;
}

void init_struct(struct forms *p, int argc) {
    p->e = 0;
    p->template = (char **)malloc(1 * sizeof(char *));
    p->template[0] = '\0';
    p->v = 0;
    p->c = 0;
    p->l = 0;
    p->n = 0;
    p->h = 0;
    p->s = 0;
    p->f = 0;
    p->path_to_f = '\0';
    p->sum_pattern = 0;
    p->files = (int *)malloc((argc) * sizeof(int));
    p->files[0] = 0;
    for (int i = 1; i < argc; i++) p->files[i] = 1;
    p->error = 0;
}

void parse_flags(int argcount, struct forms *p, char *argument[]) {
    int check = 1;
    while (check) {
        int c = getopt_long(argcount, argument, "e:ivclnhsf:o", 0, 0);
        find_flags(p, &c, &check);
    }
}

void find_flags(struct forms *p, int *number, int *check) {
    if (*number == -1) {
        *check = 0;
    } else {
        if (*number == 'e') {
            find_templates_e(p);
        } else if (*number == 'i') {
            p->i = 1;
            p->files[optind - 1] = 0;
        } else if (*number == 'v') {
            p->v = 1;
            p->files[optind - 1] = 0;
        } else if (*number == 'c') {
            p->c = 1;
            p->files[optind - 1] = 0;
        } else if (*number == 'l') {
            p->l = 1;
            p->files[optind - 1] = 0;
        } else if (*number == 'n') {
            p->n = 1;
            p->files[optind - 1] = 0;
        } else if (*number == 'h') {
            p->h = 1;
            p->files[optind - 1] = 0;
        } else if (*number == 's') {
            p->s = 1;
            p->files[optind - 1] = 0;
        } else if (*number == 'f') {
            find_pattrn_from_f(p, optarg, optind);
        }
        if (*number == '?') {
            p->error = 1;
        }
    }
}

void find_templates_e(struct forms *p) {
    p->e++;
    p->sum_pattern++;
    p->template = (char **)realloc(p->template, (p->sum_pattern) * sizeof(char *));
    p->template[p->sum_pattern - 1] = (char *)malloc((strlen(optarg) + 1) * sizeof(char));
    s21_strcpy(p->template[p->sum_pattern - 1], optarg);
    p->files[optind - 1] = 0;
    p->files[optind - 2] = 0;
}

void find_pattrn_from_f(struct forms *p, char *optarg, int optind) {
    p->f++;
    p->path_to_f = optarg;
    p->files[optind - 1] = 0;
    p->files[optind - 2] = 0;
    if (p->f) {
        p->sum_pattern++;
        FILE *file;
        char *line = NULL;
        size_t len = 8192;
        int i = --p->sum_pattern;
        if ((file = fopen(p->path_to_f, "r")) != NULL) {
            while (fgets(line, len, file) != NULL) {
                p->template = (char **)realloc(p->template, (i + 1) * sizeof(char *));
                p->template[i] = (char *)malloc((strlen(line) + 1) * sizeof(char));

                // Удаление символа новой строки, если он есть
                size_t line_length = strlen(line);
                if (line_length > 0 && line[line_length - 1] == '\n') {
                    line[line_length - 1] = '\0';
                }

                strcpy(p->template[i], line);
                i++;
                p->sum_pattern = i;
            }
            free(line);
            fclose(file);
        }
    }
}


void op_fles(int argcount, char *argument[], struct forms *p) {
    int i = 0, check = 1, solo_file = 0, num_file;
    while (check) {
        if (i >= count_flags(p, argcount)) {
            if (p->sum_pattern == 0) {
                p->sum_pattern += 1;
                p->template = (char **)realloc(p->template, 1 * sizeof(char *));
                p->template[0] = *(argument + i);
                p->files[i] = 0;
            } else {
                open_file_to_grep(p, &solo_file, argcount, argument[i], &num_file);
            }
        }
        if (++i == argcount) check = 0;

        num_file++;
    }
}

void open_file_to_grep(struct forms *p, int *solo_file, int argc, char *argument, int *num_file) {
    if (count_files(p, argc) == 1) *solo_file = 1;
    FILE *file;
    char *name = argument;
    if ((file = fopen(name, "r")) != NULL) {
        file_was_open(file, p, name, argc, solo_file, num_file);
        fclose(file);
    }
}

void file_was_open(FILE *file, struct forms *p, char *name, int argc,
                   int *sngl_fl, int *num_file) {
    int flag_l = 1, counter_str = 0, success, cnt_mtchs = 0;
    char mass[9999] = {'\0'};
    regex_t regex;
    int reti;
    int flag = 0;
    if (p->i)
        flag = REG_ICASE;
    while (fgets(mass, 9999, file) != NULL && flag_l) {
        success = 0;
        counter_str++;
        for (int i = 0; i < p->sum_pattern && !success; i++) {
            reti = regcomp(&regex, p->template[i], flag);
            reti = regexec(&regex, mass, 0, NULL, 0);
            if (p->v == 0) {
                str_print(reti, &success, &cnt_mtchs, p, num_file,
                          sngl_fl, name, mass, &flag_l, argc, &counter_str);
            } else {
                str_print_anti(reti, &success, &cnt_mtchs, p, num_file,
                               sngl_fl, name, mass, &flag_l, argc, &counter_str);
            }
            if (mass[strlen(mass) - 1] != '\n' && success) printf("\n");
            regfree(&regex);
        }
    }
    if (p->c) {
        if (!p->h)
            printf("%s:%d\n", name, cnt_mtchs);
        else
            printf("%d\n", cnt_mtchs);
    }
}

void str_print(int res, int *success, int *cnt_mtchs, struct forms *p, int *num_file,
               int *sngl_fl, char *name, char *mass, int *flag_l, int argc, int *counter_str) {
    if (!res) printing(success, cnt_mtchs, sngl_fl,
                       num_file, counter_str, argc,
                       mass, name, flag_l, p);
}

void str_print_anti(int res, int *success, int *cnt_mtchs,
                    struct forms *p, int *num_file,
                    int *sngl_fl, char *name, char *mass,
                    int *flag_l, int argc, int *counter_str) {
    if (res) printing(success, cnt_mtchs, sngl_fl,
                      num_file, counter_str, argc,
                      mass, name, flag_l, p);
}

void printing(int *success, int *cnt_mtchs, int *sngl_fl,
              int *num_file, int *counter_str, int argc,
              char *mass, char *name, int *flag_l,
              struct forms *p) {
    *success = 1;
    *cnt_mtchs += 1;
    if (!p->c) {
        if (!p->h && !p->l) {
            if (!*sngl_fl) {
                printf("%s:", name);
            }
        }
        if (p->l) {
            *flag_l = 0;
            if (*num_file != count_files(p, argc)) {
                printf("%s\n", name);
            } else {
                printf("%s\n", name);
            }
        } else {
            if (!p->n) {
                printf("%s", mass);
            } else {
                printf("%d:%s", *counter_str, mass);
            }
        }
    }
}

char *s21_strcpy(char *dest, const char *src) {
    char *tmp = dest;
    while ((*dest++ = *src++) != 0) {
    }
    return tmp;
}

char *s21_strncpy(char *dest, const char *src, size_t n) {
    char *temp = dest;
    int ttp = 0;
    while ((*dest++ = *src++) && ttp++ < (int)n) {
    }
    return temp;
}

int count_files(struct forms *p, int argc) {
    int sum = 0;
    for (int i = 0; i < argc; i++) {
        if (p->files[i]) sum++;
    }
    return sum;
}

int count_flags(struct forms *p, int argc) {
    int sum = 0;
    for (int i = 0; i < argc; i++) {
        if (!p->files[i]) sum++;
    }
    return sum;
}

void all_free_arr(struct forms *p) {
    if (p->e || p->f) {
        for (int i = 0; i < p->sum_pattern; i++) {
            free(*(p->template + i));
        }
    }
    free(p->template);
    free(p->files);
}
