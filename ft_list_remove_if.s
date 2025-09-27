;ft_list_remove_if
;void	ft_list_remove_if(t_list **begin_list, void *content_ref, int (*cmp)());

global	ft_list_remove_if
extern	free

ft_list_remove_if:
	mov		rbx, rdi			;garder begin_list pour modifier *begin_list
	mov		r12, [rdi]			;current = *begin_list
	xor		r13, r13			;prev = NULL

.loop:
	test	r12, r12			;si current == NULL, fin
	je		.end

	mov		rdi, [r12]			;rdi = current->data
	mov		rsi, rsi			;rsi = content_ref
	mov		rax, rdx			;rax = cmp
	call	rax					;appel cmp (current->data, content_ref)
	test	rax, rax			;si cmp != 0, on ne supprime pas, mais il faut relink les nodes
	jne		.no_remove

	mov		r14, [r12+8]		;tmp = current->next
	test	r13, r13			;si prev == NULL
	jne		.not_first
	mov		[rbx], r14			;*begin_list = tmp
	jmp		.free_node

.not_first:
	mov		[r13 + 8], r14		;prev->next = tmp

.free_node:
	mov		rdi, [r12]			;free(current->data)
	call	free
	mov		rdi, r12			;free(current)
	call	free
	mov		r12, r14			;current = tmp
	jmp		.loop

.no_remove:
	mov		r13, r12			;prev = current
	mov		r12, [r12+8]		;current = current->next
	jmp		.loop

.end:
	ret							;return