NAME		= libasm.a

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror -g

AR			= ar
ARFLAGS		= rcs

ASM			= nasm
ASMFLAGS	= -f elf64 -g

RM			= rm -f

SRCS_ASM	= ft_strlen.s \
			  ft_strcpy.s \
			  ft_strcmp.s \
			  ft_write.s \
			  ft_read.s \
			  ft_strdup.s

SRCS_ASM_BONUS = ft_list_size.s

OBJS_ASM		= $(SRCS_ASM:.s=.o)
OBJS_ASM_BONUS	= $(SRCS_ASM_BONUS:.s=.o)

all: $(NAME)

$(NAME): $(OBJS_ASM)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS_ASM)

bonus: $(OBJS_ASM) $(OBJS_ASM_BONUS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS_ASM) $(OBJS_ASM_BONUS)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	$(RM) $(OBJS_ASM) $(OBJS_ASM_BONUS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

re_bonus: fclean bonus

.PHONY: all clean fclean re bonus re_bonus