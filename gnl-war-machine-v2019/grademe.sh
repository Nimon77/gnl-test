# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    grademe.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ahallain <ahallain@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/09 17:03:20 by ahallain          #+#    #+#              #
#    Updated: 2020/01/20 11:21:39 by ahallain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_TEST=$(pwd -P)

source ${PATH_TEST}/srcs/variables.sh
source ${PATH_TEST}/srcs/check_norme.sh
source ${PATH_TEST}/srcs/check_file.sh
source ${PATH_TEST}/srcs/print_header.sh

source ${PATH_TEST}/my_config.sh

cd ${PATH_TEST}

clear

printf "= Host-specific information ====================================================\n">${PATH_DEEPTHOUGHT}/deepthought
printf "$> hostname; uname -msr\n">>${PATH_DEEPTHOUGHT}/deepthought
hostname >>${PATH_DEEPTHOUGHT}/deepthought 2>&1
printf "$(uname -msr)\n" >>${PATH_DEEPTHOUGHT}/deepthought
printf "$> date\n">>${PATH_DEEPTHOUGHT}/deepthought
printf "$(date)\n" >>${PATH_DEEPTHOUGHT}/deepthought
printf "$> gcc --version\n">>${PATH_DEEPTHOUGHT}/deepthought
printf "$(gcc --version 2>&1)\n" >>${PATH_DEEPTHOUGHT}/deepthought
printf "$> clang --version\n">>${PATH_DEEPTHOUGHT}/deepthought
printf "$(clang --version)\n\n" >>${PATH_DEEPTHOUGHT}/deepthought

for file in "${FILES[@]}"
do
	printf "$> cp ${PATH_GNL}/$file ${PATH_TEST}/$file\n" >>${PATH_DEEPTHOUGHT}/deepthought
	cp ${PATH_GNL}/$file ${PATH_TEST}/$file >>${PATH_DEEPTHOUGHT}/deepthought 2>&1
done

echo "" >>${PATH_DEEPTHOUGHT}/deepthought

if [ $NORM -eq 1 ]
then
	for file in "${FILES[@]}"
	do
		print_header $file
		printf "Norme\n"
		printf "$file ===================================================\n">>${PATH_TEST}/deepthought
		check_norme $file
		printf "\n"
		printf "\n">>${PATH_TEST}/deepthought
	done
fi

print_header "Testing"

printf "If you have an error on the BUFFER_SIZE of -1 and 0 it's normal\n\n"
printf "${COLOR_TITLE}${UNDERLINE}\033[0GBUFFER_SIZE"
printf "\033[20GCOMPIL."
printf "\033[40GDIFF"
printf "\033[70GLEAKS"
printf "\033[80GRESULT\n${DEFAULT}"

if ls ${PATH_TEST}/tests/user_output_buff_* 1> /dev/null 2>&1
then
	rm ${PATH_TEST}/tests/user_output_buff_*
fi
if ls ${PATH_TEST}/BUFF_* 1> /dev/null 2>&1
then
	rm ${PATH_TEST}/BUFF_*
fi

for size in "${BUFFER_SIZE[@]}"
do
	printf "BUFFER_SIZE=$size ===================================================\n">>${PATH_TEST}/deepthought
	check_file $size
	printf "\n"
	printf "\n">>${PATH_TEST}/deepthought
done

for file in "${FILES[@]}"
do
	rm ${PATH_TEST}/$file
done

printf "\n\nA deepthought file has been generated in ${COLOR_DEEPTHOUGHT_PATH}${PATH_TEST}\n\n${DEFAULT}"
