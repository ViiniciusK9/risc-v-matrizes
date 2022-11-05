	.data
	
	
	.text
	
main:
	## arquivo com exemplos
	
	#if x == 5
	#    a += 7
	#else
	#    a += 15
	#
	# t1 = a
	# t0 = x
	# t2 = 5
	
	# carregando valores as variaveis
	addi t1, zero, 0
	addi t0, zero, 9
	addi t2, zero, 5
	
	# teste condicional
	bne t0, t2, else
	addi t1, t1, 7
	j fim_if
else:	
	addi t1, t1, 15
fim_if:	
	
	
	#while x != y
	#   x += 2
	#   y += 3
	#
	# t0 = x
	# t1 = y
	
	# carregando as variaveis
	addi t0, zero, 20
	addi t1, zero, 10
	
while:
	beq t0, t1, fim_w
	addi t0, t0, 2
	addi t1, t1, 3
	j while
fim_w: