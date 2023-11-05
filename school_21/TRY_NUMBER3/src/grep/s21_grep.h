#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct forms {
    int e;
    char **template;
    int i;
    int v;
    int c;
    int l;
    int n;
    int h;
    int s;
    int f;
    char *path_to_f;
    int sum_pattern;
    int *files;
    int error;
};

void init_struct(struct forms *p, int argc);
void parse_flags(int argcount, struct forms *p, char *argument[]);
void find_flags(struct forms *p, int *number, int *check);
void find_templates_e(struct forms *p);
void find_pattrn_from_f(struct forms *p, char *optarg, int optind);
void op_fles(int argcount, char *argument[], struct forms *p);
void open_file_to_grep(struct forms *p, int *solo_file, int argc,
                       char *argument, int *num_file);
void str_print(int res, int *success, int *cnt_mtchs,
               struct forms *p, int *num_file,
               int *sngl_fl, char *name, char *mass,
               int *flag_l, int argc, int *counter_str);
void str_print_anti(int res, int *success, int *cnt_mtchs,
                    struct forms *p, int *num_file,
                    int *sngl_fl, char *name, char *mass,
                    int *flag_l, int argc, int *counter_str);
void printing(int *success, int *cnt_mtchs, int *sngl_fl,
              int *num_file, int *counter_str, int argc,
              char *mass, char *name, int *flag_l,
              struct forms *p);
char *s21_strcpy(char *dest, const char *src);
char *s21_strncpy(char *dest, const char *src, size_t n);
int count_files(struct forms *p, int argc);
int count_flags(struct forms *p, int argc);
void all_free_arr(struct forms *p);
void file_was_open(FILE *file, struct forms *p,
                   char *name, int argc,
                   int *sngl_fl, int *num_file);
// void fl_ws_op_e(FILE *file, struct forms *p, char *template, char *mass,
//                 char *name, int *sngl_fl);
// void print_if_v_0(char *mass, char *template, int *count_matches, struct forms *p,
//                   int *flag_l, char *name, int *single_file, int *count_str);
// void print_if_v_1(char *mass, char *template, int *count_matches, struct forms *p,
//                   int *flag_l, char *name, int *single_file, int *count_str);
// void print_to_flags(struct forms *p, int *single_fl, char *mass, int *count_str,
//                     char *name_file);
#endif  //  SRC_GREP_S21_GREP_H_
