#!/bin/bash

SUCCESS=0
FAIL=0
COUNTER=0

declare -a tests=(
"-e 'pattern' *.txt"
"-i 'pattern' *.txt"
"-v 'pattern' *.txt"
"-c 'pattern' *.txt"
"-l 'pattern' *.txt"
"-n 'pattern' *.txt"
"-h 'pattern' *.txt"
"-s 'pattern' *.txt"
"-f keywords.txt fruits.txt"
"-o 'pattern' *.txt"
"-iv *.txt"
"-in apple *.txt"
)

testing()
{
    orig_result=$(eval "grep $@")
    custom_result=$(valgrind --tool=memcheck --leak-check=yes ./s21_grep $@)
    
    (( COUNTER++ ))
    if [[ "$orig_result" == "$custom_result" ]]
    then
        (( SUCCESS++ ))
        echo "\033[32msuccess\033[0m: grep $@"
    else
        (( FAIL++ ))
        echo "\033[31mfail\033[0m: grep $@"
        echo "Original:"
        echo "$orig_result"
        echo "Custom:"
        echo "$custom_result"
    fi
}

for test_case in "${tests[@]}"
do
    testing $test_case
done

echo "Total tests: $COUNTER"
echo "Success: $SUCCESS"
echo "Fail: $FAIL"
