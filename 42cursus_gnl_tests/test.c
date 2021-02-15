/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   test.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: jvan-sni <jvan-sni@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/11/07 17:05:16 by jvan-sni      #+#    #+#                 */
/*   Updated: 2021/01/19 00:09:24 by mrjvs         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#if BONUS_GNL == yes
	#include <get_next_line.h>
#else
	#include <get_next_line_bonus.h>
#endif

#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

void	doprint(int out, char **str, int line)
{
	printf("(LINE %i) [OUT %i] |%s|\n", line, out, *str);
	free(*str);
	*str = NULL;
}

void	testmultiple(int fd, int fd2)
{
	char	*st;
	int		i;
	int		i2;

	st = NULL;
	i = 1;
	i2 = 1;
	doprint(get_next_line(fd, &st), &st, i++);
	doprint(get_next_line(fd2, &st), &st, i2++);
	doprint(get_next_line(fd2, &st), &st, i2++);
	doprint(get_next_line(fd, &st), &st, i++);
	doprint(get_next_line(fd, &st), &st, i++);
	doprint(get_next_line(fd2, &st), &st, i2++);
	doprint(get_next_line(fd, &st), &st, i++);
	doprint(get_next_line(fd2, &st), &st, i2++);
	doprint(get_next_line(fd2, &st), &st, i2++);
	doprint(get_next_line(fd, &st), &st, i++);
	doprint(get_next_line(fd2, &st), &st, i2++);
	doprint(get_next_line(fd, &st), &st, i++);
	doprint(get_next_line(fd2, &st), &st, i2++);
	doprint(get_next_line(fd2, &st), &st, i2++);
	close(fd);
	close(fd2);
}

void	test(int fd)
{
	char	*st;
	int		out;
	int		i;

	st = NULL;
	i = 1;
	out = 1;
	while (out == 1)
	{
		out = get_next_line(fd, &st);
		doprint(out, &st, i++);
	}
	close(fd);
}

int		main(int argc, char **argv)
{
	int		fd;
	int		fd2;

	if (argc == 1)
	{
		test(0);
	}
	else if (argc == 2 && strstr(argv[1], "INVALID_FD") != NULL)
	{
		test(1250834982);
		test(612985234);
	}
	else if (argc == 2)
	{
		fd = open(argv[1], O_RDONLY);
		test(fd);
	}
	else if (argc == 3)
	{
		fd = open(argv[1], O_RDONLY);
		fd2 = open(argv[2], O_RDONLY);
		testmultiple(fd, fd2);
	}
	return (0);
}
