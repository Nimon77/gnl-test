cp ../get_next_line* .
cd 42cursus_gnl_tests
make

read -n 1 -s

cd ../42TESTERS-GNL
sh all_tests.sh

read -n 1 -s

cd ../GNL_lover
cp ../get_next_line* copy_in_here_GNL_files/.
sh GNL_lover.sh

read -n 1 -s

cd ../gnl_tester
cp ../get_next_line* .
bash run_tests.sh 1
bash run_tests.sh 5
bash run_tests.sh 10
bash run_tests.sh 20
bash run_tests.sh 42
bash run_tests.sh 10000000

read -n 1 -s

cd ../gnl-war-machine-v2019
cp ../get_next_line* .
./grademe.sh

read -n 1 -s

cd ../gnlkiller
cp ../get_next_line* .
sh test.sh > sortie_perso
diff sortie*

