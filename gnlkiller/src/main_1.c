/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_1.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sgah <sgah@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/09/25 21:14:45 by sgah              #+#    #+#             */
/*   Updated: 2019/09/29 03:26:27 by sgah             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <fcntl.h>
#include <sys/uio.h>
#include <sys/types.h>
#include "../get_next_line.h"

int    main(int ac, char **argv)
{
	char	*s;
	int		a;
	int		b;
	int		c;
	int		d;
	int		i = 0;
	int		ii = 0;
	(void)ac;
	a = open(argv[1], O_RDONLY);
	b = open(argv[2], O_RDONLY);
	c = open(argv[3], O_RDONLY);
	d = open(argv[4], O_RDONLY);
	while (get_next_line(a, &s) > 0)
	{
		printf("{%d}[%d:] %s\n",ii,i,s);
		free(s);
		ii++;
		if (get_next_line(b, &s) < 1)
			break ;
		printf("{%d}[%d:] %s\n",ii,i,s);
		free(s);
		ii++;
		if (get_next_line(c, &s) < 1)
			break ;
		printf("{%d}[%d:] %s\n",ii,i,s);
		free(s);
		ii++;
		if (get_next_line(d, &s) < 1)
			break ;
		printf("{%d}[%d:] %s\n",ii,i,s);
		free(s);
		ii++;
		i++;
	}
	close(a);
	close(b);
	close(c);
	close(d);
	return (0);
}
