.data
	msg1:.asciiz "\n Digite dia do Aniversario:"
	msg2:.asciiz "\n Digite mes do Aniversario:"
	msg3:.asciiz "\n Digite ano do Aniversario:"
	msg4:.asciiz "\n Digite dia atual: "
	msg5:.asciiz "\n Digite mes atual: "
	msg6:.asciiz "\n Digite ano atual: "
	msg7:.asciiz "\n Ano de Nascimento maior que atual , ou vc tem mais de 150 não é possivel continuar \n\n"
	msg8:.asciiz "\n"
	msg9:.asciiz "\n Idoso !!!! "
	msg10:.asciiz " Anos"
	msg11:.asciiz " Meses"
	msg12:.asciiz " Dias"
	
.text
main:
# ALGORITMO Faça um algoritmo que leia o dia, o mês, o ano do dia atual, o dia, o mês e o ano do aniversário
# e demonstre quantos anos, meses e dias de vida a pessoa tem. Considere anos bissextos e que ninguém vive mais que 150 anos
	
#DiaAniversario
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,5
	syscall
	add $t0,$v0,$zero
	
#mesAniversario
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,5
	syscall
	add $t1,$v0,$zero
	
#anoAniversario
	li $v0,4
	la $a0,msg3
	syscall
	li $v0,5
	syscall
	add $t2,$v0,$zero
	
#DiaAtual
	li $v0,4
	la $a0,msg4
	syscall
	li $v0,5
	syscall
	add $t3,$v0,$zero
	
#mesAtual
	li $v0,4
	la $a0,msg5
	syscall
	li $v0,5
	syscall
	add $t4,$v0,$zero
	
#anoAtual
	li $v0,4
	la $a0,msg6
	syscall
	li $v0,5
	syscall
	add $t5,$v0,$zero
	
#Adicionar Niversaro em S1
	add $s1,$t2,$zero
	
#adicionar 0 em T9
	li $t9,0
	
#verificar a idade 
	sub $t6,$t5,$t2
	li $s0,150
	add $t7,$s0,$zero
	
#conferis se anoAniversario é maior que atua e se a pessoa tem mais de 150 Anos
	bgt $t5,$t2,conferir
	j impossivel
	
conferir:	
	blt $t6,$t7,bissextoNiver
	j impossivel
	
impossivel:
	li $v0,4
	la $a0, msg7
	syscall
	j Fim
	
#verificar se anoNiver é bissexto
bissextoNiver:
	li $s2,400
	rem $s3,$s1,$s2
	beq $s3,$zero,somaBissextoNiver
	j caso2
	
caso2:
	li $s4,100
	rem $s5,$s1,$s4
	bne $s5,$zero,caso3
	j bissextoAtual
	
caso3:
	li $s6,4
	rem $s7,$s1,$s6
	beq $s7,$zero,somaBissextoNiver
	j bissextoAtual
	
somaBissextoNiver:
	li $t8,1
	add $t9,$t9,$t8
	j bissextoAtual
	
#verificar se anoAtual é bissexto
bissextoAtual:
	li $s2,400
	rem $s3,$t4,$s2
	beq $s3,$zero,somaBissextoAtual
	j caso12
	
caso12:
	li $s4,100
	rem $s5,$t4,$s4
	bne $s5,$zero,caso13
	j mesNiverIgual2
	
caso13:
	li $s6,4
	rem $s7,$t4,$s6
	beq $s7,$zero,somaBissextoAtual
	j mesNiverIgual2
	
somaBissextoAtual:
	li $t8,1
	add $t8,$t8,$zero
	j mesNiverIgual2


#verificaçao de casos
mesNiverIgual2:
	li $s1,02
	beq $t1,$s1,mesAtualIgualVindoDoNiverIgual2
	j mesNiverDiferente2
	
mesAtualIgualVindoDoNiverIgual2:
	li $s1,02
	beq $t4,$s1,mesIgualIgual
	j mesAtualDifrenteVindoDoNiverIgual2

mesAtualDifrenteVindoDoNiverIgual2:
	li $s1,02
	beq $t4,$s1,mesIgualDiferente
						
mesNiverDiferente2:
	li $s1,02
	bne $t1,$s1,mesAtualIgualVindoNiverDiferente2

mesAtualIgualVindoNiverDiferente2:
	li $s1,02
	beq $t4,$s1,mesDiferenteIgual
	j mesAtualDiferenteVindoNiverDiferente2

mesAtualDiferenteVindoNiverDiferente2
	li $s1,02
	bne $t4,$s1,mesDiferenteDiferente
	
