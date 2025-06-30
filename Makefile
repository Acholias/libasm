# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lumugot <lumugot@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/30 18:17:38 by lumugot           #+#    #+#              #
#    Updated: 2025/06/30 18:19:08 by lumugot          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libasm.a

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror -g -fno-pie

ASM			= nasm
ASMFLAGS	= -f elf64 -g

AR			= ar rcs
RM			= rm -f

GREEN		= \033[0;32m
YELLOW		= \033[0;33m
NC			= \033[0m

SRCS_C		= main.c
SRCS_ASM	= ft_strlen.s \
			  ft_strcpy.s \
			  ft_strcmp.s \
			  ft_write.s \
			  ft_read.s \
			  ft_strdup.s

OBJS_C		= $(SRCS_C:.c=.o)
OBJS_ASM	= $(SRCS_ASM:.s=.o)

all: $(NAME)

$(NAME): $(OBJS_ASM)
	@$(AR) $(NAME) $(OBJS_ASM)
	@echo "${GREEN}Library $(NAME) created successfully.${NC}"
	@echo "${GREEN}Test executable $(TEST_EXE) created successfully.${NC}"

%.o: %.s
	@$(ASM) $(ASMFLAGS) $< -o $@
	@echo "${YELLOW}Compiled $< -> $@${NC}"

clean:
	@$(RM) $(OBJS_ASM) $(OBJS_C)
	@echo "${GREEN}Object files removed.${NC}"

fclean: clean
	@$(RM) $(NAME) $(TEST_EXE)
	@echo "${GREEN}Library and executable removed.${NC}"

re: fclean all

.PHONY: all clean fclean re