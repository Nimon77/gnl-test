#!/bin/bash

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

cp Makefile_42cursus_gnl_tests 42cursus_gnl_tests/Makefile
cp Makefile_gnlTester gnlTester/Makefile
find 42cursus_gnl_tests -name "*.sh" -exec chmod +x {} \;

cp ../get_next_line* .

printf "$BG_GREEN 42cursus_gnl_tests $RESET"$'\n'
cd 42cursus_gnl_tests
make

printf $'\n'"$BG_GRAY Test ended press return for next one $RESET"$'\n'
read -n 1 -s

printf "$BG_GREEN 42TESTERS-GNL $RESET"$'\n'
cd ../42TESTERS-GNL
bash all_tests.sh

printf $'\n'"$BG_GRAY Test ended press return for next one $RESET"$'\n'
read -n 1 -s

printf "$BG_GREEN GNL_lover $RESET"$'\n'
cd ../GNL_lover
cp ../get_next_line* copy_in_here_GNL_files/.
sh GNL_lover.sh

printf $'\n'"$BG_GRAY Test ended press return for next one $RESET"$'\n'
read -n 1 -s

printf "$BG_GREEN gnl_tester $RESET"$'\n'
cd ../gnl_tester
cp ../get_next_line* .
printf "$BG_GRAY BUFFER_SIZE 1 $RESET"$'\n'
bash run_tests.sh 1
printf "$BG_GRAY BUFFER_SIZE 5 $RESET"$'\n'
bash run_tests.sh 5
printf "$BG_GRAY BUFFER_SIZE 10 $RESET"$'\n'
bash run_tests.sh 10
printf "$BG_GRAY BUFFER_SIZE 20 $RESET"$'\n'
bash run_tests.sh 20
printf "$BG_GRAY BUFFER_SIZE 42 $RESET"$'\n'
bash run_tests.sh 42
printf "$BG_GRAY BUFFER_SIZE 10000000 $RESET"$'\n'
bash run_tests.sh 10000000

printf $'\n'"$BG_GRAY Test ended press return for next one $RESET"$'\n'
read -n 1 -s

printf "$BG_GREEN gnl-war-machine-v2019 $RESET"$'\n'
cd ../gnl-war-machine-v2019
cp ../get_next_line* .
./grademe.sh

printf $'\n'"$BG_GRAY Test ended press return for next one $RESET"$'\n'
read -n 1 -s

printf "$BG_GREEN gnlkiller $RESET"$'\n'
cd ../gnlkiller
cp ../get_next_line* .
sh test.sh > sortie_perso
DIFF=$(diff sortie_correct sortie_perso)
if [ "$DIFF" != "" ] ; then
  printf "$BG_RED diff not ok $RESET"$'\n'
  diff sortie_correct sortie_perso
else
  printf "$BG_GREEN diff ok $RESET"$'\n'
fi

printf $'\n'"$BG_GRAY Test ended press return for next one $RESET"$'\n'
read -n 1 -s

printf "$BG_GREEN gnl-unit-test $RESET"$'\n'
cd ../gnl-unit-test
cp ../get_next_line* .
./test.sh

printf $'\n'"$BG_GRAY Test ended press return for next one $RESET"$'\n'
read -n 1 -s

printf "$BG_GREEN gnlTester $RESET"$'\n'
cd ../gnlTester/
make

printf $'\n'"$BG_GRAY Test ended $RESET"$'\n'
