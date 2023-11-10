#!/bin/bash

rm -rf ./ResGrep/GrepTest.txt

#=============================

echo Test 1 >> ./ResGrep/GrepTest.txt
grep 1 *.txt > ./RESGREP
./s21_grep 1 *.txt > ./RESMYGREP
gcc ./checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 2 >> ./ResGrep/GrepTest.txt
grep -e 1 -e 2 *.txt > ./RESGREP
./s21_grep -e 1 -e 2 *.txt > ./RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 3 >> ./ResGrep/GrepTest.txt
grep -e A -i *.txt > ./RESGREP
./s21_grep -e A -i *.txt > ./RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 4 >> ./ResGrep/GrepTest.txt
grep -f REGEX *.txt > RESGREP
./s21_grep -f REGEX *.txt > ./RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 5 >> ./ResGrep/GrepTest.txt
grep -e 1 -s -h *.txt > RESGREP
./s21_grep -e 1 -s -h *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 6 >> ./ResGrep/GrepTest.txt
grep -v 213 *.txt > RESGREP
./s21_grep -v 213 *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 7 >> ./ResGrep/GrepTest.txt
grep -s 2 -l 1 *.txt > RESGREP
./s21_grep -s 2 -l 1 *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 8 >> ./ResGrep/GrepTest.txt
grep 1 -n *.txt > RESGREP
./s21_grep 1 -n *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 9 >> ./ResGrep/GrepTest.txt
grep 1 -c -h *.txt > RESGREP
./s21_grep 1 -c -h *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 10 >> ./ResGrep/GrepTest.txt
grep -e A -i -v *.txt > RESGREP
./s21_grep -e A -i -v *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 11 >> ./ResGrep/GrepTest.txt
grep -l 1 *.txt > RESGREP
./s21_grep -l 1 *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 12 >> ./ResGrep/GrepTest.txt
grep A -c -i  *.txt > RESGREP
./s21_grep A -c -i *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 13 >> ./ResGrep/GrepTest.txt
grep 1 *.txt > RESGREP
./s21_grep 1 *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 14 >> ./ResGrep/GrepTest.txt
grep ABOBA -i *.txt > RESGREP
./s21_grep ABOBA -i *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 15 >> ./ResGrep/GrepTest.txt
grep 1 -c *.txt > RESGREP
./s21_grep 1 -c *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 16 >> ./ResGrep/GrepTest.txt
grep 1 -v *.txt > RESGREP
./s21_grep 1 -v *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 17 >> ./ResGrep/GrepTest.txt
grep 1 *.txt > RESGREP
./s21_grep 1 *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 18 >> ./ResGrep/GrepTest.txt
grep -h *.txt > RESGREP
./s21_grep -h *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 19 >> ./ResGrep/GrepTest.txt
grep -s *.txt > RESGREP
./s21_grep -s *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 20 >> ./ResGrep/GrepTest.txt
grep -f keywords.txt fruits.txt > RESGREP
./s21_grep -f keywords.txt fruits.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 21 >> ./ResGrep/GrepTest.txt
grep -o *.txt > RESGREP
./s21_grep -o *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 22 >> ./ResGrep/GrepTest.txt
grep -iv *.txt > RESGREP
./s21_grep -iv *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo Test 23 >> ./ResGrep/GrepTest.txt
grep -in apple *.txt > RESGREP
./s21_grep -in apple *.txt > RESMYGREP
gcc checker.c -o checker
./checker >> ./ResGrep/GrepTest.txt
rm -rf checker RES*
echo -en '\n\n' >> ./ResGrep/GrepTest.txt

#=============================

echo 'The test GREP is over.'
cat ./ResGrep/GrepTest.txt