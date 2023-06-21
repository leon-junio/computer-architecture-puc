.globl main

main:
addi $t0, $zero, 0x1001 #acessar endereço numero 1 da memoria
sll $t0, $t0, 16 #t0 é ponteiro para o endereço 1 da memoria
#s0 = n
#s1 = penultimo
#s2 = ultimo
addi $s0, $zero, 47 # n == 10
addi $t1, $zero, 1 # temp para checar n == 1
beq $s0, $t1, n1 #se n == 1 jump para n1
addi $t1, $zero, 2 # temp para checar n == 2
beq $s0, $t1, n2 #se n == 2 jump para n2
	#processo de loop
	addi $t1, $zero, 3
	addi $t8, $t1, -1 #aux do contador
	addi $t2, $zero, 0 #penultimo --> auxliar
	addi $t3, $zero, 1 #ultimo --> auxiliar
	sw $t2, 0($t0) #salva 0 na posição 1
	sw $t3, 4($t0) #salva 1 na posição 1
	loop:
		add $t4, $t2, $t3 #valor atual = penultimo + ultimo
		add $t2, $zero, $t3 #penultimo = ultimo
		add $t3, $zero, $t4 #ultimo = atual
		slt $t5, $t1, $s0 #0 < t1 --> true quando for falso pula para o fim
		beq $t5, $zero, fim
			addi $s0, $s0, -1 #i = i - 1
			sll $t5, $t8 , 2 #endereço para salvar na memoria
			add $t5, $t0, $t5
			addi $t8, $t8, 1 #aux = aux+1
			sw $t4, 0($t5) #salva o atual na memoria
			j loop #retorna para loop de while
n1:
sw $zero, 0($t0) #salva 0 na posição 1
j fim
n2:
sw $zero, 0($t0) #salva 0 na posição 1
addi $t1, $zero, 1 #armazena 1 na posicao 1
sw $t1, 4($t0) #salva 1 na posição 1
j fim
fim:
nop

.data
vet : .word 0