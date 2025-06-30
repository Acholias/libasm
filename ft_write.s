; ft_write
; ssize_t	ft_write(int fd, const void *buf, size_t count)

extern	__errno_location

global	ft_write

ft_write:
	mov			rax, 1
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