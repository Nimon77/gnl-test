cd 42cursus_gnl_tests
make
cd ../42TESTERS
sh all_tests.sh
cd ../Get_Next_Line_Tester
bash run.sh
cd ../GNL_lover
cp ../get_next_line* copy_in_here_GNL_files/.
sh GNL_lover.sh
cd ../gnl_tester
cp ../get_next_line* .
bash run_tests.sh
cd ../gnlkiller
cp ../get_next_line* .
sh test.sh

