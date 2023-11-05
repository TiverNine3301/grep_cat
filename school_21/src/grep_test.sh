# Путь к вашей утилите grep
GREP=./grep

# Путь к стандартной утилите grep
STANDARD_GREP=grep

# Файл с тестовыми данными
TEST_FILE=test.txt

# Создание файла с тестовыми данными
echo "This is a test file" > $TEST_FILE

# Тест 1: Поиск строки "test" в файле
if [ "$($GREP $TEST_FILE test)" = "$($STANDARD_GREP test $TEST_FILE)" ]; then
    echo "grep test 1: Passed"
else
    echo "grep test 1: Failed"
fi

# Тест 2: Поиск строки "is" в файле
if [ "$($GREP $TEST_FILE is)" = "$($STANDARD_GREP is $TEST_FILE)" ]; then
    echo "grep test 2: Passed"
else
    echo "grep test 2: Failed"
fi

# Удаление временного файла
rm $TEST_FILE
