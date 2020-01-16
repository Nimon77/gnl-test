# gnl_tester

This is a project by @lgrellie, i.e. Léonard Grellier.

It was designed to test 42's Get Next Line project (pdf in repo).

This is a diff tester. It does not check the norm, leaks or forbidden functions.

Simply paste your .c and .h files in the base directory and execute ./run_tests X where X is the desired BUFFER_SIZE. My advice is to test it with BUFFER_SIZE = 1 through 8, and with large values.

The generate_tests.sh script uses /dev/urandom to make 100 random test files found in src/
Feel free to edit its parameters to properply test your project.

Some fixed basic tests are also provided.

If your output differs from the test files, information on the diffs will be found in ./diffs

Good luck :)
