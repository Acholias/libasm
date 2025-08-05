; ft_strlen
; size_t	ft_strlen(const char *s)

global ft_strlen

ft_strlen:
    xor     rax, rax

.loop:
    cmp     byte [rdi + rax], 0
    je      .end
    inc     rax
    jmp     .loop

.end:
    ret



; ft_strlen:
; 	mov		rax, rdi
; 
; .loop:
; 	cmp		byte [rax], 0
; 	je		.end
; 	inc		rax
; 	jmp		.loop
; 
; .end:
; 	sub		rax, rdi
; 	ret
