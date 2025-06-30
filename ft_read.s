; ft_read
; ssize_t	ft_read(int fd, void *buf, size_t count)

extern	__errno_location

global ft_read

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