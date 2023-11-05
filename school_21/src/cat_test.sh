# Путь к вашей утилите cat
CAT=./cat

# Путь к стандартной утилите cat
STANDARD_CAT=cat

# Файл с тестовыми данными
TEST_FILE=test.txt

# Создание файла с тестовыми данными
echo "Test Data" > $TEST_FILE

# Сравнение вывода вашей утилиты с стандартной утилитой cat
if [ "$($CAT $TEST_FILE)" = "$($STANDARD_CAT $TEST_FILE)" ]; then
    echo "cat test: Passed"
else
    echo "cat test: Failed"
fi

# Удаление временного файла
rm $TEST_FILE