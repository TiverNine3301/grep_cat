#!/bin/bash

# Test 1: cat without flags
echo "Running Test 1: cat without flags..."
diff <(./src/cat/s21_cat < tests/inputs/input1.txt) <(cat tests/expected_results/expected_output1.txt)
if [ $? -eq 0 ]; then
    echo "Test 1: Passed"
else
    echo "Test 1: Failed"
fi

# Test 2: cat with -n flag
echo "Running Test 2: cat with -n flag..."
diff <(./src/cat/s21_cat -n < tests/inputs/input2.txt) <(cat -n tests/expected_results/expected_output2.txt)
if [ $? -eq 0 ]; then
    echo "Test 2: Passed"
else
    echo "Test 2: Failed"
fi
