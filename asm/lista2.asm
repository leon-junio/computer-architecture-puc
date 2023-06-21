.globl main

main:
addi $s1, $zero, 0x1001 #acessar endereço numero 1 da memoria
sll $s1, $s1, 16 #t0 é ponteiro para o endereço 1 da memoria
addi $t0, $zero, 10
add $t1, $zero, $zero
add $t4, $zero, $zero
loop:
slt $t2, $t1, $t0 #se t1 é menor que t2
beq $t2, $zero, fim
sll $t2, $t1, 2 #valor aux por 4
add $t2, $t2, $s1
lw  $t3, 0($t2) #salva valor do array
add $t4, $t4, $t3 #soma valores do array
addi $t1, $t1, 1 #aux - 1
j loop
fim:
sw $t4, 40($s1) #salva soma na memoria
.data
vet : .word 10 20 30 40 50 1 2 3 4 5