#Condicionais para fevereiro
mesIgualIgual:
	beq
	
mesIgualDiferente:
	
mesDiferenteIgual:

mesDiferenteDiferente
	
	
	
	
iniciar:
#verificaçao condiçao dia atual maior que dia do aniversario
	bgt $t3,$t0,caso4
	j caso5
	
caso4:
#verificar se mes atual é maior que do aniversario
	blt $t1,$t4,resultado1 
	j opcao1
	
resultado1:
	sub $t0,$t3,$t0
	sub $t1,$t4,$t1
	sub $t6,$t5,$t2
	
#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall

#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
	j Fim
	
#verificar se o mes do aniversario é maior que o do atual
opcao1:
	bgt $t1,$t4,resultado2
	j opcao2
	
resultado2:
#dia
	sub $t0,$t3,$t0
#mes
	li $s1,12
	add $t4,$t4,$s1
	sub $t1,$t4,$t1
#ano
	li $s1,1
	sub $t6,$t5,$t2
	sub $t6,$t6,$s1
	
#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall

#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
	j Fim
	
opcao2:
#se o mes for igual ao outro
	beq $t1,$t4,resultado3
	
resultado3:
#dia
	sub $t0,$t3,$t0
#mes
	li $t1,0
#ano
	sub $t6,$t5,$t2
	
#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall

#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
	#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
	j Fim
	
caso5:
#verificaçao condiçao dia atual menor que dia do aniversario
	blt $t3,$t0,caso6	
	j caso7
	
caso6:
#Verificar mes do aniversario menor que o mes atual
	blt $t1,$t4,resultado4
	j opcao3
	
resultado4:
#dia
	li $s1,30	
	add $t3,$t3,$s1
	sub $t0,$t3,$t0
#mes
	li $s1,1
	sub $t1,$t4,$t1
	sub $t1,$t1,$s1
#ano
	sub $t6,$t5,$t2
	
#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall
	
#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	

#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
	j Fim
	
#verificar se mes do aniversario maior que mes atual
opcao3:
	bgt $t1,$t4,resultado5
	j opcao4
	
resultado5:
#dia
	li $s1,30	
	add $t3,$t3,$s1
	sub $t0,$t3,$t0
#mes
	li $s1,12
	add $t4,$t4,$s1
	li $s1,1
	sub $t1,$t4,$t1
	sub $t1,$t1,$s1
#ano
	li $s1,1
	sub $t6,$t5,$t2
	sub $t6,$t6,$s1
	
#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall
	
#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	

	j Fim
#verificar se os meses sao iguais
opcao4:
	beq $t1,$t4,resultado6
	
resultado6:
#dia
	add $t0,$t0,$t3
#mes
	li $s1,11
	add $t1,$s1,$zero
#ano
	li $s1,1
	sub $t6,$t5,$t2
	sub $t6,$t6,$s1
	
#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall
	
#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
	j Fim
	
caso7:
#verificar se dias sao iguais
	beq $t0,$t3,caso8
	j main

caso8:
#verificar se mes do aniversario  menor que o mes atual
	blt $t1,$t4,resultado7
	j opcao5
	
resultado7:
#dia
	li $t0,0
#mes
	sub $t1,$t4,$t1
#ano
	sub $t6,$t5,$t2
	
#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall
	
#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	

	j Fim
	
opcao5:
#verificar se mes do aniversario maior que o mes atual
	bgt $t1,$t4,resultado8
	j opcao6
	
resultado8:
#dia
	li $t0,0
#mes
	li $s1,12
	add $t4,$t4,$s1
	sub $t1,$t4,$t1
#ano
	li $s1,1
	sub $t6,$t5,$t2
	sub $t6,$t6,$s1

#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall
	
#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	

	j Fim

opcao6:
	beq $t1,$t4,resultado9
	
resultado9:
#dia
	li $t0,0
#mes
	li $t1,0
#ano
	li $s1,1
	sub $t6,$t5,$t2
	
#ano
	li $v0,4
	la $a0,msg8
	syscall
	li $v0,1
	add $a0,$zero,$t6
	syscall
	li $v0,4
	la $a0,msg10
	syscall
	li $v0,4
	la $a0,msg8
	syscall
	
#mes
	li $v0,1
	add $a0,$zero,$t1
	syscall
	li $v0,4
	la $a0,msg11
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	
#dia 
	li $v0,1
	add $a0,$zero,$t0
	syscall
	li $v0,4
	la $a0,msg12
	syscall
	li $v0,4
	la $a0,msg8
	syscall	
	j Fim
		
Fim:
	li $v0,4
	la $a0,msg9
	syscall	
	
