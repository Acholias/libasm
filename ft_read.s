; ft_read
; ssize_t	ft_read(int fd, void *buf, size_t count)

section .note.GNU-stack

global ft_read

section .text
ft_read:
	mov			rax, 0
	syscall
	ret