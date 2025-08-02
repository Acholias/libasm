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


; 1. regarder si **lst != NULL
; 2. return si **lst == NULL
; 3. regarder si data != NULL
; 4. return si data == NULL
; 5. Sauvegarder rdi (**lst) dans r8
; 6. Sauvegarder rsi (data) dans r9
; 7. Preparer rdi pour le call a malloc (rdi = 16)
; 8. faire le malloc de la bonne taille (malloc(16))
; 9. Faire la verif si le malloc echoue
; 10. return si malloc a fail
; 11. Mettre la valeur de data dans new->data
; 12. Sauvegarder le *lst dans r10 pour le mettre dans next apres (Pas 2 instruction mémoire sur la meme ligne)
; 13. Mettre l'ancienne tête (*lst) dans new->next pour chaîner les maillons (new->next = ancienne tete)
; 14. Mettre le nouveau maillon (rax) comme nouvelle tête de liste (*lst = nouveau_maillon)"
