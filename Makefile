NAME		= libasm

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror -g

ASM			= nasm
ASMFLAGS	= -f elf64 -g

RM			= rm -f

SRCS_C		= main.c
SRCS_ASM	= ft_strlen.asm \
            ft_strcpy.asm \
			ft_strcmp.asm \
			ft_write.asm \

OBJS_C		= $(SRCS_C:.c=.o)
OBJS_ASM	= $(patsubst %.s,%.o,$(filter %.s,$(SRCS_ASM)))
OBJS_ASM	+= $(patsubst %.asm,%.o,$(filter %.asm,$(SRCS_ASM)))

OBJS		= $(OBJS_C) $(OBJS_ASM)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re