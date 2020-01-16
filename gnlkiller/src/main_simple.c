/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_simple.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sgah <sgah@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/10/21 16:09:02 by sgah              #+#    #+#             */
/*   Updated: 2019/10/22 14:40:13 by sgah             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../get_next_line.h"
#include <stdio.h>
#include <fcntl.h>

int	main(int argc, char **argv)
{
	char *line;
	if (argc == 2)
	{
		int fd = open (argv[1], O_RDONLY);
		while (get_next_line(fd,&line) > 0)
		{
			printf("%s\n",line);
			free(line);
		}
		close(fd);
	}
	return (0);
}
