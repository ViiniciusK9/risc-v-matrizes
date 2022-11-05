	.data
	
op:	.word
a:	.word 1
b:	.word 2
c:	.word 3
d:	.word 4
e:	.word 5
matriz:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
det:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
M:	.string "\nmenu: \n1) le_matriz \n2) imprime_matriz \n3) calcula_determinante \n4) ordena_matriz \n5) maior_elemento\n0) encerrar programa\nop: "	
pula:	.string "\n"
dp:	.string ": "
dim:	.string "Digite a dimensão: "
di: 	.string "Dimensão invalida!\n"
	
	.text

			
main:
	lw	s5, a
	lw 	s6, b
	lw	s7, c
	lw 	s8, d
	lw 	s9, e
	addi 	s10, s10, 0
	
	
menu:
	# imprime menu
	li 	a7, 4 
	la 	a0, M
	ecall 
	
	# le input 
	li 	a7, 5
	ecall
	
	mv 	t0, a0
	
	# branchs para o menu - INICIO
	bne 	t0, s5, fim_a
	jal 	func_a
	
fim_a:

	bne 	t0, s6, fim_b
	jal 	func_b
	
fim_b:

	bne 	t0, s7, fim_c
	jal 	func_c
	
fim_c:

	bne 	t0, s8, fim_d
	jal 	func_d
	
fim_d:

	bne 	t0, s9, fim_e
	jal 	func_e
	
fim_e:

	beq 	t0, zero, fim_z
	j 	menu	
fim_z:
	j 	fim_tudo
	# branchs para o menu - FIM

func_a:
	
	# carrega endereço da matriz
	la 	t3, matriz
	
	# imprime 
	li 	a7, 4 
	la 	a0, dim
	ecall 
	
	# le inteiro para armazenar a dimensão da matriz
	li 	a7, 5
	ecall
	add 	s10, a0, zero
	
	# verifica se a dimensão da matriz
	
	addi 	t1, zero, 2
	blt 	s10, t1, v_1
	addi 	t1, zero, 6
	bgt 	s10, t1, v_1
	
	# inicializando for_1 com 0
	add 	a6, zero, zero
for_1:
	# condicao for_1
	bge 	a6, s10, fim_for_1
	
	# inicializando for_2 com 0
	add 	a5, zero, zero
for_2:
	# condicao for_2
	bge 	a5, s10, fim_for_2
	
	# printa linha e coluna da matriz
	li 	a7, 1
	mv 	a0, a6
	ecall
	mv 	a0, a5
	ecall
	li 	a7, 4
	la 	a0, dp
	ecall
	
	# input para a matriz
	li 	a7, 5
	ecall
	
	# carregando o valor lido na matriz
	sw 	a0, 0(t3)
	addi 	t3, t3, 4
	
	# atualiza iteração for_2
	addi 	a5, a5, 1
	j 	for_2
	
fim_for_2:
	
	# atualiza iteração for_1
	addi 	a6, a6, 1
	j 	for_1
fim_for_1:
	
	
	ret
	
v_1:
	# tamanho da dimensão da matriz invalido
	li 	a7, 4 
	la 	a0, di
	ecall 
	ret
	
func_b:
	la 	t3, matriz
	# inicializando for_1 com 0
	add 	a6, zero, zero
for_b_1:
	# condicao for_1
	bge 	a6, s10, fim_for_b_1
	
	# inicializando for_2 com 0
	add 	a5, zero, zero
for_b_2:
	# condicao for_2
	bge 	a5, s10, fim_for_b_2
	
	li 	a7, 1
	mv 	a0, a6
	ecall
	mv 	a0, a5
	ecall
	li 	a7, 4
	la 	a0, dp
	ecall
	
	# carregando o valor lido na matriz
	lw 	a0, 0(t3)
	addi 	t3, t3, 4
	li 	a7, 1
	ecall
	
	li 	a7, 4
	la 	a0, pula
	ecall
	
	
	# atualiza iteração for_2
	addi 	a5, a5, 1
	j 	for_b_2
	
fim_for_b_2:
	
	# atualiza iteração for_1
	addi 	a6, a6, 1
	j 	for_b_1
fim_for_b_1:
	
	ret

func_c:
	la 	t3, matriz
	addi	t5, zero, 3
	addi	t6, zero, 5
	
	# verifica se a matriz possui dimensão 3
	addi	t1, zero, 3
	bne	s10, t1, final_c
	
	# inicializando for_1 com 0
	add 	a6, zero, zero
for_c_1:
	# condicao for_1
	bge 	a6, t5, fim_for_c_1
	
	# inicializando for_2 com 0
	add 	a5, zero, zero
for_c_2:
	# condicao for_2
	bge 	a5, t6, fim_for_c_2
	# corpo - inicio
	
	
	# 0 4 8 12 16 
	# 20 24 28 32 36 
	# 40 44 48 52 56
	
	
	# corpo - fim
	# atualiza iteração for_2
	addi 	a5, a5, 1
	j 	for_c_2
	
fim_for_c_2:
	
	# atualiza iteração for_1
	addi 	a6, a6, 1
	j 	for_c_1
fim_for_c_1:

	ret
final_c:
	# dimensão invalida
	ret

func_d:
	li 	a7, 4
	la 	a0, d
	ecall
	ret

func_e:
	
	la 	t3, matriz
	lw 	t4, 0(t3)
	# inicializando for_1 com 0
	add 	a6, zero, zero
for_e_1:
	# condicao for_1
	bge 	a6, s10, fim_for_e_1
	
	# inicializando for_2 com 0
	add 	a5, zero, zero
for_e_2:
	# condicao for_2
	bge 	a5, s10, fim_for_e_2
	
	
	# carregando o valor lido na matriz
	addi 	t3, t3, 4
	lw 	a0, 0(t3)
	bge 	t4, a0, maior_p
	# novo menor
	add 	t4, zero, a0
maior_p:
	
	# atualiza iteração for_2
	addi 	a5, a5, 1
	j 	for_e_2
	
fim_for_e_2:
	
	# atualiza iteração for_1
	addi 	a6, a6, 1
	j 	for_e_1
fim_for_e_1:

	li 	a7, 1
	add 	a0, zero, t4
	ecall

	ret
	
fim_tudo:
