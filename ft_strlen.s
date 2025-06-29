; ft_strlen
; size_t	ft_strlen(const char *s)

section .note.GNU-stack

global ft_strlen

section .text
ft_strlen:
    xor     rax, rax

.loop:
    cmp     byte [rdi + rax], 0
    je      .end
    inc     rax
    jmp     .loop

.end:
    ret
