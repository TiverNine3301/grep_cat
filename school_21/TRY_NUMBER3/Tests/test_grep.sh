#!/bin/bash

# Test 1: grep without flags
echo "Running Test 1: grep without flags..."
diff <(./src/grep/s21_grep "test" < tests/input1.txt) <(grep "test" tests/input1.txt)
if [ $? -eq 0 ]; then
    echo "Test 1: Passed"
else
    echo "Test 1: Failed"
fi

# Test 2: grep with -i flag (case-insensitive)
echo "Running Test 2: grep with -i flag..."
diff <(./src/grep/s21_grep -i "test" < tests/input1.txt) <(grep -i "test" tests/input1.txt)
if [ $? -eq 0 ]; then
    echo "Test 2: Passed"
else
    echo "Test 2: Failed"
fi

# Test 3: grep with -v flag (invert match)
echo "Running Test 3: grep with -v flag..."
diff <(./src/grep/s21_grep -v "test" < tests/input1.txt) <(grep -v "test" tests/input1.txt)
if [ $? -eq 0 ]; then
    echo "Test 3: Passed"
else
    echo "Test 3: Failed"
fi

# Test 4: grep with -c flag (count matching lines only)
echo "Running Test 4: grep with -c flag..."
diff <(./src/grep/s21_grep -c "test" < tests/input1.txt) <(grep -c "test" tests/input1.txt)
if [ $? -eq 0 ]; then
    echo "Test 4: Passed"
else
    echo "Test 4: Failed"
fi

# Test 5: grep with -l flag (output matching files only)
echo "Running Test 5: grep with -l flag..."
diff <(./src/grep/s21_grep -l "test" < tests/input1.txt tests/input2.txt) <(grep -l "test" tests/input1.txt tests/input2.txt)
if [ $? -eq 0 ]; then
    echo "Test 5: Passed"
else
    echo "Test 5: Failed"
fi

# Test 6: grep with -n flag (precede each matching line with a line number)
echo "Running Test 6: grep with -n flag..."
diff <(./src/grep/s21_grep -n "test" < tests/input1.txt) <(grep -n "test" tests/input1.txt)
if [ $? -eq 0 ]; then
    echo "Test 6: Passed"
else
    echo "Test 6: Failed"
fi

# Add more test cases for other flags and input files as needed
