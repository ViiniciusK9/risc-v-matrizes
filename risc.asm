	.data
	
op:	.word
a:	.word 1
b:	.word 2
c:	.word 3
d:	.word 4
e:	.word 5
matriz:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
det:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
M:	.string "\nmenu: \n1) le_matriz \n2) imprime_matriz \n3) calcula_determinante \n4) ordena_matriz \n5) maior_elemento\n0) encerrar programa\nop: "	
pula:	.string "\n"
dp:	.string ": "
dim:	.string "Digite a dimensão: "
di: 	.string "Dimensão invalida!\n"
dtm:	.string "Determinante da matriz é: "
oma:	.string	"O maior numero da matriz é: "
nl:	.string "na linha: "
nc:	.string "na coluna: "
	
	.text

# Registradores Globais
main:
	lw	s5, a # s5 <- 1
	lw 	s6, b # s6 <- 2
	lw	s7, c # s7 <- 3
	lw 	s8, d # s8 <- 4
	lw 	s9, e # s9 <- 5
	
	addi 	s10, s10, 0 # s10 <- 0 (Tamanho da Matriz)
	
menu:
	li 	a7, 4 # a7 <- 4 (Equivale a printar uma String)
	la 	a0, M # a0 <- M (Atribuindo a String do Menu no registrador a0)
	ecall # Chama o Sistema e Printa o Valor contido em a0
	
	li 	a7, 5 # a7 <- 5 (Equivale a Ler um Inteiro)
	ecall # Chame o sistema e carrega um Inteiro em a0
	
	mv 	t0, a0 # t0 <- a0 Move o conteudo do ao em t0
	
	bne 	t0, s5, fim_a # Se t0 for diferente de s5 pula para fim_a t0 != s5
	jal 	func_a # Pule para func_a
	
fim_a:
	bne 	t0, s6, fim_b # Se t0 for diferente de s6 pula para fim_b t0 != s6
	jal 	func_b # Pule para func_b
	
fim_b:

	bne 	t0, s7, fim_c # Se t0 for diferente de s7 pula para fim_c t0 != s7
	
	# Verifica se a matriz possui dimensão 3
	addi	t1, zero, 3 # t1 <- 3
	bne	s10, t1, final_c # Se t1 for diferente de s10 pula para final_c s10 != t1
	jal 	func_c # Pule para func_c
	
	add	t1, zero, a0
	
	li	a7, 4
	la	a0, dtm
	ecall
	li	a7, 1
	add	a0, zero, t1
	ecall
	li	a7, 4
	la	a0, pula
	ecall
	j	fim_c
	
final_c:
	li	a7, 4
	la	a0, di
	ecall

fim_c:
	bne 	t0, s8, fim_d
	jal 	func_d
	
