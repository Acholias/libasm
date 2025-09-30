;ft_list_remove_if
;void	ft_list_remove_if(t_list **begin_list, void *content_ref, int (*cmp)());

global	ft_list_remove_if
extern	free

ft_list_remove_if:
	test	rdi, rdi			; si rdi == NULL return 
	je		.end		
	mov		rbx, rdi			; garder begin_list pour modifier *begin_list
	mov		r12, [rdi]			; current = *begin_list
	xor		r13, r13			; prev = NULL
	mov		r15, rsi
	mov		r14, rdx

.loop:
	test	r12, r12			; si current == NULL, fin
	je		.end

	mov		rdi, [r12]			; rdi = current->data
	mov		rsi, r15			; rsi = content_ref
	call	r14			
	test	rax, rax
	jne		.no_remove					

	mov		rax, [r12 + 8]
	test	r13, r13
	jne		.not_first
	mov		[rbx], rax
	jmp		.free_node

.not_first:
	mov		[r13 + 8], rax

.free_node:
	push	rax
	mov		rdi, [r12]
	call	free
	mov		rdi, r12
	call	free
	pop		r12
	jmp		.loop

.no_remove:
	mov		r13, r12
	mov		r12, [r12 + 8]
	jmp		.loop

.end:
	ret							; return