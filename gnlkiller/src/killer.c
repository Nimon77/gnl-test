/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   killer.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: asoursou <asoursou@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/09/29 17:40:03 by asoursou          #+#    #+#             */
/*   Updated: 2019/10/21 17:22:57 by sgah             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <fcntl.h>
#include "../get_next_line.h"
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

void	kill(char *s)
{
	int f;

	f = open(s, O_RDONLY);
	s = NULL;
	if (get_next_line(f, &s) > 0)
	{
		printf("%s\n", s);
		free(s);
	}
	close(f);
	s = NULL;
	printf("killer: %d\n", get_next_line(f, &s));
	while(1);
	if (!s)
		s = "(NULL)";
	printf("buffer: %s$\n", s);
}

int		main(int argc, char **argv)
{
	if (argc == 2)
		kill(argv[1]);
	return (0);
}
