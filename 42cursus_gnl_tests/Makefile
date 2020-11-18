# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:      :+:    :+:    #
#                                                      +:+                     #
#    By: jvan-sni <jvan-sni@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2019/10/28 16:59:45 by jvan-sni       #+#    #+#                 #
#    Updated: 2020/11/18 20:43:23 by nsimon           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# edit this to your get_next_line folder
GET_NEXT_LINE_FOLDER = ../

# dont touch this plz
TESTS = 1 2 5 6 20 25 1024 5000 10000000
ALLTESTS = ${addprefix buf, $(TESTS)}
NAME = a.out
FLAGS = -Wextra -Werror -Wall
BUFFER_SIZE=32
VARS = -D BUFFER_SIZE=${BUFFER_SIZE}
CC = gcc
SH = /bin/sh

FILES = get_next_line.c \
	get_next_line_utils.c
REALFILES = $(addprefix $(GET_NEXT_LINE_FOLDER), $(FILES))

CMD = $(CC) -I $(GET_NEXT_LINE_FOLDER) -o $(NAME) $(REALFILES) test.c $(FLAGS)

# run all tests
test: $(ALLTESTS) fclean

# compiling
$(NAME):
	$(CMD) $(VARS)

fclean:
	@rm -f $(NAME)

re: fclean all

# all tests
buf1:
	@$(CMD) -D BUFFER_SIZE=1
	@sh run_test.sh "1"
buf2:
	@$(CMD) -D BUFFER_SIZE=2
	@sh run_test.sh "2"
buf5:
	@$(CMD) -D BUFFER_SIZE=5
	@sh run_test.sh "5"
buf6:
	@$(CMD) -D BUFFER_SIZE=6
	@sh run_test.sh "6"
buf20:
	@$(CMD) -D BUFFER_SIZE=20
	@sh run_test.sh "20"
buf25:
	@$(CMD) -D BUFFER_SIZE=25
	@sh run_test.sh "25"
buf1024:
	@$(CMD) -D BUFFER_SIZE=1024
	@sh run_test.sh "1024"
buf5000:
	@$(CMD) -D BUFFER_SIZE=5000
	@sh run_test.sh "5000"
buf10000000:
	@$(CMD) -D BUFFER_SIZE=10000000
	@sh run_test.sh "10000000"

.PHONY: test
