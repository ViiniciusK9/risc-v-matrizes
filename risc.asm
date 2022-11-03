	.data

	


op:	.word

a:	.word 1

b:	.word 2

c:	.word 3

d:	.word 4

e:	.word 5

matriz: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

M:	.string "\nmenu: \n1) le_matriz \n2) imprime_matriz \n3) calcula_determinante \n4) ordena_matriz \n5) maior_elemento\n0) encerrar programa\nop: "
	

	

	.text



			

main:

	lw s5, a

	lw s6, b

	lw s7, c

	lw s8, d

	lw s9, e

	addi s10, s10, 0
	

	

menu:

	# imprime menu

	li a7, 4 

	la a0, M

	ecall 

	

	# le input 

	li a7, 5

	ecall

	

	mv t0, a0

	

	bne t0, s5, fim_a

	jal func_a

	

fim_a:



	bne t0, s6, fim_b

	jal func_b

	

fim_b:



	bne t0, s7, fim_c

	jal func_c

	

fim_c:



	bne t0, s8, fim_d

	jal func_d

	

fim_d:



	bne t0, s9, fim_e

	jal func_e

	

fim_e:



	beq t0, zero, fim_z

	j menu	

fim_z:

	j fim_tudo



func_a:

	li a7, 4

	la a0, a

	ecall

	ret

	
# IMPRIME
func_b:
	addi a4, a4, 0
	addi a3, a3, 0
	la s4, matriz
	mul a5, s10, s10

primeiro_for_print:
	beq a4, a5, final_funcao_b
	
	beq a3, s10, primeiro_for_print
	
	li a7, 1
	lw a0, 0(s4)
	ecall
	
	
	addi a4, a4, 1
	addi a3, a3, 1
	addi s4, s4, 4
	
final_funcao_b:
	ecall
	ret


func_c:

	li a7, 4

	la a0, c

	ecall

	ret



func_d:

	li a7, 4

	la a0, d

	ecall

	ret



func_e:

	li a7, 4

	la a0, e

	ecall

	ret

	

fim_tudo: