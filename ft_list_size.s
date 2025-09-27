; ft_list_size
; int	ft_list_size(t_list *list);

global	ft_list_size

ft_list_size:
	xor		rax, rax
	test	rdi, rdi
	je		.end

.loop:
	inc		rax
	mov		rdi, [rdi + 8]
	cmp		rdi, 0
	jne		.loop

.end:
	ret


; 1. Mettre le registre rax a 0
; 2. Regarder si rdi (*lst) est NULL
; 3. Si oui return (je -> jump-if-equal)
; 4. Incrementer rax direct pour le premier node
; 5. Faire avancer le pointeur dans la liste (rdi = rdi->next)
; 6. Regarder si on est a la fin de la chaine
; 7. Jump sur la loop si on est pas a la fin de la chaine (jne -> jump-if-no-equal)