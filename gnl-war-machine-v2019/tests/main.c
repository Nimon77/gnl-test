/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ahallain <ahallain@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/09 19:32:06 by ahallain          #+#    #+#             */
/*   Updated: 2019/11/26 18:33:09 by ahallain         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include "gnl.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void	readfile(char *file, int print) {
	int		fd;
	int		ret;
	char	*line;

	fd = open(file, O_RDONLY);
	if (fd == -1)
		return ;
	ret = 1;
	while (ret > 0)
	{
		ret = get_next_line(fd, &line);
		if (print)
			printf("%s\n", line);
		free(line);
	}
	get_next_line(fd, &line);
	if (print)
		printf("%s\n", line);
	free(line);
	close(fd);
}

int		main(int argc, char **argv)
{
	int		index;
	int		ex;
	char	*leaks;

	if (argc < 3)
		return (0);
	index = 0;
	ex = atoi(argv[argc - 1]);
	while(++index < argc)
		readfile(argv[index], !ex);
	if (ex) {
		if (!(leaks = malloc(7)))
			return (2);
		leaks[0] = 'l';
		leaks[1] = 'e';
		leaks[2] = 'a';
		leaks[3] = 'k';
		leaks[4] = 's';
		leaks[5] = ' ';
		index = 2;
		while (argv[0][index])
		{
			leaks[index + 4] = argv[0][index];
			index++;
		}
		leaks[index + 4] = 0;
		system(leaks);
	}
	return (1);
}