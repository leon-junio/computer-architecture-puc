main:
addi	$s1,$0,0
jal 	dois
nop
addi 	$s1,$v0,0
addi	$s1,$s1,1

#toda função tem Prologo, corpo, Epilogo
#inicio, meio, fim
dois:
#prologo
addi	$sp,$sp,-4
sw	$ra, 4($sp)
jal	um
#corpo
addi	$v0,$v0,1
lw	$ra, 4($sp)
#epilogo
addi	$sp,$sp,4
jr	$ra

um:
addi $v0,$zero,1
jr $ra
nop