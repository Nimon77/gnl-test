# 42cursus_gnl_tests
Unit tests for get next line, new subject!
**Make an issue on github if you're having issues**

## how to use
specify your get_next_line folder in the `Makefile`
(optionally toggle bonus tests or change what buffer sizes to test)

and then run:
```sh
make # runs all tests
```

# customize
You can customize these tests a bit. If you feel like some tests or changes may be useful to others, feel free to make a PR

### New tests
You can add test files and the expected output in `/tests/normal` and `/answers/normal` respectively. they will automatically be ran

### Different buffer sizes
In the makefile you can see a list of buffer sizes it tests, you can add or remove any you like. (or add your own makefile rules for it to not run all tests at once)

## Disclaimer
I cant gaurantee any of this will make you pass moulinette. This is just a set of tests I wrote for myself and made open source so others can make use of it.
If you have any issues with the tests **Make an issue.**
