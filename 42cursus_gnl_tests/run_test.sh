# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    run_test.sh                                        :+:    :+:             #
#                                                      +:+                     #
#    By: jvan-sni <jvan-sni@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2019/10/29 11:27:00 by jvan-sni       #+#    #+#                 #
#    Updated: 2019/11/20 17:50:42 by jvan-sni      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# config
TESTFOLDER="tests/normal/"
ADVANCEDFOLDER="tests/bonus/"
ADVANCEDTEST="1.txt 2.txt"
ANSWERFOLDER="../../answers/normal/"
ADVANCEDANSWERFOLDER="../../answers/bonus/"

# colors
GREEN="\033[92m"
MUTED="\033[1;30m"
RESET="\033[0m"
BOLD="\033[1m"

echo "$1"

# normal tests
echo "${MUTED}-----------------------------------${RESET}"
cd $TESTFOLDER
for FILE in *; do
	if [ -f "${FILE}" ]; then
		# run single test with open()
		printf "${GREEN}▹ Test \"${RESET}${BOLD}${FILE}${GREEN}\":${RESET}\n\n"
		../../a.out ${FILE} > temp
		sh ../../test.sh ${FILE} ${ANSWERFOLDER}${FILE}
		
		if [ "${FILE}" != "INVALID_FD" ]; then
			# run single test with stdin
			cat ${FILE} | ../../a.out > temp
			sh ../../test.sh ${FILE} ${ANSWERFOLDER}${FILE}
			echo ""
		fi
	fi
done
cd ../../

# bonus tests
echo "\n${MUTED}-----------------------------------${RESET}\n"
cd $ADVANCEDFOLDER
printf "${GREEN}▹ Bonus tests:${RESET}\n\n"
../../a.out ${ADVANCEDTEST} > temp
sh ../../test.sh "ADVANCED" ${ADVANCEDANSWERFOLDER}1.txt
echo ""
cd ../../
