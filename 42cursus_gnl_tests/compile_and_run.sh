#!/bin/bash

GET_NEXT_LINE_FOLDER=$1
BONUS=$2
BUF_SIZE_TESTS=$3

# colors
GREEN=$'\033[92m'
WHITE=$'\033[97m'
MUTED=$'\033[1;30m'
RESET=$'\033[0m'
BOLD=$'\033[1m'
BG_GRAY=$'\033[48;5;237m'"$WHITE$BOLD"
BG_GREEN=$'\033[48;5;28m'"$WHITE$BOLD"
BG_RED=$'\033[48;5;9m'"$WHITE$BOLD"
CLEAR_LINE=$'\033[0K'

# bonus suffixes
BONUS_SUFFIX=""
if [ "$BONUS" == "yes" ]; then
    BONUS_SUFFIX="_bonus"
fi

# deletes contents of compiled folder for new test run
rm -f ./compiled/out-buf*
rm temp
printf "" > log.txt
clear

# failed test counter
FAILED=0

# compiled and run every test
for test_size in $BUF_SIZE_TESTS; do
    EXEC="./compiled/out-buf$test_size"

    # what files exist?
    FILEONE="$GET_NEXT_LINE_FOLDER/get_next_line$BONUS_SUFFIX.c"
    if [ ! -f $FILEONE ]; then
        FILEONE=""
    fi
    FILETWO="$GET_NEXT_LINE_FOLDER/get_next_line_utils$BONUS_SUFFIX.c"
    if [ ! -f $FILETWO ]; then
        FILETWO=""
    fi
    if [ "$FILEONE$FILETWO" = "" ]; then
        echo "Cannot find files: get_next_line$BONUS_SUFFIX.c or get_next_line_utils$BONUS_SUFFIX.c"
        exit 1
    fi

    # compile
    ./compile.sh $test_size $GET_NEXT_LINE_FOLDER $BONUS $FILEONE $FILETWO
    if [ ! $? -eq 0 ]; then
        exit $?
    fi

    echo "-------------- BUFFER_SIZE=$test_size --------------"$'\n' >> log.txt
    # run test
    echo "$GREEN$BOLD>$RESET Running tests: $MUTED(BUFFER_SIZE=$test_size)$RESET"
    ./run.sh $EXEC $BONUS
    TEMPFAIL="$?"
    FAILED=$(( $FAILED + $TEMPFAIL ))
    if [ $TEMPFAIL -eq 0 ]; then
        echo "All tests passed"$'\n' >> log.txt
    fi
done

if [ $FAILED -eq 0 ]; then
    RESULT="$BG_GREEN Passed $RESET"
else
    RESULT="$BG_RED Failed $RESET"
fi
printf "$GREEN$BOLD>$RESET %-30s $RESULT"$'\n' "Test summary:"
if [ $FAILED -eq 0 ]; then
    printf "$GREEN* Nice job, everything is working :)"$'\n'
else
    printf "$MUTED* %-30s $RESET%d"$'\n' "Failed" $FAILED
    printf "$MUTED* Check log.txt for more information of failed test"$'\n'
fi

# cleanup
rm temp
