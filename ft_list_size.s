; ft_list_size
; int	ft_list_size(t_list *list);

global	ft_list_size

ft_list_size:
	xor		rax, rax
	cmp		rdi, 0
	je		.end

.loop:
	inc		rax
	mov		rdi, [rdi + 8]
	cmp		rdi, 0
	jne		.loop

.end:
	ret