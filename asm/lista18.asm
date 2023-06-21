.globl main

main:
addi $t0, $zero, 0x1001 #acessar endereço numero 1 da memoria
sll $t0, $t0, 16 #t0 é ponteiro para o endereço 1 da memoria
lw $s0, 0($t0) #carrego numero da memoria

addi $t1, $s0, -50 #num - 50
slt  $t2, $t1, $zero # checo se for negativo ou positivo (neg -  true, pos/== - falso)
bne $t2, $zero, teste2
	 addi $t1, $s0, -100 #num - 50
	 slt  $t2, $zero, $t1  # checo se for negativo ou positivo (neg/0 -  false, pos - true)
	 bne $t2, $zero, teste2
	 	#flag recebe 1
	 	addi $s1, $zero, 1 #flag recebe 1
	 	j fim
teste2:
addi $t1, $s0, -150 #num - 50
slt  $t2, $t1, $zero # checo se for negativo ou positivo (neg -  true, pos/== - falso)
bne $t2, $zero, else
	 addi $t1, $s0, -200 #num - 50
	 slt  $t2, $zero, $t1  # checo se for negativo ou positivo (neg/0 -  false, pos - true)
	 bne $t2, $zero, else
	 	#flag recebe 1
	 	addi $s1, $zero, 1 #flag recebe 1
	 	j fim
	 	
else:
addi $s1, $zero, 0 #flag recebe 1
fim:
nop

.data
num : .word 200
