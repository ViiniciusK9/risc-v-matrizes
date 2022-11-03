	.data
A: 	.word 3
S:	.string "\n"

	.text
	
	# s9 maior
	# s8 menor
	# s10 soma
	# s11 iterador do for
main:
	li 	s10, 0
	li 	s11, 3
	li	s3, 3
		
for:
	
	beq	s11, zero, endfor
	li 	a7, 5
	ecall
	add	s10, s10, a0
	
	bne	s11, s3, pula
	mv	s8, a0
	mv	s9, a0
pula:
	
	bge	s9, a0, pula2
	mv	s9, a0	
pula2:
	bge	a0, s8 pula3
	mv	s8, a0	
pula3:
	
	
	addi 	s11, s11, -1
	j	for

endfor:

	div	s10, s10, s3
	
	li	a7, 1
	mv	a0, s9
	ecall
	
	li	a7, 4
	la	a0, S
	ecall
	
	li	a7, 1
	mv	a0, s8
	ecall
	
	li	a7, 4
	la	a0, S
	ecall
	
	
	li	a7, 1
	mv	a0, s10
	ecall
	
	li	a7, 4
	la	a0, S
	ecall
	
