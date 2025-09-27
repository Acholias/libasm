/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lumugot <lumugot@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/08/01 22:34:59 by lumugot           #+#    #+#             */
/*   Updated: 2025/09/27 21:54:44 by lumugot          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// gcc -Wall -Wextra -Werror -g main.c -L. -lasm -z noexecstack -o anan

int	cmp_str(void *a, void *b)
{
    return strcmp((char *)a, (char *)b);
}

void	print_list(t_list *lst)
{
    while (lst)
    {
        printf("%s\n", (char *)lst->data);
        lst = lst->next;
    }
}

t_list	*new_node(char *str)
{
    t_list *node = malloc(sizeof(t_list));
    node->data = strdup(str);
    node->next = NULL;
    return node;
}

int	main(void)
{
    t_list *lst = new_node("42");
    lst->next = new_node("hello");
    lst->next->next = new_node("42");
    lst->next->next->next = new_node("world");

    printf("Avant remove_if:\n");
    print_list(lst);

    ft_list_remove_if(&lst, "42", cmp_str);

    printf("\nAprès remove_if:\n");
    print_list(lst);

    while (lst)
    {
        t_list *tmp = lst->next;
        free(lst->data);
        free(lst);
        lst = tmp;
    }
    return 0;
}

// void	ft_list_sort(t_list **lst, int (*cmp)())
// {
// 	t_list	*current;
// 	void	*swap;

// 	current = *lst;
// 	while (current)
// 	{
// 		if ((*cmp)(current->data, current->next->data) == 0)
// 		{
// 			swap = current->data;
// 			current->data = current->next->data;
// 			current->next->data = swap;
// 			current = *lst;
// 		}
// 		else
// 			current = current->next;
// 	}
// }

// void	ft_list_remove_if(t_list **lst, void *content_ref, int (*cmp)())
// {
	// t_list	*current;
	// t_list	*prev;
	// t_list	*tmp;
// 
	// current = *lst;
	// prev = NULL;
	// while (current)
	// {
		// if (((*cmp)(current->data, content_ref)) == 0)
		// {
			// tmp = current->next;
			// if (prev)
				// prev->next = tmp;
			// else
				// *lst = tmp;
			// free(current->data);
			// free(current);
			// current = tmp;
		// }
		// else
		// {
			// prev = current;
			// current = current->next;
		// }
	// }
// }