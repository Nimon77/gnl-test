# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check_norme.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ahallain <ahallain@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/09 18:05:05 by ahallain          #+#    #+#              #
#    Updated: 2019/11/12 15:14:18 by ahallain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

check_norme()
{
	printf "$> norminette ${PATH_GNL}/$1 | grep -E '(Error|Warning)'\n">>${PATH_DEEPTHOUGHT}/deepthought
	NORME_VAR=$(norminette ${PATH_TEST}/$1 2>&1)
	if echo "$NORME_VAR" | grep -q command
	then
		printf "${COLOR_WARNING}not found${DEFAULT}\n"
		printf "\nnorminette : command not found\n\n" >>${PATH_DEEPTHOUGHT}/deepthought
	elif echo "$NORME_VAR" | grep -qE '(Error|Warning)'
	then
		printf "${COLOR_FAIL}check failed${DEFAULT}\n"
		echo "$NORME_VAR" | grep -E '(Error|Warning)' >> ${PATH_DEEPTHOUGHT}/deepthought 2>&1
		printf "Norme check failed\n" >> ${PATH_DEEPTHOUGHT}/deepthought
	else
		printf "${COLOR_OK}ok${DEFAULT}\n"
	fi
}
