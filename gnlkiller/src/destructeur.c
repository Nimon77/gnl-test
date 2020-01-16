/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   destructeur.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sgah <sgah@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/10/23 16:08:56 by sgah              #+#    #+#             */
/*   Updated: 2019/11/01 13:48:36 by sgah             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


#include <sys/types.h>
#include "../get_next_line.h"
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>

__attribute__((destructor)) void	lol()
{
	while (1);
}

int		main(int ac, char ** av)
{
	(void)ac;
	int		fd = open(av[1], O_RDONLY);
	char	*l;
	int		n;

	while ((n = get_next_line(fd, &l)) == 1)
	{
		printf("%s\n", l);
		free(l);
	}
	printf("last line [ret:%d]: %s", n, l);
	lol();
	return (0);
}


