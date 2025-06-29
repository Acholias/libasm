; ft_write
; ssize_t	ft_write(int fd, const void *buf, size_t count)

section .note.GNU-stack

global	ft_write

section .text
ft_write:
	mov			rax, 1
	syscall
	ret