# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    test.sh                                            :+:    :+:             #
#                                                      +:+                     #
#    By: jvan-sni <jvan-sni@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2019/11/20 16:30:42 by jvan-sni       #+#    #+#                 #
#    Updated: 2019/11/20 17:47:25 by jvan-sni      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# colors
GREEN="\033[92m"
REDBG="\033[101m"
RED="\033[91m"
MUTED="\033[1;30m"
RESET="\033[0m"

# run diff check
if diff $2 temp > /dev/null ; then
	printf "${GREEN}[OK] ${RESET}"
else
	echo "${RED}[KO] it does not return correct on test $1, check $2 for correct output\n${RESET}Your output:\n${MUTED}"
	cat temp
fi
echo ""
rm -f temp
