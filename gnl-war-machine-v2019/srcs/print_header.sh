# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    print_header.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ahallain <ahallain@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/09 19:03:40 by ahallain          #+#    #+#              #
#    Updated: 2019/11/09 19:05:15 by ahallain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

print_header()
{
	printf "${BLUE}"
	text=$1
	printf "${COLOR_TITLE}"
	printf "%.s${CHAR_LENGTH}" $(seq 1 ${TITLE_LENGTH})
	printf "\n${CHAR_WIDTH}\033[$(( (${TITLE_LENGTH} - ${#text}) / 2 ))G${text}\033[${TITLE_LENGTH}G${CHAR_WIDTH}\n"
	printf "%.s${CHAR_LENGTH}" $(seq 1 ${TITLE_LENGTH})
	printf "\n\n${DEFAULT}"
}