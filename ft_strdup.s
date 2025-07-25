; ft_strdup
; char	*ft_strdup(const char *s)

global	ft_strdup

extern	ft_strlen
extern	malloc
extern	ft_strcpy

ft_strdup:
	push	rdi
	call	ft_strlen
	inc		rax
	mov		rdi, rax
	call	malloc
	cmp		rax, 0
	je		.end
	mov		rdi, rax
	pop		rsi
	call	ft_strcpy

.end:
	ret