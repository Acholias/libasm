; ft_strcmp
; int	ft_strcmp(const char *s1, const char *s2)


global	ft_strcmp

ft_strcmp:

.loop:
	mov		al, [rdi]
	mov		cl, [rsi]
	cmp		al, cl
	jne		.end
	cmp		byte al, 0
	je		.end
	inc		rdi
	inc		rsi
	jmp		.loop

.end:
	movzx	rax, al
	movzx	rcx, cl
	sub		rax, rcx
	ret