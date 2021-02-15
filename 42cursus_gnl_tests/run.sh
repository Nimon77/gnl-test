#!/bin/bash

# config
TEST_FOLDER="./tests/normal/"
TEST_BONUS_FOLDER="./tests/bonus/"
ANSWER_FOLDER="./answers/normal/"
ANSWER_BONUS_FOLDER="./answers/bonus/"
TEST_NORMAL_PRINT="normal/"

# colors
GREEN=$'\033[92m'
RED=$'\033[91m'
MUTED=$'\033[1;30m'

# test failed counter
FAILED=0

logToFile() {
    # log to file
    echo "Failed test $3" >> log.txt
    echo "Expected:" >> log.txt
    echo "---" >> log.txt
    cat $1 >> log.txt
    echo "---"$'\n' >> log.txt
    echo "But got:" >> log.txt
    echo "---" >> log.txt
    cat $2 >> log.txt
    echo "---"$'\n\n' >> log.txt
}

# normal tests
for FILE in $(ls $TEST_FOLDER); do
    # run normal test with file descriptor
    printf "$MUTED* Running fd-$FILE "$'\r'
    $1 $TEST_FOLDER$FILE > temp

    # check if wrong answer
    if diff "$ANSWER_FOLDER$FILE" temp > /dev/null; then
        printf "$GREEN*$MUTED Passed fd-$FILE "$'\n'
    else
        FAILED=$(($FAILED + 1))
        logToFile "$ANSWER_FOLDER$FILE" temp "fd-$TEST_NORMAL_PRINT$FILE"
        printf "$RED*$MUTED Failed fd-$FILE - Added to log"$'\n'
    fi

    # run normal test with stdin
    if [ "${FILE}" != "INVALID_FD" ]; then
        printf "$MUTED* Running stdin-$FILE "$'\r'
        cat $TEST_FOLDER$FILE | $1 > temp

        # check if wrong answer
        if diff "$ANSWER_FOLDER$FILE" temp > /dev/null; then
            printf "$GREEN*$MUTED Passed stdin-$FILE "$'\n'
        else
            FAILED=$(($FAILED + 1))
            logToFile "$ANSWER_FOLDER$FILE" temp "stdin-$TEST_NORMAL_PRINT$FILE"
            printf "$RED*$MUTED Failed stdin-$FILE - Added to log"$'\n'
        fi

    fi
done

if [ "$2" = "yes" ]; then
    # bonus test
    printf "$MUTED* Running bonus - mixed files "$'\r'
    $1 "$TEST_BONUS_FOLDER/1.txt" "$TEST_BONUS_FOLDER/2.txt" > temp
    if diff "$ANSWER_BONUS_FOLDER/1.txt" temp > /dev/null; then
        printf "$GREEN*$MUTED Passed bonus - mixed files "$'\n'
    else
        FAILED=$(($FAILED + 1))
        logToFile "$ANSWER_BONUS_FOLDER/1.txt" temp "bonus-mixedfiles"
        printf "$RED*$MUTED Failed bonus - mixed files - Added to log"$'\n'
    fi
fi

echo ""
exit $FAILED
