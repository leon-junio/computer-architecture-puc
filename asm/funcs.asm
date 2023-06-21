.globl main
main:
addi $s0, $zero, 0x1001 #acessar endereço numero 1 da memoria
sll $s0, $s0, 16 #t0 é ponteiro para o endereço 1 da memoria
addi $s1, $s1, 10 #numero de elementos
add $a0, $zero, $s0 #arg 1 -- endereço
add $a1, $zero, $s1 #arg2 -- total elementos
jal potencia
j fim
potencia:
addi $sp, $sp, -8 #aloco espaço para dois numeros na pilha (2 * 4 == 8)
sw $s0, 8($sp) #salvo valor de s0 na stack
sw $s1, 4($sp) #salvo valor de s1 na stack
#criando variaveis internas a funcao
add $s0, $zero, $zero #contador - index 
addi $s1, $zero, 0 #resultado da potencia
loop:
mult $a0, $a0
mflo $t0
add $s1, $s1, $t0
addi $s0, $s0, 1
bne $s0, $a1, loop
add $v0, $zero, $s1 #valor de retorno
addi $sp, $sp, 8
lw $s0, 8($sp) #busco valor de s0 na stack
lw $s1, 4($sp) #busco valor de s1 na stack
jr $ra
fim:
sw $v0, 8($s0)
nop
.data
as : .word 2
bs : .word 4
cs : .word 0
