; ft_list_push_front
; void	ft_list_push_front(t_list **lst, void *data)

global ft_list_push_front

extern	malloc

ft_list_push_front:
	cmp		rdi, 0
	je		.end
	cmp		rsi, 0
	je		.end
	mov		r8, rdi
	mov		r9, rsi
	mov		rdi, 16
	call	malloc
	cmp		rax, 0
	je		.end
	mov		[rax], r9
	mov		r10, [r8]
	mov		[rax + 8], r10
	mov		[r8], rax
	jmp		.end

.end:
	ret
