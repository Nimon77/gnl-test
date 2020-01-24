# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    variables.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ahallain <ahallain@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/09 18:12:48 by ahallain          #+#    #+#              #
#    Updated: 2019/11/26 18:02:22 by ahallain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DEFAULT="\033[0m"
BOLD="\033[1m"
UNDERLINE="\033[4m"
BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PURPLE="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

TITLE_LENGTH=92
CHAR_LENGTH="-"
CHAR_WIDTH="|"

FILES=(
	get_next_line.c
	get_next_line.h
	get_next_line_utils.c
)

CHECK_FILES=(
	line.txt
	n.txt
	void.txt
	Mr._Justice_Maxell_by_Edgar_Wallace.txt
	63_line
	lorem_ipsum
	63_line_nl
	baudelaire.txt
	many_lines
	64_line
	empty
	multi_in_one
	64_line_nl
	empty_one
	one_big_fat_line.txt
	65_line
	expected_result
	over_buffer
	65_line_nl
	large_file.txt
	simple
)