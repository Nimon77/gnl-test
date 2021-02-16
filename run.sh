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

find 42cursus_gnl_tests -name "*.sh" -exec chmod +x {} \;

cp ../get_next_line* .

printf "$BG_GREEN 42cursus_gnl_tests $RESET"$'\n'
cd 42cursus_gnl_tests
make

read -n 1 -s

printf "$BG_GREEN 42TESTERS-GNL $RESET"$'\n'
cd ../42TESTERS-GNL
sh all_tests.sh

read -n 1 -s

printf "$BG_GREEN GNL_lover $RESET"$'\n'
cd ../GNL_lover
cp ../get_next_line* copy_in_here_GNL_files/.
sh GNL_lover.sh

read -n 1 -s

printf "$BG_GREEN gnl_tester $RESET"$'\n'
cd ../gnl_tester
cp ../get_next_line* .
bash run_tests.sh 1
bash run_tests.sh 5
bash run_tests.sh 10
bash run_tests.sh 20
bash run_tests.sh 42
bash run_tests.sh 10000000

read -n 1 -s

printf "$BG_GREEN gnl-war-machine-v2019 $RESET"$'\n'
cd ../gnl-war-machine-v2019
cp ../get_next_line* .
./grademe.sh

read -n 1 -s

printf "$BG_GREEN gnlkiller $RESET"$'\n'
cd ../gnlkiller
cp ../get_next_line* .
sh test.sh > sortie_perso
diff sortie*
