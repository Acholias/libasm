/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lumugot <lumugot@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/08/01 22:34:59 by lumugot           #+#    #+#             */
/*   Updated: 2025/09/30 16:11:47 by lumugot          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

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
	if (!node)
		return (NULL);
    node->data = strdup(str);
	if (!node->data)
		return NULL;
    node->next = NULL;
    return (node);
}

int	main(void)
{
    t_list *lst = new_node("42");
    lst->next = new_node("hello");
    lst->next->next = new_node("42");
    lst->next->next->next = new_node("world");
    lst->next->next->next->next = new_node("42");
    lst->next->next->next->next->next = new_node("salut 42");
    lst->next->next->next->next->next->next = new_node("42");
    lst->next->next->next->next->next->next->next = new_node("SALUT CA VA");

    printf("Avant remove_if:\n");
    print_list(lst);

    ft_list_remove_if(&lst, "42", cmp_str);

    printf("\nAprès remove_if:\n");
    if (lst)
        print_list(lst);
    else
        printf("Liste vide\n");

    while (lst)
    {
        t_list *tmp = lst->next;
        free(lst->data);
        free(lst);
        lst = tmp;
    }
    return 0;
}