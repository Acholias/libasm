; ft_read
; ssize_t	ft_read(int fd, void *buf, size_t count)

section .note.GNU-stack

extern	__errno_location

global ft_read

section .text
ft_read:
	mov			rax, 0
	syscall
	cmp			rax, 0
	jge			.end
	neg			rax
	push		rax
	call		__errno_location
	pop			rdi
	mov			[rax], edi
	mov			rax, -1

.end:
	ret