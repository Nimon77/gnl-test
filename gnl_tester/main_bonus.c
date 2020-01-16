/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lgrellie <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/10/18 14:37:10 by lgrellie          #+#    #+#             */
/*   Updated: 2019/10/28 16:11:13 by lgrellie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include "get_next_line_bonus.h"

void		ft_putstr_fd(char *s, int fd)
{
	size_t	len;

	len = strlen(s);
	write(fd, s, len);
}

void		ft_putendl_fd(char *s, int fd)
{
	ft_putstr_fd(s, fd);
	write(fd, "\n", 1);
}

int	gnl_random()
{
	int fd = open("/dev/random", O_RDONLY);
	char *line = NULL;
	char outpath[] = "output/dump.txt";
	int out_fd = open(outpath, O_CREAT | O_WRONLY | O_TRUNC, S_IRWXU);
loop:
	if (getchar() == '\n')
		switch(get_next_line(fd, &line))
		{
			case 1:
				ft_putendl_fd(line, out_fd);
				free(line);
				line = NULL;
				goto loop;
			case 0:
				ft_putstr_fd(line, out_fd);
				free(line);
				line = NULL;
				close(fd);
				close(out_fd);
				return (0);
			case -1:
				ft_putstr_fd("@@@ERROR@@@", out_fd);
				close(fd);
				close(out_fd);
				return (-1);
		}
	return (-1);
}

int	gnl_output(const char *path, int *fd)
{
	*fd = open(path, O_RDONLY);
	char *line = NULL;
	char outpath[128];
	char output[] = "output/output_";
	size_t i;
	for (i = 0; i <= 14 + strlen(path); ++i)
		outpath[i] = i < 14 ? output[i] : path[6 + i - 14];

	int out_fd = open(outpath, O_CREAT | O_WRONLY | O_TRUNC, S_IRWXU);
loop:
	switch(get_next_line(*fd, &line))
	{
		case 1:
			ft_putendl_fd(line, out_fd);
			free(line);
			line = NULL;
			goto loop;
		case 0:
			ft_putstr_fd(line, out_fd);
			free(line);
			line = NULL;
			close(out_fd);
			return (0);
		case -1:
			ft_putstr_fd("@@@ERROR@@@", out_fd);
			close(out_fd);
			return (-1);
	}
	return (-1);
}

int main(int ac, const char **av)
{
	if (ac == 1)
	{
		printf("Gimme some file paths!\n");
		return (0);
	}
	else
	{
		int tests_passed = 0;
		int tests_failed = 0;
		int names_passed[ac];
		int fd_tab[ac];
		int i = 1;

		while (i < ac)
		{
			if (gnl_output(av[i], &fd_tab[i]) == 0)
			{
				++tests_passed;
				names_passed[i] = 0;
			}
			else
			{
				++tests_failed;
				names_passed[i] = 1;
			}
			++i;
		}
		for (i = 1; i < ac; ++i)
			close(fd_tab[i]);
		printf("Files opened: %d\tReached EOF: %d\tEnded w/ -1: %d\n", ac - 1, tests_passed, tests_failed);
		return (0);
	}
}
