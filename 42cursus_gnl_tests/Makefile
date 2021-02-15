# get next line folder, where are your files located?
GET_NEXT_LINE_FOLDER=./get_next_line

# test bonus?
# set to 'yes' or 'no'
BONUS=no

# what buffer sizes to test, seperated by space
BUF_SIZE_TESTS="1 2 5 6 20 25 1024 5000 10000000"

all:
	./compile_and_run.sh $(GET_NEXT_LINE_FOLDER) $(BONUS) $(BUF_SIZE_TESTS)

# force bonus to yes
bonus:
	./compile_and_run.sh $(GET_NEXT_LINE_FOLDER) yes $(BUF_SIZE_TESTS)