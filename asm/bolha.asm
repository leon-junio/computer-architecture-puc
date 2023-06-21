.globl main

main:
#iniciar vetor de testes
addi $t0, $zero, 4
sw $t0, vet+0
addi $t0, $zero, 1
sw $t0, vet+4
addi $t0, $zero, 8
sw $t0, vet+8
addi $t0, $zero, 5
sw $t0, vet+12
addi $t0, $zero, 7
sw $t0, vet+16
addi $t0, $zero, 10
sw $t0, vet+20
addi $t0, $zero, 2
sw $t0, vet+24
addi $t0, $zero, 9
sw $t0, vet+28
addi $t0, $zero, 3
sw $t0, vet+32
addi $t0, $zero, 6
sw $t0, vet+36

#sort bolha
#i --> s0
#j --> s1
#n --> s2

addi $s2, $zero, 10 #definindo n
addi $s0, $s2, -1 #start i com n-1
whilei:
slt $t0, $zero, $s0 # 0 < i -- se falso encerrar loop do whilei
beq $t0, $zero, fim
	add $s1, $zero, $zero #start j com zero
	whilej:
	slt $t1, $s1, $s0 # 0 < i -- se falso encerrar loop do whilej
	beq $t1, $zero, endwhilei #se falso vai encerrar o laço de j e ir pro fim do while i
		sll $t2, $s1, 2 #endereço j
		lw $t3, vet($t2) #salvar vet[j]
		lw $t4, vet+4($t2) #salvar vet[j+1]
		slt $t1, $t4, $t3  #se array[j+1] < array[j]  --> true se for menor e false se for maior
		beq $t1, $zero, endwhilej #se for falso a o valor de j para j+1 vai para fim do while j
			#swap
			sw $t4, vet($t2) #vet[j] = vet[j+1];
			sw $t3, vet+4($t2) #vet[j+1] = vet[j];
	endwhilej:
	addi $s1, $s1, 1 # j++
	j whilej #volta para inicio do while de j

endwhilei:
addi $s0, $s0, -1 # i--
j whilei #volta para inicio do while de i

fim:
nop

.data
vet : .word 0