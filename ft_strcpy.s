; ft_strcpy
; char	*ft_strcpy(char *dest, const char *src)

global ft_strcpy

ft_strcpy: 
	mov		rax, rdi

.loop:
	mov		cl, [rsi]
	mov		[rdi], cl
	cmp		byte cl, 0
	je		.end
	inc		rdi
	inc		rsi
	jmp		.loop

.end:
	ret