fim_d:
	bne 	t0, s9, fim_e
	jal 	func_e
	add	t1, zero, a0
	add	t2, zero, a1
	add	t3, zero, a2
	
	# imprimir maior
	li	a7, 4
	la	a0, oma
	ecall
	li	a7, 1
	add	a0, zero, t1
	ecall
	li	a7, 4
	la	a0, pula
	ecall
	# imprimir linha do maior
	li	a7, 4
	la	a0, nl
	ecall
	li	a7, 1
	add	a0, zero, t2
	ecall
	li	a7, 4
	la	a0, pula
	ecall
	# imprimir coluna do maior
	li	a7, 4
	la	a0, nc
	ecall
	li	a7, 1
	add	a0, zero, t3
	ecall
	li	a7, 4
	la	a0, pula
	ecall
	
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
	la	t4, det
	
	# 0  4  8  12 16 
	# 20 24 28 32 36 
	# 40 44 48 52 56
	# carregando os valores da matriz 3x3 para a 3x5 para calcular o determinante
	lw	t0, 0(t3)
	sw	t0, 0(t4)
	sw	t0, 12(t4)
	
	lw	t0, 4(t3)
	sw	t0, 4(t4)
	sw	t0, 16(t4)
	
	lw	t0, 8(t3)
	sw	t0, 8(t4)
	
	lw	t0, 12(t3)
	sw	t0, 20(t4)
	sw	t0, 32(t4)
	
	lw	t0, 16(t3)
	sw	t0, 24(t4)
	sw	t0, 36(t4)
	
	lw	t0, 20(t3)
	sw	t0, 28(t4)
	
	lw	t0, 24(t3)
	sw	t0, 40(t4)
	sw	t0, 52(t4)
	
	lw	t0, 28(t3)
	sw	t0, 44(t4)
	sw	t0, 56(t4)
	
	lw	t0, 32(t3)
	sw	t0, 48(t4)
	
	# calculando o valor do determinante
	
	# zerando os valores presentes em a0, a1 e a2
	add	a0, zero, zero
	add	a1, zero, zero
	add	a2, zero, zero
	
	# a0 = 00 * 11 * 22
	lw	t5, 0(t4)
	lw	t6, 24(t4)
	mul	a0, t5, t6
	lw	t5, 48(t4)
	mul	a0, a0, t5
	
	# a1 = 01 * 12 * 23
	lw	t5, 4(t4)
	lw	t6, 28(t4)
	mul	a1, t5, t6
	lw	t5, 52(t4)
	mul	a1, a1, t5
	
	# a2 = 02 * 13 * 24
	lw	t5, 8(t4)
	lw	t6, 32(t4)
	mul	a2, t5, t6
	lw	t5, 56(t4)
	mul	a2, a2, t5
	
	# t0 = a0 + a1 + a2
	add	t0, a0, a1
	add	t0, t0, a2
	
	# zerando os valores presentes em a0, a1 e a2
	add	a0, zero, zero
	add	a1, zero, zero
	add	a2, zero, zero
	
	# a0 = 02 * 11 * 20
	lw	t5, 8(t4)
	lw	t6, 24(t4)
	mul	a0, t5, t6
	lw	t5, 40(t4)
	mul	a0, a0, t5
	
	# a1 = 03 * 12 * 21
	lw	t5, 12(t4)
	lw	t6, 28(t4)
	mul	a1, t5, t6
	lw	t5, 44(t4)
	mul	a1, a1, t5
	
	# a2 = 04 * 13 * 22
	lw	t5, 16(t4)
	lw	t6, 32(t4)
	mul	a2, t5, t6
	lw	t5, 48(t4)
	mul	a2, a2, t5
	
	
	# t0 = t0 - a0 - a1 - a2
	sub	t0, t0, a0
	sub	t0, t0, a1
	sub	t0, t0, a2
	
	mv	a0, t0
	# movendo 3 para o t0 apenas para não bugar o menu
	li	t0, 3
	# 0  4  8  12 16 
	# 20 24 28 32 36 
	# 40 44 48 52 56
	ret

func_d:
	la 	t0, matriz
	
	mul	t1, s10, s10
	mul	t2, s10, s10
	addi	t2, t2, -1
	
	# inicializando for_1 com 0
	add 	a6, zero, zero
for_d_1:
	# condicao for_1
	bge 	a6, t1, fim_for_d_1
	
	# inicializando for_2 com 0
	add 	a5, zero, zero
	mv	t3, t0
	mv	t4, t0
	addi	t4, t4, 4
for_d_2:
	# condicao for_2
	bge 	a5, t2, fim_for_d_2
	
	# inicio corpo
	
	lw	t5, 0(t3)
	lw	t6, 0(t4)
	
	ble t5, t6, n_t
	# troca
	sw	t6, 0(t3)
	sw	t5, 0(t4)
n_t:
	
	# atualiza atualiza valores 
	addi	t3, t3, 4
	addi	t4, t4, 4
	
	# fim corpo
	
	# atualiza iteração for_2
	addi 	a5, a5, 1
	j 	for_d_2
	
fim_for_d_2:
	
	# atualiza iteração for_1
	addi 	a6, a6, 1
	j 	for_d_1
fim_for_d_1:
	
	
	# para não bugar o t0
	li	t0, 3
	ret

func_e:
	
	la 	t3, matriz
	lw 	t4, 0(t3)
	addi	a1, zero, 0
	addi	a2, zero, 0
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
	# atualiza iteração for_2
	addi 	a5, a5, 1
	bge 	t4, a0, maior_p
	# novo menor
	add 	t4, zero, a0
	add	a1, zero, a6
	add	a2, zero, a5
maior_p:
	
	
	j 	for_e_2
	
fim_for_e_2:
	
	# atualiza iteração for_1
	addi 	a6, a6, 1
	j 	for_e_1
fim_for_e_1:

	add 	a0, zero, t4
	ret
	
fim_tudo:
