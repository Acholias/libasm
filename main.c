/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lumugot <lumugot@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/08/01 22:34:59 by lumugot           #+#    #+#             */
/*   Updated: 2025/08/02 20:06:42 by lumugot          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>

// gcc -Wall -Wextra -Werror -g main.c -L. -lasm -z noexecstack -o anan

int	main(void)
{
	char	*str;
	str = "Testicules";
	printf("[%ld]\n", ft_strlen(str));
}


void	ft_list_sort(t_list **lst, int (*cmp)())
{
	t_list	*current;
	void	*swap;

	current = *lst;
	while (current && current->next)
	{
		if (((*cmp)(current->data, current->next->data)) == 0)
		{
			swap = current->data;
			current->data = current->next->data;
			current->next->data = swap;
			current = *lst;
		}
		else
			current = current->next;
	}
}

void	ft_list_remove_if(t_list **lst, void *content_ref, int (*cmp)())
{
	t_list	*current;
	t_list	*prev;
	t_list	*tmp;

	current = *lst;
	prev = NULL;
	while (current)
	{
		if (((*cmp)(current->data, content_ref)) == 0)
		{
			tmp = current->next;
			if (prev)
				prev->next = tmp;
			else
				*lst = tmp;
			free(current->data);
			free(current);
			current = tmp;
		}
		else
		{
			prev = current;
			current = current->next;
		}
	}
}
