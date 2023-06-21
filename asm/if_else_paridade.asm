.text
.globl main
main:
addi	$s0, $zero,5
addi	$s1, $zero,2
mult	$s0, $s1
#mflo	$s2 carregar do LO
#mfhi	$s3 carregar do HI
andi	$t0,$s0,1
beq	$t0,$zero,par
addi	$s1, $s0, -1
j	fim
par:
addi 	$s1,$s0,1
fim:
nop
.data
x: .word 4
y: .word 2
z: .word -1
w: .word -1