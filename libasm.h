/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lumugot <lumugot@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/30 18:06:44 by lumugot           #+#    #+#             */
/*   Updated: 2025/09/30 14:02:32 by lumugot          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef	LIBASM_H
# define LIBASM_H

# include <unistd.h>
# include <stdlib.h>

// MANDATORY
size_t  ft_strlen(const char *s);
char    *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(char const *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
char    *ft_strdup(const char *s);

// BONUS
typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}	t_list;

void	ft_list_push_front(t_list **lst, void *data);
int		ft_list_size(t_list *list);
void	ft_list_remove_if(t_list **begin_list, void *content_ref, int (*cmp)());


#endif