	.data  
	
vet:	.word 5, 3, 6, 8, 4, 2, 1, 4, 6, 4, 8, 9, 4, -1, 1, 3, 1, 2
#vet:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
#vet:	.word 1502, 9603, 1, -50
#vet:	.word 1
#vet:	.word 5, 4, 3, 2, 1

	.text
	
# maior numero do vetor
main:	
	la	a0, vet
	li	a1, 17
	li	t2, 4
	 	 
	call caimi

caimi:
	# menor
	lw	a6, 0(a0)
	add	a3, zero, a6
	add	a4, zero, zero 
	# inicializa
	add	t0, zero, a1
	add	s0, zero, zero
condicao:
	beq	s0, t0, fim
	# corpo
	add	a0, a0, t2
	lw	a6, 0(a0)
	
	# atualiza
	addi	s0, s0, 1
	
	bge	a6, a3, pula
	# novo menor
	add	a3, zero, a6
	add	a4, zero, s0
pula:
	
		
	
	j 	condicao
fim:
	mv	a0, a4
	mv	a3, a3
	ret
	
	
  
  -- 
	
	
